import 'package:e_commerce/consts.dart';
import 'package:e_commerce/ui/splash/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const FloShop());
}

class FloShop extends StatelessWidget {
  const FloShop
({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FloShop', // untuk menampilkan nama aplikasi di Task Switcher
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white, //kita spesifikasi biar dia ga jelek pas dark mode
        fontFamily: 'Muli',
        visualDensity: VisualDensity.adaptivePlatformDensity, //mengatur kepadatan di setiap screen
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: textColor), //textColor itu ngambil dari consts.dart
          bodySmall: TextStyle(color: textColor)
        )
      ),
      home: const SplashScreen(),
    );
  }
}