import 'package:delivery_management/blocs/delivery_status_bloc/delivery_status_bloc.dart';
import 'package:delivery_management/service/delivery_status_service.dart';
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
  final List<int> lockedStatusIds;

  const DeliveryStatusWidget({
    super.key,
    required this.onStatusChanged,
    required this.initialStatusId,
    required this.initialStatusName,
    required this.lockedStatusIds,
  });

  @override
  State<DeliveryStatusWidget> createState() => _DeliveryStatusWidgetState();
}

class _DeliveryStatusWidgetState extends State<DeliveryStatusWidget> {
  late Set<int> selectedStatusIds;

  @override
  void initState() {
    super.initState();
    selectedStatusIds = <int>{widget.initialStatusId};
  }

  void updateSelectedStatus(int value, String name) {
    setState(() {
      if (selectedStatusIds.contains(value)) {
        selectedStatusIds.remove(value);
      } else {
        selectedStatusIds.add(value);
      }
      widget.onStatusChanged(value, name);
    });
  }

  bool isStatusLocked(int statusId) {
    return widget.lockedStatusIds.contains(statusId);
  }

  String getNameById(List<DeliveryStatus> items, int value) {
    final item = items.firstWhere(
            (element) => element.value == value.toString(),
        orElse: () => const DeliveryStatus(value: '', name: ''));
    return item.name;
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
            final items = state.items.cast<DeliveryStatus>();
            return Container(
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
                        ...items.map((status) {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 3),
                            margin: const EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                              color: Colors.green[100],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: CheckboxStatusWidget(
                              value:
                              selectedStatusIds.contains(status.intValue),
                              onChanged: isStatusLocked(status.intValue)
                                  ? null
                                  : (bool? value) {
                                updateSelectedStatus(
                                    status.intValue, status.name);
                              },
                              title: status.name,
                              isLocked: isStatusLocked(status.intValue),
                            ),
                          );
                        }).toList()
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
            );
          } else if (state is DeliveryStatusFetchFailed) {
            return Text(state.message);
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
