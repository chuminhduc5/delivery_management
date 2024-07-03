import 'package:flutter/material.dart';

import '../styles/theme.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: AppColors.bgColor,
        body: Center(child: Text('OrderScreen')));
  }
}
