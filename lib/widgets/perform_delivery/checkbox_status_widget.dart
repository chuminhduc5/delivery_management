import 'package:flutter/material.dart';
import '../../styles/theme.dart';

class CheckboxStatusWidget extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;
  final String title;

  const CheckboxStatusWidget(
      {super.key,
      required this.value,
      required this.onChanged,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      contentPadding: EdgeInsets.zero,
      // đẩy ô checkbox lên trước
      //controlAffinity: ListTileControlAffinity.leading,
      // Tùy chỉnh chiều cao và chiều rộng
      visualDensity: const VisualDensity(vertical: -4.0),
      // Thay đổi màu viền
      side: const BorderSide(color: Colors.grey),
      activeColor: AppColors.activeColor,
      checkColor: AppColors.checkColor,
      value: value,
      onChanged: onChanged,
      title: Transform.translate(
          offset: const Offset(0, 0),
          child: Text(
            title,
            style: const TextStyle(fontSize: 14),
          )),
      dense: true,
    );
  }
}
