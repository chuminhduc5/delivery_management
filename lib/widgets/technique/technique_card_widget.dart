import 'package:flutter/material.dart';

class TechniqueCardWidget extends StatelessWidget {
  final String id;
  final String status;
  final String date;
  final String branch;

  const TechniqueCardWidget(
      {super.key,
        required this.id,
        required this.status,
        required this.date,
        required this.branch});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10, top: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[200],
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
                          text: id,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ))
                    ])),
                Text(
                  date,
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
                      text: date,
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
                      text: branch,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ))
                ])),
            const SizedBox(
              height: 5,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.green[50],
                ),
                child: Text(
                  status,
                  style: const TextStyle(
                      color: Colors.green,
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
