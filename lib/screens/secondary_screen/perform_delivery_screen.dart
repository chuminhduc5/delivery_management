import 'package:delivery_management/screens/main_screen/delivery_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/delivery_status_bloc/delivery_status_bloc.dart';
import '../../models/delivery.dart';
import '../../models/delivery_status.dart';
import '../../styles/theme.dart';
import '../../utils/error_message_utils.dart';
import '../../widgets/perform_delivery/billing_infomation_widget.dart';
import '../../widgets/perform_delivery/button_confirm_widget.dart';
import '../../widgets/perform_delivery/delivery_infomation_widget.dart';
import '../../widgets/perform_delivery/delivery_status_widget.dart';

class PerformDeliveryScreen extends StatefulWidget {
  final Delivery deliveryStatus;

  const PerformDeliveryScreen(
      {super.key, required this.deliveryStatus});

  @override
  State<PerformDeliveryScreen> createState() => _PerformDeliveryScreenState();
}

class _PerformDeliveryScreenState extends State<PerformDeliveryScreen> {
  late Delivery deliveryStatus;
  int selectedStatusId = 0;
  String selectedStatusName = '';

  @override
  void initState() {
    super.initState();
    deliveryStatus = widget.deliveryStatus;
    selectedStatusId = deliveryStatus.statusId;
    //selectedStatusName = deliveryOrder.status;
  }

  void onStatusChanged(int value, String name) {
    setState(() {
      selectedStatusId = value;
      selectedStatusName = name;
    });
  }

  void onConfirm() async {
    // Gửi sự kiện cập nhật trạng thái
    context.read<DeliveryStatusBloc>().add(
          UpdateDeliveryStatus(
            deliveryId: (deliveryStatus.id).toString(),
            deliveryStatusId: selectedStatusId.toString(),
          ),
        );

    // Hiển thị một hộp thoại để thông báo cho người dùng
    showDialog(
      context: context,
      builder: (context) =>
          BlocListener<DeliveryStatusBloc, DeliveryStatusState>(
        listener: (context, state) {
          if (state is UpdateDeliveryStatusSuccess) {
            Navigator.pop(context);
            Navigator.pop(
              context,
              Delivery(
                id: deliveryStatus.id,
                statusId: deliveryStatus.statusId,
                createDate: deliveryStatus.createDate,
                customerAddress: deliveryStatus.customerAddress,
                transactionNumber: deliveryStatus.transactionNumber,
              ),
            );
          } else if (state is UpdateDeliveryStatusFailed) {
            Navigator.pop(context); // Đóng hộp thoại thông báo
            errorMessageUtils(context,
                message: 'Cập nhật trạng thái thất bại: ${state.message}');
          }
        },
        child: const Center(child: CircularProgressIndicator()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double maxWidthScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgAppbar,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Center(
          child: Text('Thực hiện giao vận',
              style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.w500)),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/qrCode');
              },
              icon: const Icon(Icons.qr_code_2))
        ],
      ),
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: <Widget>[
                  DeliveryInfomationWidget(deliveryOrder: deliveryStatus),
                  DeliveryStatusWidget(
                    onStatusChanged: onStatusChanged,
                    initialStatusId: selectedStatusId,
                    initialStatusName: selectedStatusName,
                  ),
                  const BillingInfomationWidget(),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: ButtonConfirmWidget(onPressed: onConfirm),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
