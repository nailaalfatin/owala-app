import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String title;
  final int price;

  CartItem({required this.id, required this.title, required this.price});
}

// biar kita tau apa bedanya OOP dan FP(functional programming)
class CartProvider with ChangeNotifier {
  final Map<String, CartItem> _items = {};

  Map<String, CartItem> get items => _items;

  int get itemCount => _items.length;

  void addItem(String id, String title, int price) {
    if (_items.containsKey(id)) {
      return;
    } else {
      _items.putIfAbsent(
        id,
        () => CartItem(id: id, title: title, price: price)
      );
    }
    notifyListeners();
  }

  void removeItems(String id) {
    _items.remove(id);
    notifyListeners();
  }

  //ini buat ngapus cache
  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}