import 'package:flutter/material.dart';

class SelectReturnedGoodWidget extends StatefulWidget {
  const SelectReturnedGoodWidget({super.key});

  @override
  State<SelectReturnedGoodWidget> createState() => _SelectReturnedGoodWidgetState();
}

class _SelectReturnedGoodWidgetState extends State<SelectReturnedGoodWidget> {
  final List<String> _branches = [
    'Chọn',
    'KH trả lại 1 phần',
    'KH trả lại cả đơn',
  ];

  String _selectedItem = "Chọn";
  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      initialSelection: _selectedItem,
      width: 150,
      onSelected: (String? value) {
        setState(() {
          _selectedItem = value!;
        });
      },
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      dropdownMenuEntries:
      _branches.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(
          value: value,
          label: value,
          style: MenuItemButton.styleFrom(
            foregroundColor: Colors.black,
            //backgroundColor: Colors.white,
          ),
        );
      }).toList(),
    );
  }
}
