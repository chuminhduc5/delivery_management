import 'package:flutter/material.dart';
import '../../styles/theme.dart';
import '../../widgets/delivery/bill_of_landing_info_widget.dart';
import '../../widgets/search_field_widget.dart';

class DeliveryStaffScreen extends StatefulWidget {
  const DeliveryStaffScreen({super.key});

  @override
  State<DeliveryStaffScreen> createState() => _DeliveryStaffScreenState();
}

class _DeliveryStaffScreenState extends State<DeliveryStaffScreen> {
  String _searchDeliveryOrder = '';

  void _updateDeliveryOrder(String newDeliveryOrder) {
    setState(() {
      _searchDeliveryOrder = newDeliveryOrder;
      print(newDeliveryOrder);
    });
  }

  @override
  Widget build(BuildContext context) {
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SearchFieldWidget(
                      size: 130,
                      hintText: 'Chọn chi nhánh',
                      onChanged: _updateDeliveryOrder
                  ),
                  SearchFieldWidget(
                      size: 90,
                      hintText: 'Mã NV',
                      onChanged: _updateDeliveryOrder
                  ),
                  SearchFieldWidget(
                      size: 130,
                      hintText: 'Tìm kiếm',
                      suffixIcon: const Icon(Icons.search),
                      onChanged: _updateDeliveryOrder
                  )
                ],
              ),
            ),
            //DeliveryOrderListWidget(searchDeliveryOrder: _searchDeliveryOrder),
            const SizedBox(height: 50),
            const BillOfLandingInfoWidget(),
          ],
        ),
      ),
    );
  }
}
