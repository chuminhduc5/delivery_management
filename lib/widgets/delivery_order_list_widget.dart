import 'package:delivery_management/screens/perform_delivery_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/delivery_bloc/delivery_bloc.dart';
import '../service/delivery_service.dart';

class DeliveryOrderListWidget extends StatefulWidget {
  const DeliveryOrderListWidget({super.key});

  @override
  State<DeliveryOrderListWidget> createState() => _DeliveryOrderListWidgetState();
}

class _DeliveryOrderListWidgetState extends State<DeliveryOrderListWidget> {

  @override
  Widget build(BuildContext context) {
    final double maxWidthScreen = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) =>
      DeliveryBloc(DeliveryService())..add(DeliveryFetchRequested()),
      child: SingleChildScrollView(
        child: BlocBuilder<DeliveryBloc, DeliveryState>(
          builder: (context, state) {
            if (state is DeliveryLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is DeliverySuccess) {
              return RefreshIndicator(
                onRefresh: () async {
                  context.read<DeliveryBloc>().add(DeliveryFetchRequested());
                },
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    headingRowColor: WidgetStateProperty.all(Colors.indigo),
                    headingTextStyle: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500),
                    dividerThickness: 0,
                    columnSpacing: 0,
                    columns: [
                      DataColumn(
                        label: SizedBox(
                            width: maxWidthScreen * 0.15,
                            child: const Text('STT')),
                      ),
                      DataColumn(
                        label: SizedBox(
                            width: maxWidthScreen * 0.4,
                            child: const Text('Số ĐGH')),
                      ),
                      DataColumn(
                        label: SizedBox(
                            width: maxWidthScreen * 0.45,
                            child: const Text('Trạng thái ĐH')),
                      ),
                    ],
                    rows: List<DataRow>.generate(
                      state.items.length,
                          (index) {
                        final item = state.items[index];
                        return DataRow(
                          cells: [
                            DataCell(InkWell(
                                onTap: () async {
                                  final updatedOrder = await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => PerformDeliveryScreen(deliveryOrder: item),
                                    ),
                                  );

                                  if (updatedOrder != null) {
                                    setState(() {
                                      state.items[index] = updatedOrder;
                                    });
                                  }
                                },
                                child: Text('${index + 1}'))),
                            DataCell(InkWell(
                                onTap: () async {
                                  final updatedOrder = await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => PerformDeliveryScreen(deliveryOrder: item),
                                    ),
                                  );

                                  if (updatedOrder != null) {
                                    setState(() {
                                      state.items[index] = updatedOrder;
                                    });
                                  }
                                },
                                child: Text(item['id'].toString()))),
                            DataCell(InkWell(
                                onTap: () async {
                                  final updatedOrder = await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => PerformDeliveryScreen(deliveryOrder: item),
                                    ),
                                  );

                                  if (updatedOrder != null) {
                                    setState(() {
                                      state.items[index] = updatedOrder;
                                    });
                                  }
                                },
                                child: Text(item['status'].toString()))),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              );
            } else if (state is DeliveryFailed) {
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
      ),
    );
  }
}

