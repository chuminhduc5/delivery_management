import 'package:delivery_management/widgets/perform_delivery/text_field_widget.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.indigoAccent,
            padding: const EdgeInsets.all(15),
            margin: const EdgeInsets.only(bottom: 10),
            child: const Text(
              'Thông tin thanh toán',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text('Tổng tiền hàng'),
                    SizedBox(
                      width: 200,
                      child: TextFieldWidget(
                          controller: totalAmountController,
                          hinText: '',
                          keyboardType: TextInputType.number
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Đã thu'),
                    SizedBox(
                      width: 200,
                      child: TextFieldWidget(
                          controller: collectedController,
                          hinText: '',
                          keyboardType: TextInputType.number
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Còn phải thu'),
                    SizedBox(
                      width: 200,
                      child: TextFieldWidget(
                          controller: missingController,
                          hinText: '',
                          keyboardType: TextInputType.number
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Hàng trả lại'),
                    SizedBox(
                      width: 200,
                      child: TextFieldWidget(
                          controller: returnedGoodsController,
                          hinText: '',
                          keyboardType: TextInputType.number
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Số tiền KH phải TT'),
                    SizedBox(
                      width: 200,
                      child: TextFieldWidget(
                          controller: payController,
                          hinText: '',
                          keyboardType: TextInputType.number
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('HTTT dự kiến'),
                    SizedBox(
                      width: 200,
                      child: TextFieldWidget(
                          controller: expectedPayment,
                          hinText: '',
                          keyboardType: TextInputType.text
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('HTTT thực tế'),
                    //const Text('Tiền mặt'),
                    SizedBox(
                      width: 200,
                      child: TextFieldWidget(
                          controller: actualController,
                          hinText: '',
                          keyboardType: TextInputType.number
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('CK'),
                    SizedBox(
                      width: 200,
                      child: TextFieldWidget(
                          controller: transferController,
                          hinText: '',
                          keyboardType: TextInputType.number
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Ngân hàng CK'),
                    SizedBox(
                      width: 200,
                      child: TextFieldWidget(
                          controller: bookTransferController,
                          hinText: '',
                          keyboardType: TextInputType.number
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Thẻ'),
                    SizedBox(
                      width: 200,
                      child: TextFieldWidget(
                          controller: cardController,
                          hinText: '',
                          keyboardType: TextInputType.number
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Máy POS'),
                    SizedBox(
                      width: 200,
                      child: TextFieldWidget(
                          controller: posController,
                          hinText: '',
                          keyboardType: TextInputType.number
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Ghi chú thực hiện'),
                    SizedBox(
                      width: 200,
                      child: TextFieldWidget(
                          controller: noteController,
                          hinText: '',
                          keyboardType: TextInputType.number
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Tiền gửi xe'),
                    SizedBox(
                      width: 200,
                      child: TextFieldWidget(
                          controller: parkingFeeController,
                          hinText: '',
                          keyboardType: TextInputType.number
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20,),
              ],
            ),
          )
        ],
      ),
    );
  }
}
