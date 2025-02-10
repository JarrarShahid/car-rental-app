// db_helper.dart - Handles user authentication storage
import 'package:shared_preferences/shared_preferences.dart';

class DBHelper {
  Future<void> saveUser(String name, String email, String contact, String password) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', name);
    await prefs.setString('email', email);
    await prefs.setString('contact', contact);
    await prefs.setString('password', password);
  }

  Future<Map<String, String?>> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      'name': prefs.getString('name'),
      'email': prefs.getString('email'),
      'contact': prefs.getString('contact'),
      'password': prefs.getString('password'),
    };
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}