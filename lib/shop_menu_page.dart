import 'package:flutter/material.dart';

class ShopMenuPage extends StatelessWidget {
  const ShopMenuPage({super.key});

  void _onCategoryTap(BuildContext context, String category) {
    switch (category) {
      case 'Clothing':
        Navigator.pushNamed(context, '/clothing');
        break;
      default:
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Coming soon: $category products'),
            duration: const Duration(seconds: 2),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final categories = [
      'Clothing',
      'Merchandise',
      'Signature & Essential Range',
      'Portsmouth City Collection',
      'Graduation',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Store Categories',
          style: TextStyle(fontFamily: 'WorkSans'),
        ),
        backgroundColor: const Color(0xFF4d2963),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Choose a Category',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: 'WorkSans',
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: categories.map((category) {
                  return Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: InkWell(
                      onTap: () => _onCategoryTap(context, category),
                      borderRadius: BorderRadius.circular(8),
                      child: category == 'Clothing'
                          ? Stack(
                              fit: StackFit.expand,
                              children: [
                                Image.asset(
                                  'assets/images/RainbowHoodie.png',
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      color: Colors.grey[300],
                                      child: const Center(
                                        child: Icon(Icons.image_not_supported,
                                            color: Colors.grey),
                                      ),
                                    );
                                  },
                                ),
                                Positioned(
                                  bottom: 0,
                                  left: 0,
                                  right: 0,
                                  child: Container(
                                    color: Colors.black.withOpacity(0.6),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 12),
                                    child: Text(
                                      category,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'WorkSans',
                                        color: Colors.white,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : Center(
                              child: Text(
                                category,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'WorkSans',
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
