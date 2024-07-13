import 'package:delivery_management/blocs/delivery_bloc/delivery_bloc.dart';
import 'package:delivery_management/service/delivery_service.dart';
import 'package:delivery_management/widgets/delivery/delivery_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../styles/theme.dart';
import '../../widgets/common_widget/search_field_widget.dart';
import '../secondary_screen/perform_delivery_screen.dart';

class DeliveryScreen extends StatefulWidget {
  const DeliveryScreen({super.key});

  @override
  State<DeliveryScreen> createState() => _DeliveryScreenState();
}

class _DeliveryScreenState extends State<DeliveryScreen> {
  String _searchDeliveryOrder = '';

  void _updateDeliveryOrder(String newDeliveryOrder) {
    setState(() {
      _searchDeliveryOrder = newDeliveryOrder;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double maxWidthScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        title: const Center(
          child: Text(
            'Danh sách đơn giao hàng',
            style: TextStyle(color: AppColors.textBlack, fontSize: 20),
          ),
        ),
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(4.0),
            child: Container(
              color: AppColors.bgOutlineGrey,
              height: 1.0,
            )),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: BlocProvider(
          create: (context) =>
              DeliveryBloc(DeliveryService())..add(DeliveryFetchRequested()),
          child: BlocBuilder<DeliveryBloc, DeliveryState>(
            builder: (context, state) {
              if (state is DeliveryLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is DeliverySuccess) {
                return RefreshIndicator(
                  onRefresh: () async {
                    context.read<DeliveryBloc>().add(DeliveryFetchRequested());
                  },
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: SearchFieldWidget(
                            size: maxWidthScreen,
                            hintText: 'Tìm kiếm',
                            onChanged: _updateDeliveryOrder),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: state.items.length,
                          itemBuilder: (context, index) {
                            final item = state.items[index];
                            return InkWell(
                                onTap: () async {
                                  final updatedOrder = await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          PerformDeliveryScreen(
                                              deliveryOrder: item),
                                    ),
                                  );
                                  if (updatedOrder != null) {
                                    setState(() {
                                      state.items[index] = updatedOrder;
                                    });
                                  }
                                },
                                child: DeliveryCardWidget(
                                    item['id'].toString(),
                                    item['status'].toString(),
                                    item['createDate'] ?? '',
                                    item['customerAddress'] ?? ''));
                          },
                        ),
                      ),
                    ],
                  ),
                );
              } else if (state is DeliveryFailed) {
                return Center(
                  child: Text(
                    state.message,
                    style: const TextStyle(color: Colors.red),
                  ),
                );
              } else {
                return const Center(
                  child: Text(
                    "Không lấy được dữ liệu",
                    style: TextStyle(color: Colors.white),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
