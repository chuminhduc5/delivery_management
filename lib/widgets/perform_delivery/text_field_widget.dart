import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hinText;
  final TextInputType keyboardType;

  const TextFieldWidget({super.key, required this.controller, required this.hinText, required this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        //contentPadding: EdgeInsets.zero,
          hintText: hinText,
          hintStyle: TextStyle(color: Colors.grey[500]),
          isDense: true,
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.black
              )
          )
      ),
    );
  }
}
