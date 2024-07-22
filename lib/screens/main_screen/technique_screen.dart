import 'package:delivery_management/blocs/technique_bloc/technique_bloc.dart';
import 'package:delivery_management/widgets/technique/technique_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../styles/theme.dart';
import '../../widgets/common_widget/search_field_widget.dart';

class TechniqueScreen extends StatefulWidget {
  const TechniqueScreen({super.key});

  @override
  State<TechniqueScreen> createState() => _TechniqueScreenState();
}

class _TechniqueScreenState extends State<TechniqueScreen> {
  String _searchOrder = '';

  void _updateOrder(String newOrder) {
    setState(() {
      _searchOrder = newOrder;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double maxWidthScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgAppbar,
        flexibleSpace: const Center(child: Text( 'Danh sách đơn hàng KTKT', style: TextStyle(fontSize: 20, color: AppColors.textWhile),)),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/notification');
              },
              icon: const Icon(Icons.notifications))
        ],
        iconTheme: const IconThemeData(color: AppColors.white),
      ),
      body: BlocBuilder<TechniqueBloc, TechniqueState>(
        builder: (context, state) {
          if (state is TechniqueLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is TechniqueSuccess) {
            return RefreshIndicator(
              onRefresh: () async {
                context.read<TechniqueBloc>().add(TechniqueFetchRequested());
              },
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
                    child: SearchFieldWidget(
                        size: maxWidthScreen,
                        hintText: 'Tìm kiếm',
                        suffixIcon: const Icon(Icons.search),
                        onChanged: _updateOrder),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.data.length,
                      itemBuilder: (context, index) {
                        final technique = state.data[index];
                        return TechniqueCardWidget(technique: technique);
                      },
                    ),
                  ),
                ],
              ),
            );
          } else if (state is TechniqueFailed) {
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
    );
  }
}
