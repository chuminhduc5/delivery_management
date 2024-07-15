import 'package:delivery_management/models/delivery.dart';
import 'package:flutter/material.dart';
import '../../styles/theme.dart';

class DeliveryCardWidget extends StatelessWidget {
  final Delivery delivery;

  const DeliveryCardWidget(
      {super.key, required this.delivery});

  Color _statusColorBg(String status){
    const delivered = AppColors.greenWithOpacity;
    const delivering = AppColors.redWithOpacity;

    if (status == "Hàng đã giao" || status == "Hàng đã giao - nối chuyến") {
      return delivered;
    }
    return delivering;
  }

  Color _statusColor(String status){
    const delivered = Colors.green;
    const delivering = Colors.red;

    if (status == "Hàng đã giao" || status == "Hàng đã giao - nối chuyến") {
      return delivered;
    }
    return delivering;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10, top: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.bgInfoDelivery,
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: _statusColorBg(delivery.status),
                        ),
                        child: Text(
                          delivery.status,
                          style: TextStyle(
                              color: _statusColor(delivery.status),
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Text(
                        delivery.createDate,
                        style: const TextStyle(
                            fontSize: 13, color: AppColors.textBlack),
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
                        text: delivery.customerAddress,
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
                      text: delivery.id,
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
