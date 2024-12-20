import 'package:flutter/material.dart';

class WishlistItem {
  final String id;
  final String title;
  final int price;
  final String image;
  final Color color;

  WishlistItem(this.image, this.color, {required this.id, required this.title, required this.price});
}

class WishlistProvider with ChangeNotifier {
  //ini setternya
  final Map<String, WishlistItem> _wishlistItems = {};

  Map<String, WishlistItem> get wishlistItem => _wishlistItems;

  int get itemCount => wishlistItem.length;

  void addItemToFav(String id, String title, int price, String image, Color color) {
    if (_wishlistItems.containsKey(id)) {
      //jika sudah ada item yang ditambahkan ke wishlist
      return;
    } else {
      //kenapa kita pake id? karna sebelumnya udah kita definisikan di yang atas itu
      _wishlistItems.putIfAbsent(
        id,
        () => WishlistItem(image, color, id: id, title: title, price: price)
      );
    }
    notifyListeners();
  }

  void removeItemFromFav(String id) {
    _wishlistItems.remove(id);
    notifyListeners();
  }

  void clearWishlist() {
    _wishlistItems.clear();
    notifyListeners();
  }
}