import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../apis/api_endpoint.dart';
import '../models/technique.dart';

class TechniqueService {
  Future<List<Technique>> fetchTechnique() async {
    // Lấy token đã lưu
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth_token');
    if (token == null){
      throw Exception('No token found');
    }

    const url = ApiEndpoint.GET_LIST_TECHNIQUE;
    final uri = Uri.parse(url);
    final response = await http.get(
        uri,
        headers: <String, String> {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json; charset=UTF-8',
        }
    );
    if (response.statusCode == 200){
      final List<dynamic> responseBody = jsonDecode(response.body)['data'];
      return responseBody.map((json) => Technique.fromMap(json)).toList();
    } else {
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      throw Exception('Faild to load technique list');
    }
  }

}
