import 'package:flutter/material.dart';

class DeliveryInfomationWidget extends StatefulWidget {
  final Map<String, dynamic> deliveryOrder;
  const DeliveryInfomationWidget({super.key, required this.deliveryOrder});

  @override
  State<DeliveryInfomationWidget> createState() => _DeliveryInfomationWidgetState();
}

class _DeliveryInfomationWidgetState extends State<DeliveryInfomationWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 1 / 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                              text: 'Số: ', style: TextStyle(color: Colors.grey,
                              fontSize: 14)),
                          TextSpan(
                            text: widget.deliveryOrder['id'].toString(),
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('KH: ',
                          style: TextStyle(fontSize: 14, color: Colors.grey),),
                        Expanded(
                          child: Text(
                            'Khách lẻ thanh toán ngay - giao vận chi nhánh Hai Bà Trưng',
                            style: TextStyle(fontSize: 14, color: Colors.black),),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Text('Ngày:',
                            style: TextStyle(color: Colors.grey, fontSize: 14)),
                        Icon(Icons.phone),
                      ],
                    ),
                    IconButton(onPressed: () {},
                      icon: const Icon(Icons.qr_code),
                      iconSize: 50,
                      padding: EdgeInsets.zero,)
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 5,),
          SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Địa chỉ giao hàng: ',
                      style: TextStyle(fontSize: 14, color: Colors.grey),),
                    Expanded(
                      child: Text(
                        'Halu, Phường Cống Vị, Quận Ba Đình, Thành phố Hà Nộ',
                        style: TextStyle(fontSize: 14, color: Colors.black),),
                    )
                  ],
                ),
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                          text: 'NVBH: ',
                          style: TextStyle(color: Colors.grey)),
                      TextSpan(
                        text: 'Ngô Thị Bích Hạnh-1324',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                          text: 'Ghi chú đơn hàng: ',
                          style: TextStyle(color: Colors.grey)),
                      TextSpan(
                        text: '',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
