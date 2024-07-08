import 'package:delivery_management/blocs/technique_bloc/technique_bloc.dart';
import 'package:delivery_management/service/technique_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderListWidget extends StatelessWidget {
  const OrderListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final double maxWidthScreen = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) =>
          TechniqueBloc(TechniqueService())..add(TechniqueFetchRequested()),
      child: SingleChildScrollView(
        child: BlocBuilder<TechniqueBloc, TechniqueState>(
          builder: (context, state) {
            if (state is TechniqueLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is TechniqueSuccess) {
              return RefreshIndicator(
                onRefresh: () async {
                  context.read<TechniqueBloc>().add(TechniqueFetchRequested());
                },
                child: SingleChildScrollView(
                  child: DataTable(
                    headingRowColor: WidgetStateProperty.all(Colors.indigo),
                    headingTextStyle: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500),
                    dividerThickness: 0,
                    horizontalMargin: 15, // Bỏ margin mặc định
                    columnSpacing: 15, // Dặt lại khoảng cách giứa các cột
                    columns: [
                      DataColumn(
                        label: SizedBox(width: maxWidthScreen * 0.1, child: const Text('STT')),
                      ),
                      DataColumn(
                        label: SizedBox(width: maxWidthScreen * 0.3, child: const Text('Số đơn hàng')),
                      ),
                      DataColumn(
                        label: SizedBox(width: maxWidthScreen * 0.2, child: const Text('Ngày DH')),
                      ),
                      DataColumn(
                        label: SizedBox(width: maxWidthScreen * 0.2, child: const Text('Chi nhánh')),
                      ),
                      DataColumn(
                        label: SizedBox(width: maxWidthScreen * 0.2, child: const Text('Trạng thái')),
                      ),
                    ],
                    rows: List<DataRow>.generate(
                      state.data.length,
                        (index) {
                        final item = state.data[index];
                        return DataRow(
                            cells: [
                              DataCell(Text('${index + 1}')),
                              DataCell(Text(item['code'].toString())),
                              DataCell(Text(item['createDate'].toString())),
                              DataCell(Text(item['description'])),
                              DataCell(Text(item['status'])),
                            ]
                        );
                        }
                    ),
                  ),
                ),
              );
            } else if (state is TechniqueFailed) {
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
