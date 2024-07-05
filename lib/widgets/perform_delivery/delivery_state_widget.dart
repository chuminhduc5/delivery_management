import 'package:delivery_management/blocs/delivery_status_bloc/delivery_status_bloc.dart';
import 'package:delivery_management/service/delivery_status_service.dart';
import 'package:delivery_management/widgets/perform_delivery/checkbox_status_widget.dart';
import 'package:delivery_management/widgets/perform_delivery/select_returned_good_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeliveryStateWidget extends StatefulWidget {
  const DeliveryStateWidget({super.key});

  @override
  State<DeliveryStateWidget> createState() => _DeliveryStateWidgetState();
}

class _DeliveryStateWidgetState extends State<DeliveryStateWidget> {
  bool checkDelivery = false;
  bool checkArrive = false;
  bool checkUnsuccessCustomers = false;
  bool checkUnsuccessHC = false;
  bool checkDelivered = false;
  bool checkSuccess = false;

  String getNameById(List<dynamic> items, int id) {
    final item = items.firstWhere((element) => element['id'] == id, orElse: () => null);
    return item != null ? item['name'].toString() : '';
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DeliveryStatusBloc(DeliveryStatusService())
        ..add(DeliveryStatusFetch()),
      child: BlocBuilder<DeliveryStatusBloc, DeliveryStatusState>(
        builder: (context, state) {
          if (state is DeliveryStatusFetchLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is DeliveryStatusFetchSuccess) {
            final items = state.items;
            return RefreshIndicator(
              onRefresh: () async {
                context.read<DeliveryStatusBloc>().add(DeliveryStatusFetch());
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 5 / 9,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Tình trạng giao vận"),
                          CheckboxStatusWidget(
                            value: checkDelivery,
                            onChanged: (bool? value) {
                              setState(() {
                                checkDelivery = value!;
                              });
                            },
                            title: getNameById(items, 3),
                          ),
                          CheckboxStatusWidget(
                            value: checkArrive,
                            onChanged: (bool? value) {
                              setState(() {
                                checkArrive = value!;
                              });
                            },
                            title: getNameById(items, 4),
                          ),
                          CheckboxStatusWidget(
                            value: checkUnsuccessCustomers,
                            onChanged: (bool? value) {
                              setState(() {
                                checkUnsuccessCustomers = value!;
                              });
                            },
                            title: getNameById(items, 5),
                          ),
                          CheckboxStatusWidget(
                            value: checkUnsuccessHC,
                            onChanged: (bool? value) {
                              setState(() {
                                checkUnsuccessHC = value!;
                              });
                            },
                            title: getNameById(items, 6),
                          ),
                          CheckboxStatusWidget(
                            value: checkSuccess,
                            onChanged: (bool? value) {
                              setState(() {
                                checkSuccess = value!;
                              });
                            },
                            title: getNameById(items, 8),
                          ),
                          CheckboxStatusWidget(
                            value: checkDelivered,
                            onChanged: (bool? value) {
                              setState(() {
                                checkDelivered = value!;
                              });
                            },
                            title: getNameById(items, 7),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Hàng trả lại:'),
                          SizedBox(
                            height: 5,
                          ),
                          SelectReturnedGoodWidget(),
                          SizedBox(
                            height: 10,
                          ),
                          Text('Lý do trả lại:'),
                          SizedBox(
                            height: 5,
                          ),
                          SelectReturnedGoodWidget(),
                          SizedBox(
                            height: 5,
                          ),
                          SelectReturnedGoodWidget(),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          } else if (state is DeliveryStatusFetchFailed) {
            return Center(
                child: Text(state.message,
                    style: const TextStyle(color: Colors.red)));
          } else {
            return const Center(
                child: Text("Không lấy được dữ liệu",
                    style: TextStyle(color: Colors.white)));
          }
        },
      ),
    );
  }
}

