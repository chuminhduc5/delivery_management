import 'package:delivery_management/widgets/perform_delivery/text_field_widget.dart';
import 'package:flutter/material.dart';

import '../../styles/theme.dart';

class BillingInfomationWidget extends StatefulWidget {
  const BillingInfomationWidget({super.key});

  @override
  State<BillingInfomationWidget> createState() =>
      _BillingInfomationWidgetState();
}

class _BillingInfomationWidgetState extends State<BillingInfomationWidget> {
  final totalAmountController = TextEditingController();
  final collectedController = TextEditingController();
  final missingController = TextEditingController();
  final returnedGoodsController = TextEditingController();
  final payController = TextEditingController();
  final expectedPayment = TextEditingController();
  final actualController = TextEditingController();
  final transferController = TextEditingController();
  final bookTransferController = TextEditingController();
  final cardController = TextEditingController();
  final posController = TextEditingController();
  final noteController = TextEditingController();
  final parkingFeeController = TextEditingController();

  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final sizeHeight = SizedBox(height: 15,);
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isExpanded = !_isExpanded;
                    });
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    color:  AppColors.bgColor,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Thông tin thanh toán',
                          style: TextStyle(
                              color: AppColors.textBlack,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                        Icon(
                          _isExpanded
                              ? Icons.keyboard_arrow_down
                              : Icons.keyboard_arrow_right,
                          color: AppColors.textBlack,
                        ),
                      ],
                    ),
                  ),
                ),
                if (_isExpanded)
                  Padding(
                    padding: const EdgeInsets.only(top: 65),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text('Tổng tiền hàng', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),),
                            SizedBox(
                              width: 200,
                              child: TextFieldWidget(
                                  controller: totalAmountController,
                                  hintText: 'Nhập tổng tiền hàng',
                                  keyboardType: TextInputType.number
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Đã thu', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
                            SizedBox(
                              width: 200,
                              child: TextFieldWidget(
                                  controller: collectedController,
                                  hintText: 'Nhập số tiền đã thu',
                                  keyboardType: TextInputType.number
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Còn phải thu', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
                            SizedBox(
                              width: 200,
                              child: TextFieldWidget(
                                  controller: missingController,
                                  hintText: 'Nhập số tiền còn phải thu',
                                  keyboardType: TextInputType.number
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Hàng trả lại', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
                            SizedBox(
                              width: 200,
                              child: TextFieldWidget(
                                  controller: returnedGoodsController,
                                  hintText: 'Nhập hàng trả lại',
                                  keyboardType: TextInputType.number
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Số tiền KH phải TT', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
                            SizedBox(
                              width: 200,
                              child: TextFieldWidget(
                                  controller: payController,
                                  hintText: 'Nhập sô tiền KH thanh toán',
                                  keyboardType: TextInputType.number
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('HTTT dự kiến', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
                            SizedBox(
                              width: 200,
                              child: TextFieldWidget(
                                  controller: expectedPayment,
                                  hintText: 'Nhập HTTT dự kiến',
                                  keyboardType: TextInputType.text
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('HTTT thực tế', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
                            //const Text('Tiền mặt'),
                            SizedBox(
                              width: 200,
                              child: TextFieldWidget(
                                  controller: actualController,
                                  hintText: 'Nhập HTTT thực tế',
                                  keyboardType: TextInputType.number
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Chuyển khoản', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
                            SizedBox(
                              width: 200,
                              child: TextFieldWidget(
                                  controller: transferController,
                                  hintText: 'Nhập số tài khoản',
                                  keyboardType: TextInputType.number
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Ngân hàng CK', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
                            SizedBox(
                              width: 200,
                              child: TextFieldWidget(
                                  controller: bookTransferController,
                                  hintText: 'Nhập ngân hàng chuyển khoản',
                                  keyboardType: TextInputType.number
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Thẻ', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
                            SizedBox(
                              width: 200,
                              child: TextFieldWidget(
                                  controller: cardController,
                                  hintText: 'Nhập số thẻ',
                                  keyboardType: TextInputType.number
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Máy POS', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
                            SizedBox(
                              width: 200,
                              child: TextFieldWidget(
                                  controller: posController,
                                  hintText: 'Máy Pos',
                                  keyboardType: TextInputType.number
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Ghi chú thực hiện', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
                            SizedBox(
                              width: 200,
                              child: TextFieldWidget(
                                  controller: noteController,
                                  hintText: 'Nhập ghi chú thực hiện',
                                  keyboardType: TextInputType.number
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Tiền gửi xe', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
                            SizedBox(
                              width: 200,
                              child: TextFieldWidget(
                                  controller: parkingFeeController,
                                  hintText: 'Nhập tiền gửi xe',
                                  keyboardType: TextInputType.number
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
