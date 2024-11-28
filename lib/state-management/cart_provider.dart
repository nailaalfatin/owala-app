import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String title;
  final int price;
  final String image;
  int quantity;

  CartItem({
    required this.id, 
    required this.title, 
    required this.price,
    required this.image,
    
    //default quantity
    this.quantity = 1
  });
}

// biar kita tau apa bedanya OOP dan FP(functional programming)
class CartProvider with ChangeNotifier {
  Map<String, CartItem> _items = {};
  Map<String, CartItem> get items => _items;

  //ini buat ngitung total harga barang di keranjang
  //fungsinya untuk menghandle perhitungan total harga yang ada di keranjang
  int get totalPrice {
    return _items.values.fold( //ini sintaks buat mengoperasikan operasi matematika
      //initial status sebelum operasi matematika dilakukan
      0,
      (sum, item) => sum + item.price * item.quantity
    );
  }

  void addItem(String id, String title, int price, String image, int quantity) {
    //kalau produk udah ada di keranjang, makanya tinggal add lagi
    //ini untuk menambahkan item ke keranjang dengan jumlah yang ditentukan dari cart counter
    if (_items.containsKey(id)) {
      //ini buat menambah
      _items[id]!.quantity += quantity ; //kenapa pake bank operatir? karna buat ngasih tau kalo ini tuh ga null, 
    } else {
      _items[id] = CartItem(id: id, title: title, price: price, image: image, quantity: quantity);
    }
    notifyListeners();
  }

  void removeItems(String id) {
    //ini kalo mau langsung hapus semua
    _items.remove(id);

    //ini itu kalo mau hapusnya satu satu
    // if (_items.containsKey(id)) {
    //   // buang ngurangin kuantitas item
    //   _items[id]!.quantity--;
    // }

    // //jika kuantitas menjadi 0, hapus item dari keranjang
    // if (_items[id]!.quantity <= 0) {
    //   _items.remove(id);
    // }
    notifyListeners();
  }
}