import 'package:delivery_management/screens/main_screen/delivery_screen.dart';
import 'package:delivery_management/screens/main_screen/home_screen.dart';
import 'package:delivery_management/screens/main_screen/report_screen.dart';
import 'package:delivery_management/screens/main_screen/setting_screen.dart';
import 'package:delivery_management/screens/main_screen/technique_screen.dart';
import 'package:delivery_management/styles/theme.dart';
import 'package:flutter/material.dart';

class AppView extends StatefulWidget {
  final String fullName;
  const AppView({super.key, required this.fullName});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
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

  List<Widget> get _screens => [
    HomeScreen(fullName: widget.fullName),
    const DeliveryScreen(),
    const TechniqueScreen(),
    const ReportScreen(),
    const SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
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
          BottomNavigationBarItem(
              icon: Icon(Icons.local_shipping), label: 'Giao vận'),
          BottomNavigationBarItem(
              icon: Icon(Icons.construction), label: 'Kỹ thuật'),
          BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart_outlined), label: 'Báo cáo'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Cài đặt'),
        ],
      ),
    );
  }
}
