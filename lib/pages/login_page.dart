import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import 'signup_page.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _userCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  bool _hasAccount = false;

  @override
  void initState() {
    super.initState();
    _checkAccount();
  }

  Future<void> _checkAccount() async {
    final exists = await AuthService.hasAccount();
    if (mounted) setState(() => _hasAccount = exists);
  }

  Future<void> _showAlert(String title, String message) async {
    await showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('OK')),
        ],
      ),
    );
  }

  Future<void> _handleLogin() async {
    if (!_formKey.currentState!.validate()) return;
    final ok = await AuthService.login(_userCtrl.text.trim(), _passCtrl.text);
    if (!mounted) return;
    if (ok) {
      await _showAlert('Log In Successful!', 'Welcome back, ${_userCtrl.text}!');
      if (!mounted) return;
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HomePage()));
    } else {
      await _showAlert('Log In Failed!', 'Wrong username or password.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 420),
            child: Card(
              elevation: 1,
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 12),
                      const Text('Welcome', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      const Text('Please sign in to continue.'),
                      const SizedBox(height: 24),
                      TextFormField(
                        controller: _userCtrl,
                        decoration: const InputDecoration(
                          labelText: 'Username',
                          border: OutlineInputBorder(),
                        ),
                        validator: (v) => (v == null || v.isEmpty) ? 'Enter username' : null,
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        controller: _passCtrl,
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(),
                        ),
                        validator: (v) => (v == null || v.isEmpty) ? 'Enter password' : null,
                      ),
                      const SizedBox(height: 16),
                      FilledButton.icon(
                        icon: const Icon(Icons.login),
                        label: const Text('Login'),
                        onPressed: _handleLogin,
                      ),
                      const SizedBox(height: 8),
                      if (!_hasAccount)
                        TextButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (_) => const SignUpPage()));
                          },
                          child: const Text('Sign Up'),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
