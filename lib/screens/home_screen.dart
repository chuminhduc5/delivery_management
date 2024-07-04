import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/delivery_bloc/delivery_bloc.dart';
import '../service/delivery_service.dart';
import 'auth/sign_in_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double maxWidthScreen = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) =>
          DeliveryBloc(DeliveryService())..add(DeliveryFetchRequested()),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.grey,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignInScreen()),
                );
              },
              icon: const Icon(Icons.close),
            ),
          ],
        ),
        body: BlocBuilder<DeliveryBloc, DeliveryState>(
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
                            DataCell(Text('${index + 1}')),
                            DataCell(Text(item['id'].toString())),
                            DataCell(Text(item['status'].toString())),
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

// import 'package:flutter/material.dart';
//
// import '../styles/theme.dart';
//
// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       backgroundColor: AppColors.bgColor,
//       body: Center(
//           child: Text('Home')
//       ),
//     );
//   }
// }
