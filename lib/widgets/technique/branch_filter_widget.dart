import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BranchFilterWidget extends StatefulWidget {
  //final ValueChanged<String> onChanged;
  const BranchFilterWidget({super.key});

  @override
  State<BranchFilterWidget> createState() => _BranchFilterWidgetState();
}

class _BranchFilterWidgetState extends State<BranchFilterWidget> {
  final List<String> _branches = [
    'Kho tổng Hai Bà Trưng',
    'Kho tổng Hoàng Mai',
    'Kho tổng Thanh Xuân',
  ];

  String _selectedItem = "Kho tổng Hai Bà Trưng";

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
            backgroundColor: Colors.white,
          ),

        );
      }).toList(),
    );
  }

}
