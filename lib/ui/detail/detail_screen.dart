import 'package:e_commerce/consts.dart';
import 'package:e_commerce/models/products.dart';
import 'package:e_commerce/state-management/theme_provider.dart';
import 'package:e_commerce/ui/detail/components/add_to_cart.dart';
import 'package:e_commerce/ui/detail/components/cart_counter.dart';
import 'package:e_commerce/ui/detail/components/color_and_size.dart';
import 'package:e_commerce/ui/detail/components/description.dart';
import 'package:e_commerce/ui/detail/components/fav_button.dart';
import 'package:e_commerce/ui/detail/components/product_title.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    int quantity = 1;
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: product.color,
      appBar: AppBar(
        backgroundColor: product.color,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: textColor
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/cart');
            },
            icon: const Icon(
              Icons.shopping_cart_outlined,
              color: textColor
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: size.height,
              child: Stack(
                children: [
                  Container(
                    // This Container is the white one that holds the product details
                    margin: EdgeInsets.only(top: size.height * 0.38), // Adjust margin to make space for the image
                    padding: const EdgeInsets.only(
                      top: defaultPadding,
                      left: 25,
                      right: defaultPadding,
                    ),
                    decoration: BoxDecoration(
                      color: themeProvider.isDarkTheme ? Colors.black : Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 50),
                        ColorAndSize(product: product),
                        const SizedBox(height: defaultPadding),
                        Description(product: product),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CartCounter(product: product),
                            FavButton(product: product)
                          ],
                        ),
                        const SizedBox(height: 20),
                        AddToCart(product: product, quantity: quantity),
                      ],
                    ),
                  ),
                  // Title widget placed above the image
                  Positioned( //widget yang berguna ketika kita perlu mengatur letak widget ketika penggunaan stack
                    top: size.height * 0.03,
                    left: defaultPadding,
                    right: 1,
                    child: ProductTitle(product: product),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}