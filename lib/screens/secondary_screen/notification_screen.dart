import 'package:delivery_management/styles/theme.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgAppbar,
        title: const Text('Thông báo', style: TextStyle(fontSize: 20, color: AppColors.textWhile)),
        iconTheme: const IconThemeData(color: AppColors.white),
      ),
      body: Container(
        child: const Center(child: Text('Không có thông báo nào')),
      ),
    );
  }
}
