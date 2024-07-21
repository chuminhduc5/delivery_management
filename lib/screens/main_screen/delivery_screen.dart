import 'package:delivery_management/service/delivery_status_service.dart';
import 'package:delivery_management/utils/message_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/delivery_bloc/delivery_bloc.dart';
import '../../blocs/delivery_status_bloc/delivery_status_bloc.dart';
import '../../models/delivery_status.dart';
import '../../service/delivery_service.dart';
import '../../styles/theme.dart';
import '../../widgets/common_widget/search_field_widget.dart';
import '../../widgets/delivery/delivery_card_widget.dart';
import '../secondary_screen/perform_delivery_screen.dart';

class DeliveryScreen extends StatefulWidget {
  const DeliveryScreen({super.key});

  @override
  State<DeliveryScreen> createState() => _DeliveryScreenState();
}

class _DeliveryScreenState extends State<DeliveryScreen> {
  String _searchDeliveryOrder = '';

  // Hàm cập nhật lại dữ liệu
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context.read<DeliveryBloc>().add(DeliveryFetchRequested());
    context.read<DeliveryStatusBloc>().add(DeliveryStatusFetch());
  }

  void _updateDeliveryOrder(String newDeliveryOrder) {
    setState(() {
      _searchDeliveryOrder = newDeliveryOrder;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double maxWidthScreen = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => DeliveryBloc(DeliveryService())..add(DeliveryFetchRequested()),
          ),
          BlocProvider(
            create: (context) => DeliveryStatusBloc(DeliveryStatusService())..add(DeliveryStatusFetch()),
          ),
        ],
        child: BlocConsumer<DeliveryBloc, DeliveryState>(
          listener: (context, state) {
            if (state is DeliveryFailed) {
              MessageUtils.errorMessageUtils(context, message: state.message);
            }
          },
          builder: (context, state) {
            if (state is DeliveryLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is DeliverySuccess) {
              return BlocBuilder<DeliveryStatusBloc, DeliveryStatusState>(
                builder: (context, deliveryStatusState) {
                  if (deliveryStatusState is DeliveryStatusFetchLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (deliveryStatusState is DeliveryStatusFetchSuccess) {
                    final statusList = deliveryStatusState.items.cast<DeliveryStatus>();
                    return RefreshIndicator(
                      onRefresh: () async {
                        context.read<DeliveryBloc>().add(DeliveryFetchRequested());
                        context.read<DeliveryStatusBloc>().add(DeliveryStatusFetch());
                      },
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                            child: SearchFieldWidget(
                              size: maxWidthScreen,
                              hintText: 'Tìm kiếm',
                              onChanged: _updateDeliveryOrder,
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: state.items.length,
                              itemBuilder: (context, index) {
                                final delivery = state.items[index];
                                return InkWell(
                                  onTap: () async {
                                    final updatedOrder = await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => PerformDeliveryScreen(
                                          deliveryStatus: delivery,
                                        ),
                                      ),
                                    );
                                    if (updatedOrder != null) {
                                      setState(() {
                                        state.items[index] = updatedOrder;
                                      });
                                    }
                                    context.read<DeliveryBloc>().add(DeliveryFetchRequested());
                                  },
                                  child: DeliveryCardWidget(
                                    delivery: delivery,
                                    statusList: statusList, // Pass statusList here
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  } else if (deliveryStatusState is DeliveryStatusFetchFailed) {
                    return Center(
                      child: Text(
                        deliveryStatusState.message,
                        style: const TextStyle(color: Colors.red),
                      ),
                    );
                  } else {
                    return const Center(
                      child: Text(
                        "Không lấy được dữ liệu trạng thái",
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  }
                },
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
    );
  }
}
