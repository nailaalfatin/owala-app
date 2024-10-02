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
  
  List<String> categories = [
    "Drinkware",
    "Color Drop",
    "Bundles",
    "Accessories"
  ];
  int selectedIndex = 0; //buat ngasi tau perubahan indexnya

  @override
  Widget build(BuildContext context) {
    //Ini buat bikin daftar kategori yang bisa di-scroll dan kasih jarak vertikal
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding),
      child: SizedBox(
        height: 25,
        child: ListView.builder( //membuat list yang bisa di-scroll secara horizontal
          itemCount: categories.length,
          //item builder itu buat membangun atau menampung data (apapun yang akan tampil di layar)
          itemBuilder: (context, index) => _buildCategory(index),
          scrollDirection: Axis.horizontal, //mengatur arah scroll menjadi horizontal
        ),
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
          children: [
            Text(
              categories[index],
              style: TextStyle(
                color: selectedIndex == index ? primaryColor : secondaryColor,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 3
              ),
              height: 2,
              width: 30,
              color: selectedIndex == index ? primaryColor : secondaryColor,
            )
          ],
        ),
      ),
    );
  }
}