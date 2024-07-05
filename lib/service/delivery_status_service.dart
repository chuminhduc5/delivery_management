import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class DeliveryStatusService {
  Future<List<dynamic>> fetchDeliveryStatus() async {
    // Lấy token đã lưu
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth_token');
    if (token == null) {
      throw Exception('No token found');
    }

    // Call API fetch Data
    final url = 'http://apis-dev.hacom.local/api-mdm/api/v1/TblDmDeliveryStatus/get-all';
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
      throw Exception('Faild to load delivery list');
    }
  }
}