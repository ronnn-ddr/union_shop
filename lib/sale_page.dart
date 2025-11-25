import 'package:flutter/material.dart';

class SalePage extends StatelessWidget {
  // Sample sale products
  final List<Map<String, dynamic>> saleProducts = [
    {
      'name': 'Rainbow Hoodie',
      'image': 'assets/images/RainbowHoodie.png',
      'price': 25.00,
      'originalPrice': 30.00,
      'description':
          'Introducing our new Rainbow Hoodie! With a prominent Rainbow print, this hoodie is a must have!',
      'material': '100% Cotton',
      'sizes': ['S', 'M', 'L', 'XL'],
    },
    {
      'name': 'Union T-Shirt',
      'image': 'assets/images/UnionTShirt.png',
      'price': 12.00,
      'originalPrice': 15.00,
      'description': 'Comfortable cotton t-shirt with Union logo.',
      'material': '100% Cotton',
      'sizes': ['S', 'M', 'L', 'XL'],
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final padding = isMobile ? 16.0 : 32.0;

    return Scaffold(
      appBar: AppBar(
        title: Text('Sale', style: TextStyle(fontFamily: 'WorkSans')),
        backgroundColor: Color(0xFF4d2963),
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(padding),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: isMobile ? 2 : 3,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
            childAspectRatio: 0.75,
          ),
          itemCount: saleProducts.length,
          itemBuilder: (context, index) {
            final product = saleProducts[index];
            return SaleProductCard(
              title: product['name'],
              originalPrice: '£${product['originalPrice'].toStringAsFixed(2)}',
              salePrice: '£${product['price'].toStringAsFixed(2)}',
              imageUrl: product['image'],
              description: product['description'],
            );
          },
        ),
      ),
    );
  }
}

class SaleProductCard extends StatelessWidget {
  final String title;
  final String originalPrice;
  final String salePrice;
  final String imageUrl;
  final String description;

  const SaleProductCard({
    super.key,
    required this.title,
    required this.originalPrice,
    required this.salePrice,
    required this.imageUrl,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.asset(
              imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
              errorBuilder: (context, error, stackTrace) => Container(
                height: 150,
                color: Colors.grey[300],
                child: Icon(Icons.image_not_supported, size: 50),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: 'WorkSans',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      salePrice,
                      style: TextStyle(
                        fontFamily: 'WorkSans',
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      originalPrice,
                      style: TextStyle(
                        fontFamily: 'WorkSans',
                        fontSize: 14,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    fontFamily: 'WorkSans',
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    // TODO: Navigate to product
                  },
                  child: Text('View Details',
                      style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF4d2963),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
