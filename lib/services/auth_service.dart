import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static const _kUsername = 'username';
  static const _kPassword = 'password';
  static const _kLoggedIn = 'loggedIn';

  static Future<bool> hasAccount() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(_kUsername) && prefs.containsKey(_kPassword);
  }

  static Future<void> signUp(String username, String password) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_kUsername, username);
    await prefs.setString(_kPassword, password);
  }

  static Future<bool> login(String username, String password) async {
    final prefs = await SharedPreferences.getInstance();
    final u = prefs.getString(_kUsername);
    final p = prefs.getString(_kPassword);
    final ok = (u == username && p == password);
    if (ok) {
      await prefs.setBool(_kLoggedIn, true);
    }
    return ok;
  }

  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_kLoggedIn, false);
  }
}
