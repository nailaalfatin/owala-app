import 'package:flutter/material.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Favourite'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          _buildFavouriteItem(
            imageUrl: 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/d7yyh7rta3tkye7kdyka/NIKE+AIR+MAX+97.png',
            title: 'Nike Jordan',
            price: '\$58.7',
            isBestSeller: true,
            colors: [Colors.yellow, Colors.teal],
          ),
          _buildFavouriteItem(
            imageUrl: 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/d7yyh7rta3tkye7kdyka/NIKE+AIR+MAX+97.png',
            title: 'Nike Air Max',
            price: '\$37.8',
            isBestSeller: true,
            colors: [Colors.lightBlue, Colors.grey],
          ),
          _buildFavouriteItem(
            imageUrl: 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/d7yyh7rta3tkye7kdyka/NIKE+AIR+MAX+97.png',
            title: 'Nike Club Max',
            price: '\$47.7',
            isBestSeller: true,
            colors: [Colors.blue, Colors.yellow],
          ),
          _buildFavouriteItem(
            imageUrl: 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/d7yyh7rta3tkye7kdyka/NIKE+AIR+MAX+97.png',
            title: 'Nike Air Max',
            price: '\$57.6',
            isBestSeller: true,
            colors: [Colors.teal, Colors.blue],
          ),
        ],
      ),
    );
  }

  Widget _buildFavouriteItem({
    required String imageUrl,
    required String title,
    required String price,
    required bool isBestSeller,
    required List<Color> colors,
  }) 
  
  {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.network (imageUrl, fit: BoxFit.fill),
              if (isBestSeller)
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    color: Colors.red,
                    child: const Text(
                      'BEST SELLER',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              price,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}