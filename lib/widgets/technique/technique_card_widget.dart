import 'package:flutter/material.dart';

import '../../models/technique.dart';
import '../../styles/theme.dart';

class TechniqueCardWidget extends StatelessWidget {
  final Technique technique;

  const TechniqueCardWidget({super.key,
    required this.technique,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(15, 5, 15, 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.bgInfoDelivery,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                    text: TextSpan(children: [
                      const TextSpan(
                          text: 'Mã đơn hàng: ',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          )),
                      TextSpan(
                          text: technique.id,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ))
                    ])),
                Text(
                  technique.createDate,
                  style: const TextStyle(fontSize: 13, color: Colors.black),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            RichText(
                text: TextSpan(children: [
                  const TextSpan(
                      text: 'Ngày đơn hàng: ',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      )),
                  TextSpan(
                      text: technique.createDate,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ))
                ])),
            const SizedBox(
              height: 5,
            ),
            RichText(
                text: TextSpan(children: [
                  const TextSpan(
                      text: 'Chi nhánh: ',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      )),
                  TextSpan(
                      text: technique.description,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ))
                ])),
            const SizedBox(
              height: 5,
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.redWithOpacity
                ),
                child: Text(
                  technique.status,
                  style: const TextStyle(
                      color: Colors.red,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
