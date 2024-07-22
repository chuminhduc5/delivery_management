import 'package:flutter/material.dart';

import '../../styles/theme.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.bgColor,
        appBar: AppBar(
          backgroundColor: AppColors.bgAppbar,
          flexibleSpace: const Center(
              child: Text(
            'Báo cáo',
            style: TextStyle(fontSize: 20, color: AppColors.textWhile),
          )),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/notification');
                },
                icon: const Icon(Icons.notifications))
          ],
          iconTheme: const IconThemeData(color: AppColors.white),
        ),
        body: const Center(child: Text('ReportScreen')));
  }
}
