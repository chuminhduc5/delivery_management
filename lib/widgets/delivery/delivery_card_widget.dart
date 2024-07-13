import 'package:flutter/material.dart';
import '../../styles/theme.dart';

class DeliveryCardWidget extends StatelessWidget {
  final String id;
  final String status;
  final String statusUpdateTime;
  final String address;

  const DeliveryCardWidget(
       this.id,
       this.status,
       this.statusUpdateTime,
       this.address, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10, top: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[50],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.red[50],
                        ),

                        child: Text(
                          status,
                          style: const TextStyle(
                              color: AppColors.statusRed,
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Text(
                        statusUpdateTime,
                        style: const TextStyle(fontSize: 13, color: AppColors.textBlack),
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
                        text: address,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                    text: TextSpan(children: [
                  const TextSpan(
                      text: 'Mã ĐGH: ',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      )),
                  TextSpan(
                      text: id,
                      style: const TextStyle(
                        fontSize: 14,
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
            )
          ],
        ),
      ),
    );
  }
}
