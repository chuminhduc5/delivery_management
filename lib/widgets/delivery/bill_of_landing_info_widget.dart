import 'package:flutter/material.dart';

import '../../data/order_detail_data.dart';
import '../../styles/theme.dart';

class BillOfLandingInfoWidget extends StatefulWidget {
  const BillOfLandingInfoWidget({super.key});

  @override
  State<BillOfLandingInfoWidget> createState() =>
      _BillOfLandingInfoWidgetState();
}

class _BillOfLandingInfoWidgetState extends State<BillOfLandingInfoWidget> {
  @override
  Widget build(BuildContext context) {
    final double maxWidthScreen = MediaQuery.of(context).size.width;
    bool checkResponsibility = true;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width),
            color: Colors.blue,
            padding: const EdgeInsets.all(10),
            child: const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Thông tin vận đơn',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
          DataTable(
              headingRowColor: WidgetStateProperty.all(Colors.indigo),
              headingTextStyle: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w500),
              dividerThickness: 0,
              horizontalMargin: 5,
              columnSpacing: 10,
              //Giãn giữa các cột
              dataRowMaxHeight: 80,
              // Chiều cao max của mỗi dòng
              columns: [
                DataColumn(
                  label: SizedBox(
                      width: maxWidthScreen * 1 / 7, child: Text('Mã NV')),
                ),
                DataColumn(
                  label: SizedBox(
                      width: maxWidthScreen * 1 / 7, child: Text('Tên NV')),
                ),
                DataColumn(
                  label: SizedBox(
                      width: maxWidthScreen * 1 / 5,
                      child: const Text(
                        'Công việc giao vận',
                        overflow: TextOverflow.visible,
                        softWrap: true,
                      )),
                ),
                DataColumn(
                  label: SizedBox(
                      width: maxWidthScreen * 1 / 5,
                      child: const Text(
                        'Người chịu TN',
                        overflow: TextOverflow.visible,
                        softWrap: true,
                      )),
                ),
                DataColumn(
                  label: SizedBox(
                      width: maxWidthScreen * 1 / 5,
                      child: const Text(
                        'Phương tiện đi',
                        overflow: TextOverflow.visible,
                        softWrap: true,
                      )),
                ),
              ],
              rows: [
                DataRow(
                  cells: [
                    const DataCell(Text('58')),
                    DataCell(SizedBox(
                        width: maxWidthScreen * 1 / 7,
                        child: const Text('Nguyễn Trung Dũng'))),
                    const DataCell(Text('Giao hàng')),
                    DataCell(Checkbox(
                      checkColor: Colors.white,
                      activeColor: Colors.grey,
                      value: checkResponsibility,
                      onChanged: (bool? value) {
                        setState(() {
                          checkResponsibility = value!;
                        });
                      },
                    )),
                    const DataCell(Text('XM')),
                  ],
                )
              ]),
        ],
      ),
    );
  }
}
