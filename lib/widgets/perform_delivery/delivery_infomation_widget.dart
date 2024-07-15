import 'package:flutter/material.dart';
import '../../models/delivery.dart';
import '../../styles/theme.dart';

class DeliveryInfomationWidget extends StatefulWidget {
  final Delivery deliveryOrder;
  const DeliveryInfomationWidget({super.key, required this.deliveryOrder});

  @override
  State<DeliveryInfomationWidget> createState() => _DeliveryInfomationWidgetState();
}

class _DeliveryInfomationWidgetState extends State<DeliveryInfomationWidget> {
  @override
  Widget build(BuildContext context) {
    final double maxWidthScreen = MediaQuery.of(context).size.width - 40; // Adjust based on your needs
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.bgInfoDelivery),
        borderRadius: BorderRadius.circular(10),
        color: Colors.green[50],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Table(
            columnWidths: const {
              0: IntrinsicColumnWidth(), // Adjusts the width of the first column to fit its contents
            },
            children: [
              TableRow(
                children: [
                  const Text('Số:', style: TextStyle(fontWeight: FontWeight.w500),),
                  Padding(
                    padding: const EdgeInsets.only(left: 5), // Khoảng cách giữa hai cột
                    child: Text(widget.deliveryOrder.id),
                  ),
                ],
              ),
              TableRow(
                children: [
                  const Text('Khách hàng:', style: TextStyle(fontWeight: FontWeight.w500),),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text(
                      widget.deliveryOrder.nameCustomer,
                      overflow: TextOverflow.visible,
                      softWrap: true,
                    ),
                  ),
                ],
              ),
              TableRow(
                children: [
                  const Text('Địa chỉ giao hàng:', style: TextStyle(fontWeight: FontWeight.w500),),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text(
                      widget.deliveryOrder.customerAddress,
                      overflow: TextOverflow.visible,
                      softWrap: true,
                    ),
                  ),
                ],
              ),
              const TableRow(
                children: [
                  Text('Nhân viên bán hàng:', style: TextStyle(fontWeight: FontWeight.w500),),
                  Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Text(
                      'Ngô Thị Bích Hạnh-1324',
                      overflow: TextOverflow.visible,
                      softWrap: true,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10), // Optional spacing between the table and the note field
          const Text('Ghi chú đơn hàng:', style: TextStyle(fontWeight: FontWeight.w500)),
          const SizedBox(height: 5),
          Container(
            width: maxWidthScreen,
            height: 80,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.bgAppbar),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ],
      ),
    );
  }
}
