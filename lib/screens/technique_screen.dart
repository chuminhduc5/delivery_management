import 'package:flutter/material.dart';
import '../styles/theme.dart';
import '../widgets/order_detail_widget.dart';
import '../widgets/search_field_widget.dart';
import '../widgets/technique/branch_filter_widget.dart';
import '../widgets/technique/order_list_widget.dart';

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
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgAppbar,
        title: const Center(
            child: Text(
              'Danh sách đơn hàng KTKT',
              style: TextStyle(color: Colors.white, fontSize: 24),
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text('Chi nhánh'),
                  const SizedBox(
                    width: 10,
                  ),
                  const BranchFilterWidget(),
                  SearchFieldWidget(
                      size: 150,
                      hintText: 'Tìm kiếm',
                      suffixIcon: IconButton(
                          onPressed: (){},
                          icon: const Icon(Icons.search)
                      ),
                      onChanged: _updateOrder
                  )
                ],
              ),
            ),
            const OrderListWidget(),
            //const SizedBox(height: 50),
            //const OrderDetailWidget(),
          ],
        ),
      ),
    );
  }
}
