import 'package:e_commerce/consts.dart';
import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

//state atas untuk menyimpen apa yg digunakan oleh super class
//state bawah buat variable variable kecil
class _CategoriesState extends State<Categories> {
  //list itu kurung kotak []
  //kalo map itu kurung kurawal{}
  //kalo ini list, pengembailan nya juga harus list, gabisa langsung dipanggil
  
  List<Map<String, dynamic>> categories = [
    {"icon": Icons.local_drink, "text": "Drinkware"},
    {"icon": Icons.color_lens, "text": "Color Drop"},
    {"icon": Icons.card_giftcard, "text": "Bundles"},
    {"icon": Icons.accessibility, "text": "Accessories"},
  ];
  int selectedIndex = 0; //buat ngasi tau perubahan indexnya

  @override
  Widget build(BuildContext context) {
    //Ini buat bikin daftar kategori yang bisa di-scroll dan kasih jarak vertikal
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 23),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title and view all
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Categories",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              GestureDetector(
                onTap: () {},  //ini masi dummy
                child: const Text(
                  "view all",
                  style: TextStyle(
                    color: Color(0xFF236A91),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: defaultPadding), // Memberikan sedikit jarak

          // Horizontal list of categories with icons
          SizedBox(
            height: 65, // Atur tinggi untuk ikon dan teks
            child: ListView.builder( //membuat list yang bisa di-scroll secara horizontal
              scrollDirection: Axis.horizontal, //mengatur arah scroll menjadi horizontal
              itemCount: categories.length,
              //item builder itu buat membangun atau menampung data (apapun yang akan tampil di layar)
              itemBuilder: (context, index) => _buildCategory(index),
            ),
          ),
        ],
      ),
    );
  }

  GestureDetector _buildCategory(int index) {
    return GestureDetector( //untuk mendeteksi gesture dari apa saja kayak ketuk atau geser atau longpress
      //Ini buat ngubah kategori yang dipilih pas diklik (inisialisasi)
      onTap: () {
        setState(() {
          selectedIndex = index; 
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10), // Mengurangi padding agar lebih kecil
              decoration: BoxDecoration(
                color: selectedIndex == index ? primaryColor.withOpacity(0.1) : Colors.white,
                shape: BoxShape.circle,
              ),
              child: Icon(
                categories[index]["icon"],
                color: selectedIndex == index ? primaryColor : secondaryColor,
                size: 20,
              ),
            ),
            const SizedBox(height: 7),
            Text(
              categories[index]["text"],
              style: TextStyle(
                color: selectedIndex == index ? primaryColor : secondaryColor,
                fontWeight: selectedIndex == index ? FontWeight.bold : FontWeight.normal,
                fontSize: 12
              ),
            ),
          ],
        ),
      ),
    );
  }
}
