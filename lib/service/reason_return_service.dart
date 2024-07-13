import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../apis/api_endpoint.dart';

class ReasonReturnService {
  // TODO: Call API fetch data Reason return
  Future<List<dynamic>> fetchReasonReturn () async{
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth_token');
    if (token == null) {
      throw Exception('Token not found');
    }

    const url = ApiEndpoint.GET_REASON_RETURN;
    final uri = Uri.parse(url);
    final response = await http.get(
      uri,
      headers: <String, String>{
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json; charset=UTF-8',
      }
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic>responseBody = jsonDecode(response.body);
      return responseBody['data'];
    } else {
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      throw Exception('Faild to load reason return list');
    }
  }
}