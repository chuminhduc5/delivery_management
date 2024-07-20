import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../apis/api_endpoint.dart';
import '../models/delivery_status.dart';

class DeliveryStatusService {
  // TODO: Lấy Token
  Future<String> _getToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth_token');
    if (token == null) {
      throw Exception('No token found');
    }
    return token;
  }

  // TODO: Call API Fetch data Delivery Status
  Future<List<DeliveryStatus>> fetchDeliveryStatus() async {
    // Lấy token đã lưu
    final token = await _getToken();

    // Call API fetch Data
    const url = ApiEndpoint.GET_DELIVERY_STATUS;
    final uri = Uri.parse(url);
    final response = await http.get(
        uri,
        headers: <String, String>{
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json; charset=UTF-8',
        }
    );
    if (response.statusCode == 200) {
      final List<dynamic> responseBody = jsonDecode(response.body)['data'];
      return responseBody.map((json) => DeliveryStatus.fromMap(json)).toList();
    } else {
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      throw Exception('Faild to load delivery status list');
    }
  }

  // TODO: Call API Update Status
  Future<void> updateDeliveryStatus(String deliveryId, String deliveryStatusId) async {
    // Lấy token đã lưu
    final token = await _getToken();

    // Call API
    const url = ApiEndpoint.POST_UPDATE_STATUS;
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