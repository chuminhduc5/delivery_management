import 'package:delivery_management/widgets/common_widget/search_field_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../styles/theme.dart';

class HomeScreen extends StatefulWidget {
  final String fullName;

  const HomeScreen({super.key, required this.fullName});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _searchDeliveryOrder = '';

  void _updateDeliveryOrder(String newDeliveryOrder) {
    setState(() {
      _searchDeliveryOrder = newDeliveryOrder;
    });
  }

  String getInitials(String fullName) {
    List<String> names = fullName.split(' ');
    if (names.length == 1) {
      return names[0][0].toUpperCase();
    } else {
      return names[0][0].toUpperCase() + names[1][0].toUpperCase();
    }
  }

  @override
  Widget build(BuildContext context) {
    final double maxScreenWidth = MediaQuery.of(context).size.width;
    String initials = getInitials(widget.fullName);
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        // leading: CircleAvatar(
        //   radius: 20,
        //   backgroundColor: Colors.grey[300],
        //   child: Text(
        //     initials,
        //     style: const TextStyle(
        //       fontSize: 24,
        //       fontWeight: FontWeight.bold,
        //       color: Colors.black,
        //     ),
        //   ),
        // ),
        title: Text(
          'Hi, ${widget.fullName}',
          style: const TextStyle(fontSize: 18),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/notification');
              },
              icon: const Icon(Icons.notifications))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: SearchFieldWidget(
                  size: maxScreenWidth,
                  hintText: 'Tìm kiếm',
                  onChanged: _updateDeliveryOrder,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                width: maxScreenWidth,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.bgInfoDelivery,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _build(const Icon(Icons.shopping_cart_outlined, color: AppColors.green), 'Bán hàng', (){
                      Navigator.pushNamed(context, '/sellOptions');
                    }),
                    _build(const Icon(Icons.card_giftcard, color: AppColors.green), 'Khuyến mãi', (){}),
                    _build(const Icon(Icons.qr_code_2, color: AppColors.green), 'Quét mã QR', (){}),
                    _build(const Icon(Icons.menu_book, color: AppColors.green), 'Khám phá', (){}),
                  ],
                ),
              ),
            )
          ]
        ),
      )
    );
  }

  Widget _build(Widget icon, String title, VoidCallback onTap){
    return InkWell(
      onTap: onTap,
      child: Container(
        child: Column(
          children: [
            icon,
            Text(title, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w300, color: Colors.green),)
          ],
        ),
      ),
    );
  }

}



