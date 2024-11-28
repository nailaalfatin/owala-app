import 'package:e_commerce/consts.dart';
import 'package:e_commerce/models/products.dart';
import 'package:e_commerce/state-management/theme_provider.dart';
import 'package:e_commerce/state-management/wishlist_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavButton extends StatelessWidget {
  const FavButton({super.key, required this.product});

  //ini adalah bentuk  dari inisalisasi variable
  final Product product;

  //ini deklarasi variable
  // int quantity = 1;

  @override
  Widget build(BuildContext context) {
    final wishlistProvider = Provider.of<WishlistProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);

    // untuk memeriksa apakah produk sudah ada di wishlist belum
    final isFavorite = wishlistProvider.wishlistItem.containsKey(product.id.toString());

    return IconButton(
      onPressed: () {
        if (isFavorite) {
          //untuk menghapus item dari wishlist
          wishlistProvider.removeItemFromFav(product.id.toString());
        } else {
          //untuk menambah item ke wishlist
          wishlistProvider.addItemToFav(
            product.id.toString(), 
            product.title,
            product.price, 
            product.image, 
            product.color
          );
        }
      }, 
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border_outlined,
        color: isFavorite 
            ? Colors.red 
            : (themeProvider.isDarkTheme ? textColorDarkMOde : textColor),
      ),
    );
  }
}