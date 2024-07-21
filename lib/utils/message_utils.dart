import 'package:flutter/material.dart';

class MessageUtils {
  static void errorMessageUtils(BuildContext context, {required String message}){
    final errorMessage = SnackBar(
      content: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.red,
    );
    ScaffoldMessenger.of(context).showSnackBar(errorMessage);
  }

  static void successMessageUtils (BuildContext context, {required String message}){
    final successMessage = SnackBar(
      content: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.green,
    );
    ScaffoldMessenger.of(context).showSnackBar(successMessage);
  }
}

