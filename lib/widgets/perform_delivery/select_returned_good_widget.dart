import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../../styles/theme.dart';

class SelectReturnedGoodWidget extends StatefulWidget {
  const SelectReturnedGoodWidget({super.key});

  @override
  State<SelectReturnedGoodWidget> createState() => _SelectReturnedGoodWidgetState();
}

class _SelectReturnedGoodWidgetState extends State<SelectReturnedGoodWidget> {
  final List<String> items = [
    'Khách trả lại một phần',
    'Khách trả lại tất cả'
  ];
  String? selectedValue;
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final double maxWidthScreen = MediaQuery.of(context).size.width;

    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        isExpanded: true,
        hint: const Text(
          'Hàng trả lại',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
        items: items
            .map((String item) => DropdownMenuItem<String>(
          value: item,
          child: Text(
            item,
            style: const TextStyle(
              fontSize: 13,
            ),
          ),
        ))
            .toList(),
        value: selectedValue,
        onChanged: (String? value) {
          setState(() {
            selectedValue = value;
            _isExpanded = !_isExpanded;
          });
        },
        buttonStyleData: ButtonStyleData(
          height: 45,
          width: maxWidthScreen,
          padding: const EdgeInsets.only(left: 14, right: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: AppColors.bgAppbar,
            ),
            color: Colors.white,
          ),
          elevation: 10,
        ),
        iconStyleData: IconStyleData(
          icon: Transform.rotate(
            angle: _isExpanded ? 3.14 / 2 : 0.0,
            child: const Icon(
              Icons.arrow_forward_ios_outlined,
              size: 14,
            ),
          ),
          iconSize: 14,
        ),
        dropdownStyleData: DropdownStyleData(
          maxHeight: 70,
          width: maxWidthScreen * 0.92,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          offset: const Offset(0, -10),
          scrollbarTheme: ScrollbarThemeData(
            radius: const Radius.circular(40),
            thickness: WidgetStateProperty.all(6),
            thumbVisibility: WidgetStateProperty.all(true),
          ),
        ),
        menuItemStyleData: MenuItemStyleData(
          height: 30,
          overlayColor: WidgetStateProperty.all(AppColors.greenWithOpacity),
        ),
      ),
    );
  }
}
