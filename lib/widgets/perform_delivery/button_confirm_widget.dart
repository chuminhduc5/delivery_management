import 'package:flutter/material.dart';

class ButtonConfirmWidget extends StatelessWidget {
  final Function() onPressed;
  final double sizeWidth;
  const ButtonConfirmWidget({super.key, required this.onPressed, required this.sizeWidth});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: sizeWidth,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.indigo,
          padding: const EdgeInsets.all(20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: const Text(
          'Xác nhận',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
