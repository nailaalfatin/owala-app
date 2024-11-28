import 'package:e_commerce/state-management/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/consts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CartSummary extends StatelessWidget {
  final int totalPrice;

  const CartSummary({super.key, required this.totalPrice});
  // function buat ngubah format harga ke Rupiah
  String getFormattedPrice(int amount) {

    final formatter = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);
    return formatter.format(amount);
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: themeProvider.isDarkTheme ? textColorDarkMOde : Colors.grey,
            width: 0.5
          )
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             Text(
                "Sub-total",
                style: TextStyle(
                  fontSize: 16, 
                  color: themeProvider.isDarkTheme ? textColorDarkMOde : Colors.grey,
                ),
              ),
              Text(
                getFormattedPrice(totalPrice),
                style: TextStyle(
                  fontSize: 16,
                  color: themeProvider.isDarkTheme ? textColorDarkMOde : Colors.grey,
                ),
              ),
            ],
          ),
         Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Shipping Fee",
                style: TextStyle(
                  fontSize: 16, 
                  color: themeProvider.isDarkTheme ? textColorDarkMOde : Colors.grey,
                ),
              ),
              Text(
                'Rp 0 -',
                style: TextStyle(
                  fontSize: 16,
                  color: themeProvider.isDarkTheme ? textColorDarkMOde : Colors.grey,
                ),
              ),
            ],
          ),
          Divider(
            height: 50, 
            thickness: 1, 
            color: themeProvider.isDarkTheme ? textColorDarkMOde : Colors.grey,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: themeProvider.isDarkTheme ? primaryLightColor : Colors.grey,
                ),
              ),
              Text(
                getFormattedPrice(totalPrice),
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: themeProvider.isDarkTheme ? primaryLightColor : primaryColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // Add checkout logic
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15),
                backgroundColor: primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                "Checkout",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
