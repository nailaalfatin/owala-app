import 'package:e_commerce/consts.dart';
import 'package:e_commerce/size_config.dart';
import 'package:e_commerce/state-management/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    super.key, required this.text, required this.image,
  });
  final String text, image;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Column(
      children: [
        Image.asset(
          'assets/images/logo.png', // Gambar yang akan ditampilkan
          fit: BoxFit.contain,
        ),
        const Spacer(),
        Text(
          "Owala",
          style: TextStyle(
            color: primaryColor,
            fontSize: getPropotionateScreenWidth(36.0),
            fontWeight: FontWeight.bold
          ),
        ),
        const SizedBox(height: 15),
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: themeProvider.isDarkTheme ? textColorDarkMOde : textColor,
          ),
        ),
      ],
    );
  }
}