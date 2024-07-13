// import 'package:delivery_management/blocs/reason_return_bloc/reason_return_bloc.dart';
// import 'package:delivery_management/service/reason_return_service.dart';
// import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class SelectReasonReturnWidget extends StatefulWidget {
//   const SelectReasonReturnWidget({super.key});
//
//   @override
//   State<SelectReasonReturnWidget> createState() => _SelectReasonReturnWidgetState();
// }
//
// class _SelectReasonReturnWidgetState extends State<SelectReasonReturnWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(create: (context) => ReasonReturnBloc(ReasonReturnService())..add(FetchReasonReturn()),
//       child: BlocBuilder<ReasonReturnBloc, ReasonReturnState>(
//         builder: (context, state){
//           if (state is ReasonReturnLoading){
//             return const Center(child: CircularProgressIndicator());
//           } else if (state is ReasonReturnSuccess) {
//             final items = state.items;
//             return RefreshIndicator(
//                 onRefresh: () async {
//                   context.read<ReasonReturnBloc>().add(FetchReasonReturn());
//                 },
//               child: DropdownButtonHideUnderline(
//                 child: DropdownButton2<String>(
//                   isExpanded: true,
//                   hint: const Text(
//                     'Lý do khách trả lại hàng',
//                     style: TextStyle(
//                       fontSize: 14,
//                       color: Colors.grey,
//                     ),
//                   ),
//                   items: items.map((String item) => DropdownMenuItem(
//                     value: item,
//                       child: Text(
//                         item,
//                         style: const TextStyle(
//                           fontSize: 13,
//                         ),
//                       ),
//                   )),
//                 ),
//               ),
//             );
//           }
//           else if (state is ReasonReturnFailed) {
//             return Center(
//                 child: Text(state.message,
//                     style: const TextStyle(color: Colors.red)));
//           } else {
//             return const Center(
//                 child: Text("Không lấy được dữ liệu",
//                     style: TextStyle(color: Colors.white)));
//           }
//         },
//       ),
//     );
//   }
// }
