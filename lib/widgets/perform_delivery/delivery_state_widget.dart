import 'package:delivery_management/blocs/delivery_status_bloc/delivery_status_bloc.dart';
import 'package:delivery_management/service/delivery_status_service.dart';
import 'package:delivery_management/widgets/perform_delivery/checkbox_status_widget.dart';
import 'package:delivery_management/widgets/perform_delivery/select_returned_good_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeliveryStateWidget extends StatefulWidget {
  final Function(int id, String name) onStatusChanged;
  final int initialStatusId;
  final String initialStatusName;

  const DeliveryStateWidget(
      {super.key,
      required this.onStatusChanged,
      required this.initialStatusId,
      required this.initialStatusName});

  @override
  State<DeliveryStateWidget> createState() => _DeliveryStateWidgetState();
}

class _DeliveryStateWidgetState extends State<DeliveryStateWidget> {
  late int selectedStatusId;
  late String selectedStatusName;

  @override
  void initState() {
    super.initState();
    selectedStatusId = widget.initialStatusId;
    selectedStatusName = widget.initialStatusName;
  }

  void updateSelectedStatus(int id, String name) {
    setState(() {
      selectedStatusId = id;
      selectedStatusName = name;
      widget.onStatusChanged(id, name);
    });
  }

  String getNameById(List<dynamic> items, int id) {
    final item =
        items.firstWhere((element) => element['id'] == id, orElse: () => null);
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // CheckBox Status
                    Container(
                      width: MediaQuery.of(context).size.width * 5 / 9,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Tình trạng giao vận"),
                          CheckboxStatusWidget(
                            value: selectedStatusId == 3,
                            onChanged: (bool? value) {
                              updateSelectedStatus(3, getNameById(items, 3));
                            },
                            title: getNameById(items, 3),
                          ),
                          CheckboxStatusWidget(
                            value: selectedStatusId == 4,
                            onChanged: (bool? value) {
                              updateSelectedStatus(4, getNameById(items, 4));
                            },
                            title: getNameById(items, 4),
                          ),
                          CheckboxStatusWidget(
                            value: selectedStatusId == 5,
                            onChanged: (bool? value) {
                              updateSelectedStatus(5, getNameById(items, 5));
                            },
                            title: getNameById(items, 5),
                          ),
                          CheckboxStatusWidget(
                            value: selectedStatusId == 6,
                            onChanged: (bool? value) {
                              updateSelectedStatus(6, getNameById(items, 6));
                            },
                            title: getNameById(items, 6),
                          ),
                          CheckboxStatusWidget(
                            value: selectedStatusId == 8,
                            onChanged: (bool? value) {
                              updateSelectedStatus(8, getNameById(items, 8));
                            },
                            title: getNameById(items, 8),
                          ),
                          CheckboxStatusWidget(
                            value: selectedStatusId == 7,
                            onChanged: (bool? value) {
                              updateSelectedStatus(7, getNameById(items, 7));
                            },
                            title: getNameById(items, 7),
                          ),
                        ],
                      ),
                    ),
                    // Dropdown item
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
