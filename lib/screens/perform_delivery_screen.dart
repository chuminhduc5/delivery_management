import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/delivery_status_bloc/delivery_status_bloc.dart';
import '../styles/theme.dart';
import '../widgets/perform_delivery/billing_infomation_widget.dart';
import '../widgets/perform_delivery/button_confirm_widget.dart';
import '../widgets/perform_delivery/delivery_infomation_widget.dart';
import '../widgets/perform_delivery/delivery_state_widget.dart';
import '../widgets/perform_delivery/general_infomation_widget.dart';

class PerformDeliveryScreen extends StatefulWidget {
  final Map<String, dynamic> deliveryOrder;

  const PerformDeliveryScreen({super.key, required this.deliveryOrder});

  @override
  State<PerformDeliveryScreen> createState() => _PerformDeliveryScreenState();
}

class _PerformDeliveryScreenState extends State<PerformDeliveryScreen> {
  late Map<String, dynamic> deliveryOrder;
  int selectedStatusId = -1;
  String selectedStatusName = '';

  @override
  void initState() {
    super.initState();
    deliveryOrder = widget.deliveryOrder;
    selectedStatusId = deliveryOrder['statusId'];
    selectedStatusName = deliveryOrder['status'];
  }

  void onStatusChanged(int id, String name) {
    setState(() {
      selectedStatusId = id;
      selectedStatusName = name;
    });
  }

  void onConfirm() {
    // Gửi sự kiện cập nhật trạng thái
    context.read<DeliveryStatusBloc>().add(
      UpdateDeliveryStatus(
        deliveryId: deliveryOrder['id'],
        deliveryStatusId: selectedStatusId,
      ),
    );

    // Hiển thị một hộp thoại để thông báo cho người dùng
    showDialog(
      context: context,
      builder: (context) => BlocListener<DeliveryStatusBloc, DeliveryStatusState>(
        listener: (context, state) {
          if (state is UpdateDeliveryStatusSuccess) {
            Navigator.pop(context); // Đóng hộp thoại thông báo
            Navigator.pop(context, {
              ...deliveryOrder,
              'statusId': selectedStatusId,
              'status': selectedStatusName,
            });
          } else if (state is UpdateDeliveryStatusFailed) {
            Navigator.pop(context); // Đóng hộp thoại thông báo
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Cập nhật trạng thái thất bại: ${state.message}')),
            );
          }
        },
        child: AlertDialog(
          title: Text('Đang cập nhật trạng thái...'),
          content: CircularProgressIndicator(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgAppbar,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('Thực hiện GV',
            style: TextStyle(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.w500)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                border: const Border(
                  bottom: BorderSide(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const GeneralInfomationWidget(),
                  ButtonConfirmWidget(onPressed: onConfirm)
                ],
              ),
            ),
            DeliveryInfomationWidget(deliveryOrder: widget.deliveryOrder),
            DeliveryStateWidget(
              onStatusChanged: onStatusChanged,
              initialStatusId: selectedStatusId,
              initialStatusName: selectedStatusName,
            ),
            const BillingInfomationWidget(),
          ],
        ),
      ),
    );
  }
}
