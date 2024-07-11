import 'package:flutter/material.dart';

import '../../styles/theme.dart';

class ButtonConfirmWidget extends StatelessWidget {
  final Function() onPressed;
  const ButtonConfirmWidget({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: AppColors.textWhile,
          backgroundColor: AppColors.bgButton,
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
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
