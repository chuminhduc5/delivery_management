import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/delivery_status_bloc/delivery_status_bloc.dart';
import '../../models/delivery.dart';
import '../../styles/theme.dart';
import '../../widgets/perform_delivery/billing_infomation_widget.dart';
import '../../widgets/perform_delivery/button_confirm_widget.dart';
import '../../widgets/perform_delivery/delivery_infomation_widget.dart';
import '../../widgets/perform_delivery/delivery_status_widget.dart';

class PerformDeliveryScreen extends StatefulWidget {
  final Delivery deliveryOrder;

  const PerformDeliveryScreen({super.key, required this.deliveryOrder});

  @override
  State<PerformDeliveryScreen> createState() => _PerformDeliveryScreenState();
}

class _PerformDeliveryScreenState extends State<PerformDeliveryScreen> {
  late Delivery deliveryOrder;
  int selectedStatusId = 0;
  String selectedStatusName = '';

  @override
  void initState() {
    super.initState();
    deliveryOrder = widget.deliveryOrder;
    selectedStatusId = deliveryOrder.statusId;
    selectedStatusName = deliveryOrder.status;
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
            deliveryId: deliveryOrder.id,
            deliveryStatusId: selectedStatusId,
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
                  id: deliveryOrder.id,
                  status: selectedStatusName,
                  statusId: deliveryOrder.statusId,
                  createDate: deliveryOrder.createDate,
                  nameCustomer: deliveryOrder.nameCustomer,
                  customerAddress: deliveryOrder.customerAddress,
                ));
          } else if (state is UpdateDeliveryStatusFailed) {
            Navigator.pop(context); // Đóng hộp thoại thông báo
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content:
                      Text('Cập nhật trạng thái thất bại: ${state.message}')),
            );
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
                  DeliveryInfomationWidget(deliveryOrder: deliveryOrder),
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
