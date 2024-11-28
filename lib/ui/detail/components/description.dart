import 'package:e_commerce/consts.dart';
import 'package:e_commerce/models/products.dart';
import 'package:e_commerce/state-management/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Description extends StatelessWidget {
  const Description({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding),
      child: Text(
        product.description,
        style: TextStyle(
          height: 1.5,
          color: themeProvider.isDarkTheme ? textColorDarkMOde : textColor,
        ),
      ),
    );
  }
}