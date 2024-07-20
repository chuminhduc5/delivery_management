import 'package:delivery_management/blocs/delivery_status_bloc/delivery_status_bloc.dart';
import 'package:delivery_management/widgets/perform_delivery/checkbox_status_widget.dart';
import 'package:delivery_management/widgets/perform_delivery/select_reason_return_widget.dart';
import 'package:delivery_management/widgets/perform_delivery/select_returned_good_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/delivery_status.dart';
import '../../styles/theme.dart';

class DeliveryStatusWidget extends StatefulWidget {
  final Function(int id, String name) onStatusChanged;
  final int initialStatusId;
  final String initialStatusName;
  final bool isLooked;

  const DeliveryStatusWidget(
      {super.key,
      required this.onStatusChanged,
      required this.initialStatusId,
      required this.initialStatusName,
      this.isLooked = false});

  @override
  State<DeliveryStatusWidget> createState() => _DeliveryStatusWidgetState();
}

class _DeliveryStatusWidgetState extends State<DeliveryStatusWidget> {
  late int selectedStatusId;
  late String selectedStatusName;

  @override
  void initState() {
    super.initState();
    selectedStatusId = widget.initialStatusId;
    selectedStatusName = widget.initialStatusName;
  }

  void updateSelectedStatus(int value, String name) {
    setState(() {
      selectedStatusId = value;
      selectedStatusName = name;
      widget.onStatusChanged(value, name);
    });
  }

  String getNameById(List<DeliveryStatus> items, int value) {
    final item = items.firstWhere((element) => element.value == value.toString(),
        orElse: () => const DeliveryStatus(value: '', name: ''));
    return item.name;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DeliveryStatusBloc, DeliveryStatusState>(
      builder: (context, state) {
        if (state is DeliveryStatusFetchLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is DeliveryStatusFetchSuccess) {
          final items = state.items.cast<DeliveryStatus>();
          return RefreshIndicator(
            onRefresh: () async {
              context.read<DeliveryStatusBloc>().add(DeliveryStatusFetch());
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // CheckBox Status
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Tình trạng giao vận",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: AppColors.bgAppbar)),
                        const SizedBox(height: 5),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 3),
                          margin: const EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                            color: Colors.green[100],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: CheckboxStatusWidget(
                            value: selectedStatusId == 3,
                            onChanged: (bool? value) {
                              updateSelectedStatus(3, getNameById(items, 3));
                            },
                            title: getNameById(items, 3),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 3),
                          margin: const EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                            color: Colors.green[100],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: CheckboxStatusWidget(
                            value: selectedStatusId == 5,
                            onChanged: (bool? value) {
                              updateSelectedStatus(5, getNameById(items, 5));
                            },
                            title: getNameById(items, 5),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 3),
                          margin: const EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                            color: Colors.green[100],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: CheckboxStatusWidget(
                            value: selectedStatusId == 6,
                            onChanged: (bool? value) {
                              updateSelectedStatus(6, getNameById(items, 6));
                            },
                            title: getNameById(items, 6),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 3),
                          margin: const EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                            color: Colors.green[100],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: CheckboxStatusWidget(
                            value: selectedStatusId == 4,
                            onChanged: (bool? value) {
                              updateSelectedStatus(4, getNameById(items, 4));
                            },
                            title: getNameById(items, 4),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 3),
                          margin: const EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                            color: Colors.green[100],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: CheckboxStatusWidget(
                            value: selectedStatusId == 8,
                            onChanged: (bool? value) {
                              updateSelectedStatus(8, getNameById(items, 8));
                            },
                            title: getNameById(items, 8),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 3),
                          margin: const EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                            color: Colors.green[100],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: CheckboxStatusWidget(
                            value: selectedStatusId == 7,
                            onChanged: (bool? value) {
                              updateSelectedStatus(7, getNameById(items, 7));
                            },
                            title: getNameById(items, 7),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Dropdown item
                  Container(
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hàng trả lại:',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: AppColors.bgAppbar),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        SelectReturnedGoodWidget(),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Lý do trả lại:',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: AppColors.bgAppbar),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        SelectReasonReturnWidget(),
                        SizedBox(
                          height: 5,
                        ),
                        SelectReasonReturnWidget(),
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
    );
  }
}
