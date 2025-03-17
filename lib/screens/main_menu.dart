import 'package:flutter/material.dart';
import 'package:mrowid/screens/home_screen.dart';
import 'package:mrowid/screens/cafe_screen.dart';
import 'package:mrowid/screens/profile_screen.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const CafeScreen(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: SizedBox(
              width: 24,
              height: 40,
              child: ImageIcon(AssetImage('assets/icons/homegray.png')),
            ),
            activeIcon: SizedBox(
              width: 24,
              height: 40,
              child: ImageIcon(AssetImage('assets/icons/homeblack.png')),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              width: 24,
              height: 40,
              child: ImageIcon(AssetImage('assets/icons/cafegray.png')),
            ),
            activeIcon: SizedBox(
              width: 24,
              height: 40,
              child: ImageIcon(AssetImage('assets/icons/cafeblack.png')),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              width: 24,
              height: 40,
              child: ImageIcon(AssetImage('assets/icons/profilegray.png')),
            ),
            activeIcon: SizedBox(
              width: 24,
              height: 40,
              child: ImageIcon(AssetImage('assets/icons/profileblack.png')),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}