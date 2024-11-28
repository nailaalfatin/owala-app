import 'package:e_commerce/consts.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;
  
  const BottomNavBar({
    super.key, required this.selectedIndex, 
    required this.onItemTapped}
  );

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'Wishlist'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile'
        )
      ],
      currentIndex: selectedIndex,
      selectedItemColor: primaryColor,
      unselectedItemColor: Colors.grey,
      // backgroundColor: Colors.yellow,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      onTap: onItemTapped,
    );
  }
}