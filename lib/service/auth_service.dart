import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  Future<String> authenticateUser(String username, String password) async {
    final url = 'http://apis-dev.hacom.local/api-master/api/v1/Auth/login';
    final uri = Uri.parse(url);
    final response = await http.post(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'username': username,
          'password': password,
          'remember': true,
        }));
    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);
      return responseBody['data']['jwt']; // Thay đổi tùy thuộc vào cấu trúc JSON
    } else {
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}'); // Log response body để xem chi tiết
      throw Exception('Failed to login');
    }
  }

  // Lưu Token
  Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_token', token);
  }

  // Lấy token ra
  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth_token');
  }
}
