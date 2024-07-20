import 'package:delivery_management/styles/theme.dart';
import 'package:flutter/material.dart';

class TextFieldAuthWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hinText;
  final bool obscureText;
  final TextInputType keyboardType;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  //final String? errorMsg;
  final AutovalidateMode autovalidateMode;

  const TextFieldAuthWidget({super.key,
    required this.controller,
    required this.hinText,
    required this.obscureText,
    required this.keyboardType,
    this.validator,
    //this.errorMsg,
    this.prefixIcon,
    this.suffixIcon,
    this.autovalidateMode = AutovalidateMode.disabled
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      textInputAction: TextInputAction.next,
      autovalidateMode: autovalidateMode,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey[100]!, width: 0,),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.green, width: 1),
        ),
        fillColor: Colors.grey[100],
        filled: true,
        hintText: hinText,
        hintStyle: TextStyle(color: Colors.grey[500]),
        //errorText: errorMsg,
      ),
    );
  }
}
