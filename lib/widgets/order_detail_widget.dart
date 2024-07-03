import 'package:flutter/material.dart';
import '../data/order_detail_data.dart';

class OrderDetailWidget extends StatelessWidget {
  const OrderDetailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width),
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
            headingTextStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
            dividerThickness: 0,
            horizontalMargin: 10,
            columnSpacing: 10,
            dataRowMaxHeight: 80,
            columns: const [
              DataColumn(
                label: Text('Mã SP'),
              ),
              DataColumn(
                label: Text('Tên SP'),
              ),
              DataColumn(
                label: Text('ĐVT'),
              ),
              DataColumn(
                label: Text('SL'),
              ),
              DataColumn(
                label: Text('Kho suất'),
              ),
            ],
            rows: List<DataRow>.generate(
              orderDetailList.length,
                  (index) => DataRow(
                cells: [
                  DataCell(Text(orderDetailList[index].productCode)),
                  DataCell(SizedBox(width: 80, child: Text(orderDetailList[index].productName))),
                  DataCell(Text(orderDetailList[index].unit)),
                  DataCell(Text(orderDetailList[index].quantity)),
                  DataCell(Text(orderDetailList[index].exportWarehouse)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
