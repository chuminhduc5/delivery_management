import 'package:delivery_management/widgets/common_widget/search_field_widget.dart';
import 'package:flutter/material.dart';

import '../../styles/theme.dart';

class SellOptionsScreen extends StatefulWidget {
  const SellOptionsScreen({super.key});

  @override
  State<SellOptionsScreen> createState() => _SellOptionsScreenState();
}

class _SellOptionsScreenState extends State<SellOptionsScreen> {
  bool isCustomer = true;
  String _searchDeliveryOrder = '';

  void _updateDeliveryOrder(String newDeliveryOrder) {
    setState(() {
      _searchDeliveryOrder = newDeliveryOrder;
    });
  }
  @override
  Widget build(BuildContext context) {
    final double maxScreenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgAppbar,
        title: const Text(
          'Bán hàng',
          style: TextStyle(fontSize: 20, color: AppColors.textWhile),
        ),
        iconTheme: const IconThemeData(color: AppColors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Bạn muốn giao dịch bán hàng với khách hàng...',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 15),
            InkWell(
              onTap: () {
                // Define what happens when tapped
              },
              child: Container(
                child: const Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: AppColors.bgAppbar,
                      child: Icon(Icons.add, color: AppColors.white),
                    ),
                    const SizedBox(width: 15),
                    const Text('Khách hàng mới'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          isCustomer = true;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: isCustomer ? Colors.white : Colors.grey[300],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            'Khách hàng đã lưu',
                            style: TextStyle(
                              color: isCustomer ? Colors.black : Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          isCustomer = false;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: isCustomer ? Colors.grey[300] : Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            'Mẫu giao dịch',
                            style: TextStyle(
                              color: isCustomer ? Colors.grey : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: SearchFieldWidget(
                size: maxScreenWidth,
                hintText: 'Tìm kiếm',
                onChanged: _updateDeliveryOrder,
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: isCustomer
                    ? buildWeeklyActivities()
                    : buildMonthlyActivities(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildWeeklyActivities() {
    return Container();
  }

  Widget buildMonthlyActivities() {
    return Container();
  }
}
