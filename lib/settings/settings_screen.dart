import 'package:e_commerce/consts.dart';
import 'package:e_commerce/state-management/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Account'),
        centerTitle: true,
        backgroundColor: themeProvider.isDarkTheme ? Colors.black : Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: themeProvider.isDarkTheme ? textColorDarkMOde: Colors.black),
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
      body: Container(
        color: themeProvider.isDarkTheme ? Colors.black : Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            _buildListTile(Icons.person_outline, 'Your Profile',themeProvider.isDarkTheme),
            _buildListTile(Icons.receipt_outlined, 'My Order',themeProvider.isDarkTheme),
            _buildListTile(Icons.credit_card, 'Payment Methods',themeProvider.isDarkTheme),
            _buildListTile(Icons.notifications_none, 'Notifications',themeProvider.isDarkTheme),
            _buildListTile(Icons.lock_outline, 'Privacy Policy',themeProvider.isDarkTheme),
            _buildListTile(Icons.help_outline, 'Help Center',themeProvider.isDarkTheme),
            _buildListTile(Icons.person_add_alt, 'Invite Friends',themeProvider.isDarkTheme),
            const Divider(height: 30, color: Colors.grey),
            SwitchListTile(
              title: Text(
                'Dark Theme',
                style: TextStyle(color: themeProvider.isDarkTheme ? textColorDarkMOde : Colors.black),
              ),
              value: themeProvider.isDarkTheme,
              activeColor: Colors.blue,
              inactiveTrackColor: Colors.transparent,
              onChanged: themeProvider.toggleTheme,
            ),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text(
                'Log Out',
                style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
              onTap: () {},
            ),
            
          ],
        ),
      ),
    );
  }

  ListTile _buildListTile(IconData icon, String title, bool isDarkTheme) {
    return ListTile(
      leading: Icon(icon, color: isDarkTheme ? textColorDarkMOde : Colors.black),
      title: Text(
        title,
        style: TextStyle(
          color: isDarkTheme ? textColorDarkMOde : Colors.black,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: () {},
    );
  }
}
