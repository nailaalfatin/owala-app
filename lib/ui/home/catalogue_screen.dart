import 'package:e_commerce/consts.dart';
import 'package:e_commerce/models/products.dart';
import 'package:e_commerce/settings/profile_screen.dart';
import 'package:e_commerce/settings/settings_screen.dart';
import 'package:e_commerce/state-management/theme_provider.dart';
import 'package:e_commerce/ui/home/components/bottom_nav_bar.dart';
import 'package:e_commerce/ui/home/components/categories.dart';
import 'package:e_commerce/ui/home/components/items_card.dart';
import 'package:e_commerce/ui/wishlist/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CatalogeScreen extends StatefulWidget {
  const CatalogeScreen({super.key});

  @override
  State<CatalogeScreen> createState() => _CatalogeScreenState();
}

class _CatalogeScreenState extends State<CatalogeScreen> {
  int _selectedIndex = 0;

  //ini adalah cara gimana kita bernavigasi menggunakan buttom navbar
  //Daftar buat nampilin tiap tab
  final List<Widget> _widgetOptions = [
    const CatalogeScreen(),
    const WishlistScreen(),
    const SettingsScreen(),
    const ProfileScreen()
  ];

  // function untuk aksi tap pada buttom navbar
  void _onItemTapped(int index) {
    setState(() {
      // ini itu untuk menyatakan bahwa initial action untuk menampikan 
      // objek yang berada pada index ke-0
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: _selectedIndex == 0 ? AppBar(
        automaticallyImplyLeading: false, // buat ilangin tombol back
        backgroundColor: themeProvider.isDarkTheme ? const Color(0xFF121212) : Colors.white,
        elevation: 0, // Hilangin shadow di AppBar
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Location",
                    style: TextStyle(
                      color: themeProvider.isDarkTheme ? Colors.white.withOpacity(0.6) : Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    "Jakarta, Indonesia",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: themeProvider.isDarkTheme ? textColorDarkMOde : Colors.black,
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
            icon: Icon(
              Icons.shopping_cart_outlined,
              color: themeProvider.isDarkTheme ? textColorDarkMOde : Colors.black,
            )
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_none,
              color: themeProvider.isDarkTheme ? textColorDarkMOde : Colors.black,
            ),
          ),
        ],
      ): null,

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
                      color: themeProvider.isDarkTheme ? Colors.black : Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.account_balance_wallet, color: Color(0xFF236A91)),
                            const SizedBox(width: 8),
                            Text(
                              "Bottles",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: themeProvider.isDarkTheme ? textColorDarkMOde : Colors.black,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Rp119.500",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: themeProvider.isDarkTheme ? textColorDarkMOde : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Icon(
                            Icons.arrow_upward, 
                            color: themeProvider.isDarkTheme ? textColorDarkMOde : Colors.white,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "Pay",
                            style: TextStyle(color:themeProvider.isDarkTheme ? textColorDarkMOde : Colors.white,)
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(
                            Icons.add_circle, 
                            color: themeProvider.isDarkTheme ? textColorDarkMOde : Colors.white,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "Top Up",
                            style: TextStyle(color: themeProvider.isDarkTheme ? textColorDarkMOde : Colors.white,)
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(
                            Icons.explore, 
                            color: themeProvider.isDarkTheme ? textColorDarkMOde : Colors.white,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "Explore",
                            style: TextStyle(color: themeProvider.isDarkTheme ? textColorDarkMOde : Colors.white,)
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
          Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: Text(
              "Drinkware",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: themeProvider.isDarkTheme ? textColorDarkMOde : textColor
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