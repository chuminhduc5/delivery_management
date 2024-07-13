import 'package:flutter/material.dart';
import '../../styles/theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Center(
          child: Text('Home')
      ),
    );
  }
}
