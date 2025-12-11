import 'dart:developer' as developer;

import 'package:shared_preferences/shared_preferences.dart';


class SharedPreferencesHelper {
  static Future<void> saveToken(String token) async {
    developer.log('saveToken: $token');
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('jwt_token', token);
  }

  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('jwt_token');
    developer.log('getToken: $token');
    return token;
  }
}
