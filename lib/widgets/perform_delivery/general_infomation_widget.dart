import 'package:flutter/material.dart';

class GeneralInfomationWidget extends StatelessWidget {
  const GeneralInfomationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(12),
      child: Row(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 10),
            padding: const EdgeInsets.only(right: 10),
            decoration: const BoxDecoration(
              border: Border(
                right: BorderSide(
                  width: 1,
                  color: Colors.black,
                ),
              ),
            ),
            child: const Text(
              'TT chung',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const Text(
            'Hàng hóa',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.cyan),
          ),
        ],
      ),
    );
  }
}
