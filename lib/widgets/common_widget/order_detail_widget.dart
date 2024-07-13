import 'package:flutter/material.dart';
import '../../data/order_detail_data.dart';

class OrderDetailWidget extends StatelessWidget {
  const OrderDetailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final double maxWidthScreen = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            constraints: BoxConstraints(maxWidth: maxWidthScreen),
            color: Colors.blue,
            padding: const EdgeInsets.all(10),
            child: const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Chi tiết đơn hàng',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
          DataTable(
            headingRowColor: WidgetStateProperty.all(Colors.indigo),
            headingTextStyle: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500),
            dividerThickness: 0,
            horizontalMargin: 10,
            columnSpacing: 10,
            dataRowMaxHeight: 80,
            columns: [
              DataColumn(
                label: SizedBox(
                    width: maxWidthScreen * 0.25, child: const Text('Mã SP')),
              ),
              DataColumn(
                label: SizedBox(
                    width: maxWidthScreen * 0.3, child: const Text('Tên SP')),
              ),
              DataColumn(
                label: SizedBox(
                    width: maxWidthScreen * 0.1, child: const Text('ĐVT')),
              ),
              DataColumn(
                label: SizedBox(
                    width: maxWidthScreen * 0.1, child: const Text('SL')),
              ),
              DataColumn(
                label: SizedBox(
                    width: maxWidthScreen * 0.25,
                    child: const Text('Kho suất')),
              ),
            ],
            rows: List<DataRow>.generate(
              orderDetailList.length,
              (index) => DataRow(
                cells: [
                  DataCell(SizedBox(
                      width: maxWidthScreen * 0.25,
                      child: Text(orderDetailList[index].productCode))),
                  DataCell(SizedBox(
                      width: maxWidthScreen * 0.3,
                      child: Text(orderDetailList[index].productName))),
                  DataCell(SizedBox(
                      width: maxWidthScreen * 0.1,
                      child: Text(orderDetailList[index].unit))),
                  DataCell(SizedBox(
                      width: maxWidthScreen * 0.1,
                      child: Text(orderDetailList[index].quantity))),
                  DataCell(SizedBox(
                      width: maxWidthScreen * 0.25,
                      child: Text(orderDetailList[index].exportWarehouse))),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
