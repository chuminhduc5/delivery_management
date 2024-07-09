import 'package:flutter/material.dart';

class SearchFieldWidget extends StatelessWidget {
  final double size;
  final String hintText;
  final Widget? suffixIcon;
  final ValueChanged<String> onChanged;

  const SearchFieldWidget(
      {required this.size,
        required this.hintText,
        this.suffixIcon,
        required this.onChanged,
        super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(16),
            suffixIcon: suffixIcon,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.grey,
                width: 0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.black, width: 2),
            ),
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.grey, fontSize: 13)
        ),
      ),
    );
  }
}
