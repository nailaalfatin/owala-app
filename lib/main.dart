import 'package:e_commerce/consts.dart';
import 'package:e_commerce/models/products.dart';
import 'package:e_commerce/settings/profile_screen.dart';
import 'package:e_commerce/settings/settings_screen.dart';
import 'package:e_commerce/state-management/cart_provider.dart';
import 'package:e_commerce/state-management/theme_provider.dart';
import 'package:e_commerce/state-management/wishlist_provider.dart';
import 'package:e_commerce/ui/auth/login_screen.dart';
import 'package:e_commerce/ui/auth/register_screen.dart';
import 'package:e_commerce/ui/cart/cart_screen.dart';
import 'package:e_commerce/ui/detail/detail_screen.dart';
import 'package:e_commerce/ui/home/catalogue_screen.dart';
import 'package:e_commerce/ui/splash/splash_screen.dart';
import 'package:e_commerce/ui/wishlist/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//compile adalah proses penerjemahan dari bahasa koding ke bahasa mesin
//runtime  alat untuk menerjamahkan, compile adalah proses penerjemahannya
void main() {
  runApp(
    //placeholder tamplate untuk tim provider yg belum terdefinisi
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => WishlistProvider()),
      ],
      child: const FloShop()
    )
  );
}

class FloShop extends StatefulWidget {
  const FloShop({super.key});

  @override
  State<FloShop> createState() => _FloShopState();
}

class _FloShopState extends State<FloShop> {

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'FloShop', // untuk menampilkan nama aplikasi di Task Switcher
          theme: ThemeData(
            // bottomNavigationBarTheme: BottomNavigationBarThemeData(backgroundColor: Colors.amber),
            brightness: themeProvider.isDarkTheme ? Brightness.dark :  Brightness.light, //untukk proses perubahan tema
            scaffoldBackgroundColor: themeProvider.isDarkTheme ? Colors.black : Colors.white, //kita spesifikasi biar dia ga jelek pas dark mode
            fontFamily: 'Plus Jakarta Sans',
            visualDensity: VisualDensity.adaptivePlatformDensity, //mengatur kepadatan di setiap screen
            textTheme: const TextTheme(
              bodyMedium: TextStyle(color: textColor), //textColor itu ngambil dari consts.dart
              bodySmall: TextStyle(color: textColor)
            ),
            // colorSchemeSeed: Colors.white70
          ),
          initialRoute: '/splash',
          routes: {
            '/splash': (context) => const SplashScreen(),
            '/login': (context) => LoginPage(),
            '/register': (context) => RegisterPage(),
            '/catalogue': (context) => const CatalogeScreen(),
            '/detail': (context) => DetailScreen(
              product: ModalRoute.of(context)!.settings.arguments as Product,
            ),
            '/cart': (context) => const CartScreen(),
            '/settings': (context) => const SettingsScreen(),
            '/profile': (context) => const ProfileScreen(),
            '/wishlist': (context) => const WishlistScreen(),
          },
        );
      },
    );
  }
}