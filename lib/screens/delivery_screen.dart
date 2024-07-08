import 'package:flutter/material.dart';
import '../styles/theme.dart';
import '../widgets/delivery_order_list_widget.dart';
import '../widgets/order_detail_widget.dart';
import '../widgets/search_field_widget.dart';

class DeliveryScreen extends StatefulWidget {
  const DeliveryScreen({super.key});

  @override
  State<DeliveryScreen> createState() => _DeliveryScreenState();
}

class _DeliveryScreenState extends State<DeliveryScreen> {
  String _searchDeliveryOrder = '';

  void _updateDeliveryOrder(String newDeliveryOrder) {
    setState(() {
      _searchDeliveryOrder = newDeliveryOrder;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double maxWidthScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgAppbar,
        title: const Center(
          child: Text(
            'Danh sách đơn giao hàng',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(10),
              child: SearchFieldWidget(
                  size: maxWidthScreen * 0.95,
                  hintText: 'Tìm kiếm',
                  suffixIcon: const Icon(Icons.search),
                  onChanged: _updateDeliveryOrder
              ),
            ),
            //DeliveryOrderListWidget(searchDeliveryOrder: _searchDeliveryOrder),
            const DeliveryOrderListWidget(),
            const SizedBox(height: 50),
            const OrderDetailWidget(),
          ],
        ),
      ),
    );
  }
}


