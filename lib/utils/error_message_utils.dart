import 'package:flutter/material.dart';

void errorMessageUtils(BuildContext context, {required String message}){
  final errorMessage = SnackBar(
    content: Text(
      message,
      style: const TextStyle(color: Colors.white),
    ),
    backgroundColor: Colors.red,
  );
  ScaffoldMessenger.of(context).showSnackBar(errorMessage);
}