import 'package:e_commerce/state-management/cart_provider.dart';
import 'package:e_commerce/state-management/theme_provider.dart';
import 'package:e_commerce/ui/cart/components/item_card.dart';
import 'package:e_commerce/ui/cart/components/cart_summary.dart';
import 'package:e_commerce/ui/cart/components/empty_cart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  // Fungsi untuk format harga
  String getFormattedPrice(int amount) {
    final formatter = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);
    return formatter.format(amount);
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
        centerTitle: true,
        backgroundColor: themeProvider.isDarkTheme ? Colors.black : Colors.white,
        elevation: 0,
      ),
      body: cartProvider.items.isEmpty
          ? const EmptyCart()
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartProvider.items.length,
                    itemBuilder: (context, index) {
                      final cartItem = cartProvider.items.values.toList()[index];
                      return ItemCard(cartItem: cartItem);
                    },
                  ),
                ),
                CartSummary(totalPrice: cartProvider.totalPrice),
              ],
            ),
    );
  }
}
