import 'package:flutter/material.dart';

import '../../data/order_data.dart';

class OrderListWidget extends StatelessWidget {
  final String searchOrder;

  const OrderListWidget({super.key, required this.searchOrder});

  @override
  Widget build(BuildContext context) {
    final filteredOrderList = orderList
        .where((order) => order.orderNumber.contains(searchOrder) || order.branch.contains(searchOrder))
        .toList();

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        headingRowColor: WidgetStateProperty.all(Colors.indigo),
        headingTextStyle:
        const TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        dividerThickness: 0,
        horizontalMargin: 15, // Bỏ margin mặc định
        columnSpacing: 15, // Dặt lại khoảng cách giứa các cột
        columns: const [
          DataColumn(
            label: SizedBox(width: 30, child: Text('STT')),
          ),
          DataColumn(
            label: SizedBox(width: 150, child: Text('Số đơn hàng')),
          ),
          DataColumn(
            label: SizedBox(width: 100, child: Text('Ngày DH')),
          ),
          DataColumn(
            label: SizedBox(width: 100, child: Text('Chi nhánh')),
          ),
          DataColumn(
            label: SizedBox(width: 100, child: Text('Trạng thái')),
          ),
        ],
        rows: List<DataRow>.generate(
          filteredOrderList.length,
              (index) => DataRow(
            cells: [
              DataCell(
                SizedBox(
                    width: 30, child: Text(filteredOrderList[index].stt.toString())),
              ),
              DataCell(SizedBox(
                  width: 150, child: Text(filteredOrderList[index].orderNumber))),
              DataCell(
                  SizedBox(width: 100, child: Text(filteredOrderList[index].date))),
              DataCell(
                  SizedBox(width: 160, child: Text(filteredOrderList[index].branch))),
              DataCell(
                  SizedBox(width: 120, child: Text(filteredOrderList[index].status))),
            ],
          ),
        ),
      ),
    );
  }
}
