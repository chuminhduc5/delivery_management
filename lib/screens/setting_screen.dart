import 'package:flutter/material.dart';

import '../styles/theme.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: AppColors.bgColor,
        body: Center(child: Text('SettingScreen')));
  }
}