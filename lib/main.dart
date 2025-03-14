import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrowid/screens/additional_info_screen.dart';
import 'package:mrowid/screens/forgot_password_screen.dart';
import 'package:mrowid/screens/register_screen.dart';
import 'package:mrowid/screens/reset_password_screen.dart';
import 'package:mrowid/screens/sign_in_screen.dart';
import 'package:mrowid/screens/main_menu.dart'; 
import 'package:mrowid/screens/home_screen.dart'; 
import 'package:mrowid/screens/cafe_screen.dart'; 
import 'package:mrowid/screens/profile_screen.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Mrowid',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Gilroy',
        
      ),
      initialRoute: '/sign-in', 
      getPages: [
        GetPage(name: '/sign-in', page: () => const SignInScreen()),
        GetPage(name: '/register', page: () => const RegisterScreen()),
        GetPage(name: '/forgot-password', page: () => ForgotPasswordScreen()),
        GetPage(name: '/reset-password', page: () => ResetPasswordScreen()),
        GetPage(name: '/additional-info', page: () => const AdditionalInfoScreen()),
        GetPage(name: '/main-menu', page: () => const MainMenu()), // Tambahkan MainMenu
        GetPage(name: '/home', page: () => const HomeScreen()), // Tambahkan HomeScreen
        GetPage(name: '/cafe', page: () => const CafeScreen()), // Tambahkan CafeScreen
        GetPage(name: '/profile', page: () => const ProfileScreen()), // Tambahkan ProfileScreen
      ],
      debugShowCheckedModeBanner: false,
    );
  }
}