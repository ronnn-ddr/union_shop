import 'package:flutter/material.dart';
import 'widgets/header_widget.dart';
import 'widgets/footer_widget.dart';
import 'data/products.dart';
import 'models/product.dart';

class SalePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final saleProducts = products.where((p) => p.salePrice != null).toList();
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 800;
    final padding = isDesktop ? 32.0 : 16.0;

    return Scaffold(
      body: Column(
        children: [
          const HeaderWidget(),
          Expanded(
            child: Column(
              children: [
                Center(
                  child: Text(
                    'SALE',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: 'WorkSans',
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Center(
                  child: Text(
                    "Don't miss out! Get yours before they're all gone! All prices shown are inclusive of the discount.",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                      fontFamily: 'WorkSans',
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 32),
                Expanded(
                  child: Container(
                    color: Colors.white,
                    padding: EdgeInsets.all(padding),
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: isDesktop ? 3 : 2,
                        crossAxisSpacing: 16.0,
                        mainAxisSpacing: 16.0,
                        childAspectRatio: 0.75,
                      ),
                      itemCount: saleProducts.length,
                      itemBuilder: (context, index) {
                        final product = saleProducts[index];
                        return SaleProductCard(product: product);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          const FooterWidget(),
        ],
      ),
    );
  }
}

class SaleProductCard extends StatelessWidget {
  final Product product;

  const SaleProductCard({
    super.key,
    required this.product,
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
              product.image,
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
                  product.name,
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
                      '£${product.salePrice!.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontFamily: 'WorkSans',
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      '£${product.price.toStringAsFixed(2)}',
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
                  product.description,
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
                    Navigator.pushNamed(context, '/product/${product.id}');
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
