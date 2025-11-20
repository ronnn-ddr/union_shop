import 'package:flutter/material.dart';
import 'package:union_shop/widgets/header_widget.dart';
import 'package:union_shop/widgets/footer_widget.dart';

class ClothingPage extends StatefulWidget {
  const ClothingPage({super.key});

  @override
  State<ClothingPage> createState() => _ClothingPageState();
}

class _ClothingPageState extends State<ClothingPage> {
  String _selectedFilter = 'All Products';

  final List<Map<String, String>> _products = [
    {
      'title': 'Rainbow Hoodie',
      'price': '£25.00',
      'image': 'assets/images/RainbowHoodie.png'
    },
  ];

  void navigateToHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  void navigateToProduct(BuildContext context) {
    Navigator.pushNamed(context, '/product');
  }

  void placeholderCallbackForButtons() {
    // This is the event handler for buttons that don't work yet
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;
    return Scaffold(
      drawer: isMobile
          ? Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  const DrawerHeader(
                    decoration: BoxDecoration(
                      color: Color(0xFF4d2963),
                    ),
                    child: Text(
                      'Union Shop',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontFamily: 'WorkSans',
                      ),
                    ),
                  ),
                  ListTile(
                    title: const Text('Home',
                        style: TextStyle(fontFamily: 'WorkSans')),
                    onTap: () {
                      Navigator.pop(context); // close drawer
                      navigateToHome(context);
                    },
                  ),
                  ListTile(
                    title: const Text('Shop',
                        style: TextStyle(fontFamily: 'WorkSans')),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/shop');
                    },
                  ),
                  ListTile(
                    title: const Text('The Print Shack',
                        style: TextStyle(fontFamily: 'WorkSans')),
                    onTap: () {
                      Navigator.pop(context);
                      placeholderCallbackForButtons();
                    },
                  ),
                  ListTile(
                    title: const Text('SALE!',
                        style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'WorkSans')),
                    onTap: () {
                      Navigator.pop(context);
                      placeholderCallbackForButtons();
                    },
                  ),
                  ListTile(
                    title: const Text('About',
                        style: TextStyle(fontFamily: 'WorkSans')),
                    onTap: () {
                      Navigator.pop(context); // close drawer
                      Navigator.pushNamed(context, '/about');
                    },
                  ),
                  ListTile(
                    title: const Text('UPSU.net',
                        style: TextStyle(fontFamily: 'WorkSans')),
                    onTap: () {
                      Navigator.pop(context);
                      placeholderCallbackForButtons();
                    },
                  ),
                ],
              ),
            )
          : null,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Use the reusable HeaderWidget
            const HeaderWidget(),

            // Clothing Page Content
            Container(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40),
                    const Text(
                      'CLOTHING',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'WorkSans',
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Filter Dropdown
                    Container(
                      width: 200,
                      child: DropdownButtonFormField<String>(
                        initialValue: _selectedFilter,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        ),
                        items: ['All Products', 'Popular']
                            .map((filter) => DropdownMenuItem(
                                  value: filter,
                                  child: Text(
                                    filter,
                                    style: const TextStyle(
                                      fontFamily: 'WorkSans',
                                      fontSize: 14,
                                    ),
                                  ),
                                ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedFilter = value!;
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 40),
                    // Products Grid
                    GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 3,
                      crossAxisSpacing: 24,
                      mainAxisSpacing: 48,
                      children: _products.map((product) {
                        return ProductCard(
                          title: product['title']!,
                          price: product['price']!,
                          imageUrl: product['image']!,
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),

            // Use the reusable FooterWidget
            const FooterWidget(),
          ],
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String title;
  final String price;
  final String imageUrl;

  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/product');
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.asset(
              imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey[300],
                  child: const Center(
                    child: Icon(Icons.image_not_supported, color: Colors.grey),
                  ),
                );
              },
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 4),
              Text(
                title,
                style: const TextStyle(
                    fontSize: 14, color: Colors.black, fontFamily: 'WorkSans'),
                maxLines: 2,
              ),
              const SizedBox(height: 4),
              Text(
                price,
                style: const TextStyle(
                    fontSize: 13, color: Colors.grey, fontFamily: 'WorkSans'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
