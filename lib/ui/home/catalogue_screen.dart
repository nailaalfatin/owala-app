import 'package:e_commerce/consts.dart';
import 'package:e_commerce/models/products.dart';
import 'package:e_commerce/ui/detail/detail_screen.dart';
import 'package:e_commerce/ui/home/components/categories.dart';
import 'package:e_commerce/ui/home/components/items_card.dart';
import 'package:flutter/material.dart';
class CatalogeScreen extends StatelessWidget {
  const CatalogeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, //biar gaada back buttonnya
        backgroundColor: Colors.white,
        elevation: 0, // untuk  menghilangkan efek bayangan
        actions: [
          IconButton(
            onPressed: () {}, 
            icon: const Icon(Icons.search)
          ),
          IconButton(
            onPressed: () {}, 
            icon: const Icon(Icons.shopping_cart_outlined)
          )
        ],
      ),
      body: Column(
        // crossaxis yg berlawanan sama sumbu
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Text(
              "Owala",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30
              ),
            ),
          ),
          const Categories(), // buat nampilin viewpager
          Expanded(
            // GridView: cara menampilkan list dgn berbentuk kolom dan list, jadi dia itu kotak' gitu
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: GridView.builder(
                // sliver buat bungkus widget biasa biar bisa di costom scroll view
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount( // gridDelegate membungkus widget biasa biar bisa di tempatin dalam custom scrollview (lebih banyak opsi dar sliver)
                  crossAxisCount: 2,
                  mainAxisSpacing: defaultPadding,
                  crossAxisSpacing: defaultPadding,
                  childAspectRatio: 0.75 // perbandingan  antara lebar dan tinggi tiap item
                ),
                //jumlah item yang akan ditampilkan sesuai sama produck nya
                itemCount: products.length,
                //itemBuilder jumbatan/adapter untuk itemcard
                itemBuilder: (context, index) => ItemsCard(
                  product: products[index],
                  press: () => Navigator.push(
                    context, //represent dari currentpage
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(product: products[index]))
                    )
                  ),
              ),
            )
          )
        ],
      ),
    );
  }
}