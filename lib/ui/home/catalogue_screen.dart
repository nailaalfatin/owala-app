import 'package:e_commerce/consts.dart';
import 'package:e_commerce/models/products.dart';
import 'package:e_commerce/settings/settings_screen.dart';
import 'package:e_commerce/ui/home/components/bottom_nav_bar.dart';
import 'package:e_commerce/ui/home/components/categories.dart';
import 'package:e_commerce/ui/home/components/items_card.dart';
import 'package:e_commerce/settings/profile_screen.dart';
import 'package:e_commerce/ui/wishlist/wishlist_screen.dart';
import 'package:flutter/material.dart';

class CatalogeScreen extends StatefulWidget {
  const CatalogeScreen({super.key});

  @override
  State<CatalogeScreen> createState() => _CatalogeScreenState();
}

class _CatalogeScreenState extends State<CatalogeScreen> {
  int _selectedIndex = 0;

  //Daftar buat nampilin tiap tab
  final List<Widget> _widgetOptions = [
    const CatalogeScreen(),
    const WishlistScreen(),
    const SettingsScreen(),
    const ProfileScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // buat ilangin tombol back
        backgroundColor: Colors.white,
        elevation: 0, // Hilangin shadow di AppBar
        title: const Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Location",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    "Jakarta, Indonesia",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/cart');
            },
            icon: const Icon(Icons.shopping_cart_outlined),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none),
          ),
        ],
      ),

  //Disini kita make ternary operator (mirip kaya oneline if else)
      body: _selectedIndex == 0 //ini kondisinya
  ? SingleChildScrollView( //ini nilai true nya
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // widget saldo dengan Expanded di dalam Container biar gak overflow
          Container(
            margin: const EdgeInsets.only(
              top: defaultPadding,
              left: defaultPadding,
              right: defaultPadding,
              bottom: 5,
            ),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: const Color(0xFF236A91),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.account_balance_wallet, color: Color(0xFF236A91)),
                            SizedBox(width: 8),
                            Text(
                              "Owala",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Rp119.500",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Expanded(
                  flex: 3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Icon(Icons.arrow_upward, color: Colors.white),
                          SizedBox(height: 4),
                          Text(
                            "Pay",
                            style: TextStyle(color: Colors.white)
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(Icons.add_circle, color: Colors.white),
                          SizedBox(height: 4),
                          Text(
                            "Top Up",
                            style: TextStyle(color: Colors.white)
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(Icons.explore, color: Colors.white),
                          SizedBox(height: 4),
                          Text(
                            "Explore",
                            style: TextStyle(color: Colors.white)
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // bagian banner dengan ConstrainedBox biar fix ukurannya
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxHeight: 180,
            ),
            child: PageView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Image.asset(
                    "assets/images/banner_01.png",
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Image.asset(
                    "assets/images/banner_02.png",
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Image.asset(
                    "assets/images/banner_03.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 15),
          const Categories(),
          const SizedBox(height: 15),
          const Padding(
            padding: EdgeInsets.all(defaultPadding),
            child: Text(
              "Drinkware",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: defaultPadding,
                crossAxisSpacing: defaultPadding,
                childAspectRatio: 0.75,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) => ItemsCard(
                product: products[index],
                press: () => Navigator.pushNamed(
                  context,
                  '/detail',
                  arguments: products[index],
                ),
              ),
            ),
          ),
        ],
      ),
    )
  : _widgetOptions[_selectedIndex], // nah ini nilai false nya

  bottomNavigationBar: BottomNavBar(
    selectedIndex: _selectedIndex, 
    onItemTapped: _onItemTapped
  ),

    );
  }
}
