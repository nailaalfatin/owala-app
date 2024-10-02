import 'package:e_commerce/models/products.dart';
import 'package:flutter/material.dart';

class ProductTitle extends StatelessWidget {
  const ProductTitle({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {

    final Size size = MediaQuery.of(context).size;

    //ini buat definisiin ukuran proposional gambar sebagai variabel constant
    const double imageWidthRatio = 0.60; // ngambil 35% dari lebar layar
    const double imageHeightRatio = 0.36; //ngambil 20% dari tinggi layar

    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
        bottom: 50,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Aligns text to the start
        children: [
          const Text(
            "Drinkware", // Static title
            style: TextStyle(color: Color(0xFF4C4D4F)),
          ),
          const SizedBox(height: 5),
          Text(
            product.title, // Dynamic product title
            style: const TextStyle(
              color: Color(0xFF4C4D4F),
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Price",
                      style: TextStyle(color: Color(0xFF4C4D4F)),
                    ),
                    Text(
                      product.getFormattedPrice(),
                      style: const TextStyle(
                        color: Color(0xFF4C4D4F),
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Hero(
                tag: "${product.id}",
                child: Image.asset(
                  product.image,
                  width: size.width * imageWidthRatio, // Set an appropriate width
                  height: size.height * imageHeightRatio, // Set an appropriate height
                  fit: BoxFit.cover // Ensure proper scaling
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}