import 'package:delivery_management/widgets/perform_delivery/select_reason_return_widget.dart';
import 'package:flutter/material.dart';
import '../../styles/theme.dart';
import '../../widgets/perform_delivery/billing_infomation_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.bgColor,
        appBar: AppBar(
          title: Text(""),
        ),
        body: const Center(
          child: Text('HomeScreen'),
        )
    );
  }
}
