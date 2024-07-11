import 'package:delivery_management/screens/delivery_screen.dart';
import 'package:delivery_management/screens/home_screen.dart';
import 'package:delivery_management/screens/report_screen.dart';
import 'package:delivery_management/screens/setting_screen.dart';
import 'package:delivery_management/screens/technique_screen.dart';
import 'package:delivery_management/styles/theme.dart';
import 'package:flutter/material.dart';
import 'screens/order_screen.dart';


class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  final List<Widget> _screens = [
    const HomeScreen(),
    const OrderScreen(),
    const DeliveryScreen(),
    const TechniqueScreen(),
    const ReportScreen(),
    const SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _navigateBottomBar,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.bgAppbar,
        backgroundColor: Colors.white,
        selectedFontSize: 12,
        unselectedFontSize: 10,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Trang chủ'),
          BottomNavigationBarItem(icon: Icon(Icons.article), label: 'Đơn hàng'),
          BottomNavigationBarItem(icon: Icon(Icons.local_shipping), label: 'Giao vận'),
          BottomNavigationBarItem(icon: Icon(Icons.construction), label: 'Kỹ thuật'),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart_outlined), label: 'Báo cáo'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Cài đặt'),
        ],
      ),
    );
  }
}
