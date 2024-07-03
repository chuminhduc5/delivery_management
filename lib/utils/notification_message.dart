import 'package:flutter/material.dart';

void notificationMessage(BuildContext context, {required String message}){
  final notification = SnackBar(
    content: Text(
      message,
      style: const TextStyle(color: Colors.white),
    ),
    backgroundColor: Colors.red,
  );
  ScaffoldMessenger.of(context).showSnackBar(notification);
}