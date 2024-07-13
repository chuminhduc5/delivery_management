import 'package:flutter/material.dart';

import '../../styles/theme.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: AppColors.bgColor,
        body: Center(child: Text('ReportScreen')));
  }
}