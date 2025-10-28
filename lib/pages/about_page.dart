import 'package:flutter/material.dart';
import 'package:department_app/services/auth_service.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  String? username;
  String? password;
  bool obscure = true; // şifre görünür/gizli durumu

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  // Kullanıcı verilerini asenkron olarak yükler
  Future<void> _loadUserData() async {
    final u = await AuthService.getUsername();
    final p = await AuthService.getPassword();
    
    // Widget'ın hala ağaçta olduğundan emin ol (sayfa kapatılmadıysa)
    if (mounted) {
      setState(() {
        username = u;
        password = p;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 600, 
            maxHeight: screenSize.height * 0.85, 
          ),

          child: Container(
            decoration: BoxDecoration(
              color: Colors.white, 
              borderRadius: BorderRadius.circular(12.0), 
              boxShadow: [ 
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  spreadRadius: 2,
                )
              ],
            ),

            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0), 
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, 
                mainAxisSize: MainAxisSize.min, 
                children: [
/*
                  const Text(
                    'About',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    "This application is made for the Introduction to Mobile Programming 1 homework.",
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Features: Login/Register, Searching for instructors, Zooming infrastructure images, List of courses.',
                  ),
                         

                  const SizedBox(height: 24), 
 */
                 
                  const Text(
                    'User Info',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),

                  // Username
                  ListTile(
                    leading: const Icon(Icons.person),
                    title: const Text("Username"),
                    subtitle: Text(username ?? "Not found"),
                  ),

                  // Password
                  ListTile(
                    leading: const Icon(Icons.lock),
                    title: const Text("Password"),
                    subtitle: Text(
                      obscure ? "●●●●●●●●" : (password ?? ""),
                    ),
                    trailing: IconButton(
                      icon: Icon(obscure ? Icons.visibility : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          obscure = !obscure;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}