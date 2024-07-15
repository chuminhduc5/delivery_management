// import 'package:flutter/material.dart';
//
// import '../widgets/perform_delivery/billing_infomation_widget.dart';
// import '../widgets/perform_delivery/delivery_infomation_widget.dart';
// import '../widgets/perform_delivery/delivery_status_widget.dart';
//
// class DeliveryInfomationScreen extends StatelessWidget {
//   const DeliveryInfomationScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//         child: Column(
//           children: [
//             DeliveryInfomationWidget(deliveryOrder: deliveryOrder),
//             const DeliveryStateWidget(
//               onStatusChanged: onStatusChanged,
//               initialStatusId: selectedStatusId,
//               initialStatusName: selectedStatusName,
//             ),
//             const BillingInfomationWidget(),
//           ],
//         ),
//       ),
//     );
//   }
// }
