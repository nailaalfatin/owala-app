import 'package:e_commerce/consts.dart';
import 'package:flutter/material.dart';

class CartCounter extends StatefulWidget {
  const CartCounter({super.key});

  @override
  State<CartCounter> createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
  int numOfItems = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            minimumSize: const Size(33, 33),
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            )
          ),
          onPressed: () {
            setState(() {
              if (numOfItems > 1) { 
                //if (numOfItems > 1) itu untuk cek apakah numOfItems (jumlah item) lebih dari 1
                //Tujuannya biar jumlah item gak jadi kurang dari 1, supaya gak bisa jadi 0 atau negatif.
                setState(() {
                  numOfItems --;
                  //Kalau jumlahnya lebih dari 1, maka bagian numOfItems-- akan ngurangin jumlah item itu 1 angka. 
                  //Misalnya tadinya 3, jadi 2, dan seterusnya. Tapi kalau jumlahnya cuma 1, gak bakal dikurangin lagi.
                });
              }
            });
          },
          child: const Icon(Icons.remove)
        ),
        const SizedBox(width: 2), //ini buat jarak dari button ke angka ke button lain
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Text(
            numOfItems.toString().padLeft(2, "0"), 
            //padeft itu buat kalau teksnya kurang dari 2 digit, tambahin "0" di depannya
            //jadi, kalau angkanya 5, hasilnya jadi "05". Kalau angkanya 12, hasilnya tetap "12". tujuannya biar selalu tampil 2 digit.
            style: const TextStyle(
              fontSize: 18,
              color: textColor
            ),
          ),
        ),
        const SizedBox(width: 2), //ini buat jarak dari button ke angka ke button lain
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            minimumSize: const Size(33, 33),
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            )
          ),
          onPressed: () {
            setState(() {
              numOfItems ++;
            });
          },
          child: const Icon(Icons.add)
        ),
      ],
    );
  }
}