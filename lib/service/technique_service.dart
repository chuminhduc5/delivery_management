import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class TechniqueService {
  Future<List<dynamic>> fetchTechnique() async {
    // Lấy token đã lưu
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth_token');
    if (token == null){
      throw Exception('No token found');
    }

    final url = 'http://192.168.68.201:5001/api/v1/TblTestingTechniqueHeader/get-list?Take=8';
    final uri = Uri.parse(url);
    final reponse = await http.get(
        uri,
        headers: <String, String> {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json; charset=UTF-8',
        }
    );
    if (reponse.statusCode == 200){
      final Map<String, dynamic>result = jsonDecode(reponse.body);
      return result['data'];
    } else {
      print('Response status: ${reponse.statusCode}');
      print('Response body: ${reponse.body}');
      throw Exception('Faild to load technique list');
    }
  }

}
