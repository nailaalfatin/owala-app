import 'package:e_commerce/consts.dart';
import 'package:e_commerce/state-management/theme_provider.dart';
import 'package:e_commerce/state-management/wishlist_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  // function buat ngubah format harga ke Rupiah
  String getFormattedPrice(int amount) {
    final formatter = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);
    return formatter.format(amount);
  }

  @override
  Widget build(BuildContext context) {
    final wishlistProvider = Provider.of<WishlistProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Wishlist'),
        centerTitle: true,
        backgroundColor: themeProvider.isDarkTheme ? Colors.black : Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: themeProvider.isDarkTheme ? textColorDarkMOde : Colors.black),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/cart');
            },
            icon: const Icon(Icons.shopping_cart_outlined),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none),
          ),
        ],
      ),
      body: wishlistProvider.wishlistItem.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.heart_broken,
                    size: 100,
                    color: Colors.grey.shade400,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Your Wishlist Is Empty!',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'When you add products, they’ll appear here.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            )
          : GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // gridnya jadi punya 2 kolom per baris
                mainAxisSpacing: defaultPadding,
                crossAxisSpacing: defaultPadding,
                childAspectRatio: 0.75,
              ),
              itemCount: wishlistProvider.wishlistItem.length,
              itemBuilder: (context, index) {
                //ini itu buat ngambil item wishlist berdasarkan index
                //sama convert dari map ke list pake .values.toList()
                final wishlistItem = wishlistProvider.wishlistItem.values.toList()[index];
            
                return GestureDetector(
                  onTap: () {},
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: wishlistItem.color,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Hero(
                                tag: wishlistItem.id,
                                child: Image.asset(
                                  wishlistItem.image,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            wishlistItem.title,
                            style: TextStyle(
                              color: themeProvider.isDarkTheme ? textColorDarkMOde : textColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            getFormattedPrice(wishlistItem.price),
                            style: TextStyle(
                            color: themeProvider.isDarkTheme ? const Color(0xFFBDBDBD) : textColor,
                          ),
                          ),
                        ],
                      ),
                      Positioned(
                        top: 10,
                        right: 10,
                        child: GestureDetector(
                          onTap: () {
                            wishlistProvider.removeItemFromFav(wishlistItem.id);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(5)
                            ),
                            child: const Icon(
                              Icons.favorite,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
