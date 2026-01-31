import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../models/user.dart';

class ApiService {
  static String get baseUrl {
    if (kIsWeb) {
      return "http://192.168.0.205:8000";
    } else if (Platform.isAndroid) {
      return "http://192.168.0.205:8000";
    } else if (Platform.isWindows) {
      return "http://localhost:8000";
    }
    return "http://192.168.0.205:8000";
  }

  static Future<User?> signup(String username, String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/signup'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'username': username,
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 201) {
        return User.fromJson(jsonDecode(response.body));
      } else {
        final error = jsonDecode(response.body)['detail'];
        throw Exception(error ?? "Failed to signup");
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future<User?> login(String username, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'username': username,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        return User.fromJson(jsonDecode(response.body));
      } else {
        final error = jsonDecode(response.body)['detail'];
        throw Exception(error ?? "Invalid credentials");
      }
    } catch (e) {
      rethrow;
    }
  }
}
