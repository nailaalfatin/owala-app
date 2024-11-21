import 'package:e_commerce/models/products.dart';
import 'package:e_commerce/ui/detail/components/add_to_cart.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final listProduct = products[index];
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    listProduct.title,
                    style: const TextStyle(fontSize: 24),
                  ),
                  Text("${listProduct.price}"),
                  AddToCart(product: listProduct)
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}