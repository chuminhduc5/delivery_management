import 'package:flutter/material.dart';

import '../data/delivery_order_data.dart';
import '../styles/theme.dart';
import '../widgets/perform_delivery/billing_infomation_widget.dart';
import '../widgets/perform_delivery/button_confirm_widget.dart';
import '../widgets/perform_delivery/delivery_infomation.dart';
import '../widgets/perform_delivery/delivery_state_widget.dart';
import '../widgets/perform_delivery/general_infomation_widget.dart';

class PerformDeliveryScreen extends StatefulWidget {
  final DeliveryOrderData deliveryOrder;

  const PerformDeliveryScreen({super.key, required this.deliveryOrder});

  @override
  State<PerformDeliveryScreen> createState() =>
      _PerformDeliveryScreenState();
}

class _PerformDeliveryScreenState
    extends State<PerformDeliveryScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgAppbar,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('Thực hiện GV',
            style: TextStyle(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.w500)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                border: const Border(
                  bottom: BorderSide(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [GeneralInfomationWidget(), ButtonConfirmWidget()],
              ),
            ),
            TransportationInfomationWidget(deliveryOrder: widget.deliveryOrder),
            const TransportStateWidget(),
            const BillingInfomationWidget(),
          ],
        ),
      ),
    );
  }
}
