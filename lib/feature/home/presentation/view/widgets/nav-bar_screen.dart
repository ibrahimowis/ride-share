import 'package:flutter/material.dart';
import 'package:kosom_chat_gpt/core/utils/colors.dart';
import 'package:kosom_chat_gpt/feature/home/presentation/view/home_screen.dart';
import 'package:kosom_chat_gpt/feature/messages/presentation/view/messages_screen.dart';
import 'package:kosom_chat_gpt/feature/settings/presentions/view/settings_screen.dart';
import 'package:kosom_chat_gpt/feature/trips/presentation/view/trips_screen.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class Nav_Bar_screen extends StatefulWidget {
  const Nav_Bar_screen({super.key});

  @override
  State<Nav_Bar_screen> createState() => _bottomNavBarState();
}

class _bottomNavBarState extends State<Nav_Bar_screen> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    HomeScreen(),
    Trips_screen(),
    MessagesScreen(),
    Settings_Screen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: _pages[_currentIndex],
      bottomNavigationBar: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          height: 70,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 1,
              ),
            ],
          ),
          child: SalomonBottomBar(
            selectedItemColor: KprimarybuttonColor,
            currentIndex: _currentIndex,
            onTap: (i) => setState(() {
              _currentIndex = i;
            }),
            items: [
              SalomonBottomBarItem(
                icon: Icon(Icons.home),
                title: Text('القائمة'),
              ),
              SalomonBottomBarItem(
                icon: Icon(Icons.tire_repair_sharp),
                title: Text('الرحلات'),
              ),
              SalomonBottomBarItem(
                icon: Icon(Icons.wallet),
                title: Text('المحفظة'),
              ),
              SalomonBottomBarItem(
                icon: Icon(Icons.settings),
                title: Text('الاعدادات'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
