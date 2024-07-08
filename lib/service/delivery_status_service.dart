import 'dart:convert';

import 'package:delivery_management/const/api_delivery.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class DeliveryStatusService {
  // TODO: Call API Fetch data
  Future<List<dynamic>> fetchDeliveryStatus() async {
    // Lấy token đã lưu
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth_token');
    if (token == null) {
      throw Exception('No token found');
    }

    // Call API fetch Data
    const url = ApiDelivery.GET_ALL_DELIVERY_STATUS;
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

  // TODO: Call API Update Status
  Future<void> updateDeliveryStatus(int deliveryId, int deliveryStatusId) async {
    // Lấy token đã lưu
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth_token');
    if (token == null) {
      throw Exception('No token found');
    }

    // Call API
    const url = ApiDelivery.POST_UPDATE_STATUS;
    final uri = Uri.parse(url);
    final response = await http.post(
        uri,
        headers: <String, String>{
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'deliveryId': deliveryId,
          'deliveryStatusId': deliveryStatusId,
        })
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic>responseBody = jsonDecode(response.body);
      if (!responseBody['success']) {
        throw Exception('Failed to update delivery status: ${responseBody['message']}');
      }
    } else {
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      throw Exception('Faild to load delivery list');
    }
  }
}