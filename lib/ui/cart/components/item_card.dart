import 'package:e_commerce/state-management/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:e_commerce/state-management/cart_provider.dart';
import 'package:e_commerce/consts.dart';

class ItemCard extends StatelessWidget {
  final dynamic cartItem;

  const ItemCard({super.key, required this.cartItem});

  // function buat ngubah format harga ke Rupiah
  String getFormattedPrice(int amount) {
    final formatter = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);
    return formatter.format(amount);
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Dismissible(
      key: Key(cartItem.id),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        cartProvider.removeItems(cartItem.id);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${cartItem.title} removed from cart')),
        );
      },
      background: Container(
        color: const Color(0xFFFFEAEA),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: const Icon(
          Icons.delete, 
          color: Colors.red
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Card(
          color: themeProvider.isDarkTheme ? Color(0xFF20222B) : Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: BorderSide(
              color: themeProvider.isDarkTheme ? Color(0xFF20222B) : Colors.grey.shade300,
              width: 1
            ),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    cartItem.image,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cartItem.title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: themeProvider.isDarkTheme ? textColorDarkMOde : textColor,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      getFormattedPrice(cartItem.price),
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: themeProvider.isDarkTheme ? textColorDarkMOde : primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    _QuantityButton(
                      icon: Icons.remove,
                      onTap: () {
                        if (cartItem.quantity > 1) {
                          cartProvider.addItem(
                            cartItem.id, 
                            cartItem.title, 
                            cartItem.price, 
                            cartItem.image, 
                            -1
                          );
                        }
                      },
                    ),
                    const SizedBox(width: 12),
                    Text(
                      cartItem.quantity.toString(),
                      style: TextStyle(
                        color: themeProvider.isDarkTheme ? textColorDarkMOde : textColor,
                      ),
                    ),
                    const SizedBox(width: 12),
                    _QuantityButton(
                      icon: Icons.add,
                      onTap: () {
                        cartProvider.addItem(
                          cartItem.id, 
                          cartItem.title, 
                          cartItem.price, 
                          cartItem.image, 
                          1
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _QuantityButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _QuantityButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 25,
        height: 25,
        decoration: BoxDecoration(
          color: icon == Icons.add ? primaryColor : Colors.grey.shade300,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Icon(
          icon, 
          size: 16, 
          color: icon == Icons.add ? Colors.white : Colors.black
        ),
      ),
    );
  }
}
