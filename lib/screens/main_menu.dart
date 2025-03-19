import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrowid/screens/home_screen.dart';
import 'package:mrowid/screens/cafe_screen.dart';
import 'package:mrowid/screens/profile_screen.dart';
import '../controllers/main_menu_controller.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final MainMenuController controller = Get.put(MainMenuController());
    final List<Widget> pages = [
      const HomeScreen(),
      const CafeScreen(),
      const ProfileScreen(),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(
        () => AnimatedSwitcher(
          duration: const Duration(milliseconds: 800),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 0.25), 
                end: Offset.zero,
              ).animate(
                CurvedAnimation(
                  parent: animation,
                  curve: Curves.easeInOutCubic,
                ),
              ),
              child: FadeTransition(
                opacity: Tween<double>(begin: 0, end: 1).animate(animation),
                child: child,
              ),
            );
          },
          child: KeyedSubtree(
            key: ValueKey<int>(controller.selectedIndex.value),
            child: pages[controller.selectedIndex.value],
          ),
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          backgroundColor: Colors.white,
          currentIndex: controller.selectedIndex.value,
          onTap: controller.changePage,
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
      ),
    );
  }
}