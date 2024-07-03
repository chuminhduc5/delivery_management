import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DeliveryOrderListWidget extends StatefulWidget {
  const DeliveryOrderListWidget({super.key});

  @override
  State<DeliveryOrderListWidget> createState() => _DeliveryOrderListWidgetState();
}

class _DeliveryOrderListWidgetState extends State<DeliveryOrderListWidget> {
  bool isLoading = true;
  List items = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    final double maxWidthScreen = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Center(child: Text('Todo List')),
      ),
      body: Visibility(
        visible: isLoading,
        replacement: RefreshIndicator(
          onRefresh: fetchData,
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index] as Map;
              return ListTile(
                leading: CircleAvatar(child: Text('${index + 1}')),
                title: Text(item['status']),
                subtitle: Text(item['description']),
              );
            },
          ),
        ),
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }

  // Fetch data
  Future<void> fetchData() async {
    const url = "http://192.168.68.201:5001/api/v1/TblDelivery/get-all";
    final uri = Uri.parse(url);
    const token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImRlbW8tdHRzIiwiaWQiOiIxNCIsIklwQWRkcmVzcyI6IjEwLjQyLjAuMSIsImV4cCI6MTcyMDM5MzIxNSwiaXNzIjoiaHR0cDovL2xvY2FsaG9zdCIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3QifQ.Q0OlYq853lmN1I0I8rn57h2wXRVnqs90_gxXt_LySBk";

    final response = await http.get(
      uri,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    // Show data
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map;
      final result = json['items'] as List;
      setState(() {
        items = result;
        print(result);
      });
    } else {
      // Handle errors
      print('Error: ${response.statusCode}');
    }

    setState(() {
      isLoading = false;
    });
  }
}
