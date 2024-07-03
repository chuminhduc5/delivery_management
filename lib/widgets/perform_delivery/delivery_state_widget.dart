import 'package:flutter/material.dart';

import '../../styles/theme.dart';

class TransportStateWidget extends StatefulWidget {
  const   TransportStateWidget({super.key});

  @override
  State<TransportStateWidget> createState() => _TransportStateWidgetState();
}

class _TransportStateWidgetState extends State<TransportStateWidget> {
  bool checkDelivery = false;
  bool checkArrive = false;
  bool checkUnsuccessCustomers = false;
  bool checkUnsuccessHC = false;
  bool checkDelivered = false;
  bool checkSuccess = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 5/9,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Tình trạng vận chuyển:'),
                CheckboxListTile(
                  contentPadding: EdgeInsets.zero,
                  controlAffinity: ListTileControlAffinity.leading, // đẩy ô checkbox lên trước
                  visualDensity: const VisualDensity(vertical:-4.0), // Tùy chỉnh chiều cao và chiều rộng
                  side: const BorderSide(color: Colors.grey), // Thay đổi màu viền
                  activeColor: AppColors.bgCheckBox,
                  checkColor: Colors.white,
                  value: checkDelivery,
                  onChanged: (bool? value) {
                    setState(() {
                      checkDelivery = value!;
                    });
                  },
                  title: Transform.translate(
                      offset: const Offset(-15, 0),
                      child: const Text('Đang giao hàng', style: TextStyle(fontSize: 14),)
                  ),
                  dense: true, //Giảm khoảng cách
                ),
                CheckboxListTile(
                  contentPadding: EdgeInsets.zero,
                  controlAffinity: ListTileControlAffinity.leading,
                  visualDensity: const VisualDensity(vertical:-4.0),
                  side: const BorderSide(color: Colors.grey),
                  activeColor: AppColors.bgCheckBox,
                  checkColor: Colors.white,
                  value: checkArrive,
                  onChanged: (bool? value) {
                    setState(() {
                      checkArrive = value!;
                    });
                  },
                  title: Transform.translate(
                      offset: const Offset(-15, 0),
                      child: const Text('Đã đến nơi', style: TextStyle(fontSize: 14),)
                  ),
                  dense: true,
                ),
                CheckboxListTile(
                  contentPadding: EdgeInsets.zero,
                  controlAffinity: ListTileControlAffinity.leading,
                  visualDensity: const VisualDensity(vertical:-4.0),
                  side: const BorderSide(color: Colors.grey),
                  activeColor: AppColors.bgCheckBox,
                  checkColor: Colors.white,
                  value: checkUnsuccessCustomers,
                  onChanged: (bool? value) {
                    setState(() {
                      checkUnsuccessCustomers = value!;
                    });
                  },
                  title: Transform.translate(
                      offset: const Offset(-15, 0),
                      child: const Text('ĐH giao chưa thành công do KH', style: TextStyle(fontSize: 14),)
                  ),
                  dense: true,
                ),
                CheckboxListTile(
                  contentPadding: EdgeInsets.zero,
                  controlAffinity: ListTileControlAffinity.leading,
                  visualDensity: const VisualDensity(vertical:-4.0),
                  side: const BorderSide(color: Colors.grey),
                  activeColor: AppColors.bgCheckBox,
                  checkColor: Colors.white,
                  value: checkUnsuccessHC,
                  onChanged: (bool? value) {
                    setState(() {
                      checkUnsuccessHC = value!;
                    });
                  },
                  title: Transform.translate(
                      offset: const Offset(-15, 0),
                      child: const Text('DH giao chưa thành công do HC', style: TextStyle(fontSize: 14),)
                  ),
                  dense: true,
                ),
                CheckboxListTile(
                  contentPadding: EdgeInsets.zero,
                  controlAffinity: ListTileControlAffinity.leading,
                  visualDensity: const VisualDensity(vertical:-4.0),
                  side: const BorderSide(color: Colors.grey),
                  activeColor: AppColors.bgCheckBox,
                  checkColor: Colors.white,
                  value: checkSuccess,
                  onChanged: (bool? value) {
                    setState(() {
                      checkSuccess = value!;
                    });
                  },
                  title: Transform.translate(
                      offset: const Offset(-15, 0),
                      child: const Text('Hàng đã giao - nối chuyến', style: TextStyle(fontSize: 14),)
                  ),
                  dense: true,
                ),
                CheckboxListTile(
                  contentPadding: EdgeInsets.zero,
                  controlAffinity: ListTileControlAffinity.leading,
                  visualDensity: const VisualDensity(vertical:-4.0),
                  side: const BorderSide(color: Colors.grey),
                  activeColor: AppColors.bgCheckBox,
                  checkColor: Colors.white,
                  value: checkDelivered,
                  onChanged: (bool? value) {
                    setState(() {
                      checkDelivered = value!;
                    });
                  },
                  title: Transform.translate(
                      offset: const Offset(-15, 0),
                      child: const Text('Hàng đã giao', style: TextStyle(fontSize: 14),)
                  ),
                  dense: true,
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Hàng trả lại:'),
                const SizedBox(height: 5,),
                _selectReturnedGoods(),
                const SizedBox(height: 10,),
                const Text('Lý do trả lại:'),
                const SizedBox(height: 5,),
                _selectResson(),
                const SizedBox(height: 5,),
                _selectRessonSeccond(),
              ],
            ),
          )
        ],
      ),
    );
  }
  Widget _selectReturnedGoods() {
    final List<String> _branches = [
      'Chọn',
      'KH trả lại 1 phần',
      'KH trả lại cả đơn',
    ];

    String _selectedItem = "Chọn";
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

  Widget _selectResson() {
    final List<String> _reason = [
      'Chọn',
      'Hoàn hàng TIKI',
    ];

    String _selectedItem = "Chọn";
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
      _reason.map<DropdownMenuEntry<String>>((String value) {
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

  Widget _selectRessonSeccond() {
    final List<String> _reasonSeccond = [
      'Chọn',
      'Không xuất hóa đơn',
    ];

    String _selectedItem = "Chọn";
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
      _reasonSeccond.map<DropdownMenuEntry<String>>((String value) {
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
