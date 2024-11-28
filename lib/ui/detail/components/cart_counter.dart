import 'package:e_commerce/consts.dart';
import 'package:e_commerce/models/products.dart';
import 'package:e_commerce/state-management/cart_provider.dart';
import 'package:e_commerce/state-management/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartCounter extends StatefulWidget {
  final Product product;

  const CartCounter({super.key, required this.product});

  @override
  State<CartCounter> createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);
  
    return Row(
      children: <Widget> [
        //logic buat decrement (pengurangan)
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            minimumSize: const Size(25, 25),
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0)
            )
          ),
          onPressed: quantity > 1 
          ? () {
            // setState isinya itu inisialisasi awal
            setState(() {
              quantity--;
            });
            //ini itu untuk mengirim quantity terbaru;
            cartProvider.removeItems(widget.product.id.toString());
          }
          //null ini akan men-disable tombol jika kuantitas <=1
          : null,
          child: Icon(
            Icons.remove,
            color: themeProvider.isDarkTheme ? textColorDarkMOde : textColor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Text(
            quantity.toString().padLeft(2, "0"),
            style: TextStyle(
              fontSize: 18, 
              color: themeProvider.isDarkTheme ? textColorDarkMOde : textColor
            ),
          ),
        ),
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            minimumSize: const Size(25, 25),
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0)
            )
          ),
          onPressed: () {
            setState(() {
              quantity++;
            });
            //pendeklarasian informasi yang akan dikirimkan ke addToCart (tombol keranjang)
            // ini untuk mengirim quantity terbary
            // ini juga merupakan starting point dimana kuantitsa akan dibawa oleh tombol keranjang
            cartProvider.addItem(
              widget.product.id.toString(),
              widget.product.title,
              widget.product.price,
              widget.product.image,
              1
            );
          },
          child: Icon(
            Icons.add,
            color: themeProvider.isDarkTheme ? textColorDarkMOde : textColor,
          ),
        ),
      ],
    );
  }
}