import 'package:flutter/material.dart';
import '../../styles/theme.dart';

class DeliveryCardWidget extends StatelessWidget {
  final String id;
  final String status;
  final String statusUpdateTime;
  final String address;

  const DeliveryCardWidget(
      {super.key,
      required this.id,
      required this.status,
      required this.statusUpdateTime,
      required this.address});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.bgInfoDeiivery,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // padding: EdgeInsets.all(5),
              // decoration: BoxDecoration(
              //   border: Border(
              //     left: BorderSide(
              //       width: 2,
              //       color: AppColors.bgAppbar
              //     )
              //   )
              // ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        status,
                        style: const TextStyle(
                            color: Colors.red,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        statusUpdateTime,
                        style: TextStyle(fontSize: 13, color: Colors.grey),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  RichText(
                      text: TextSpan(children: [
                    const TextSpan(
                        text: 'Địa chỉ: ',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        )),
                    TextSpan(
                        text:
                            address,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ))
                  ])),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            RichText(
                text: TextSpan(children: [
              const TextSpan(
                  text: 'Mã ĐGH: ',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  )),
              TextSpan(
                  text: id,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ))
            ])),
            const Align(
              alignment: Alignment.bottomRight,
              child: Text(
                'Xem chi tiết',
                style: TextStyle(
                    color: AppColors.bgAppbar,
                    fontWeight: FontWeight.w500,
                    fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
