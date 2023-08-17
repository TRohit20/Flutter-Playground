import 'package:flutter/material.dart';
import 'package:instagram_ui_clone/instagram/profile_scree.dart';
import 'package:instagram_ui_clone/instagram/reels_screen.dart';
import 'package:instagram_ui_clone/instagram/search_screen.dart';
import 'package:instagram_ui_clone/instagram/shop_screen.dart';

import 'home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    SearchScreen(),
    ReelsScreen(),
    ShopScreen(),
    ProfileScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: '', backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(Icons.search_outlined),
              label: '',
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(Icons.smart_display_outlined),
              label: '',
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(Icons.card_giftcard_outlined),
              label: '',
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: '',
              backgroundColor: Colors.black),
        ],
        backgroundColor: Colors.black,
        unselectedItemColor: Colors.white,
        showUnselectedLabels: true,
        iconSize: 30,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}
