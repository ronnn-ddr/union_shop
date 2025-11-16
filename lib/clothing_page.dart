import 'package:flutter/material.dart';

class ClothingPage extends StatefulWidget {
  const ClothingPage({super.key});

  @override
  State<ClothingPage> createState() => _ClothingPageState();
}

class _ClothingPageState extends State<ClothingPage> {
  String _selectedFilter = 'All Products';

  final List<Map<String, String>> _products = [
    {
      'title': 'Classic Hoodie',
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

  Widget _buildFooterSection(String title, dynamic items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontFamily: 'WorkSans',
          ),
        ),
        const SizedBox(height: 12),
        ...items.map((item) {
          if (item is String) {
            // Simple text item
            return Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Text(
                item,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  fontFamily: 'WorkSans',
                ),
              ),
            );
          } else if (item is Map<String, dynamic>) {
            // Clickable item
            return Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: GestureDetector(
                onTap: item['onTap'] as VoidCallback?,
                child: Text(
                  item['text'] as String,
                  style: TextStyle(
                    fontSize: 14,
                    color: item['onTap'] != null ? Colors.blue : Colors.grey,
                    fontFamily: 'WorkSans',
                    decoration:
                        item['onTap'] != null ? TextDecoration.underline : null,
                  ),
                ),
              ),
            );
          }
          return const SizedBox.shrink();
        }),
      ],
    );
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
            // Header
            Container(
              height: 100,
              color: Colors.white,
              child: Column(
                children: [
                  // Top banner
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    color: const Color(0xFF4d2963),
                    child: const Text(
                      'BIG SALE! OUR ESSENTIAL RANGE HAS DROPPED IN PRICE! OVER 20% OFF! COME GRAB YOURS WHILE STOCK LASTS!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'WorkSans'),
                    ),
                  ),
                  // Main header
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              navigateToHome(context);
                            },
                            child: Image.network(
                              'https://shop.upsu.net/cdn/shop/files/upsu_300x300.png?v=1614735854',
                              height: 18,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  color: Colors.grey[300],
                                  width: 18,
                                  height: 18,
                                  child: const Center(
                                    child: Icon(Icons.image_not_supported,
                                        color: Colors.grey),
                                  ),
                                );
                              },
                            ),
                          ),
                          // Navigation buttons
                          Expanded(
                            child: isMobile
                                ? const SizedBox.shrink()
                                : Wrap(
                                    alignment: WrapAlignment.center,
                                    spacing: 8.0,
                                    runSpacing: 4.0,
                                    children: [
                                      TextButton(
                                        onPressed:
                                            placeholderCallbackForButtons,
                                        child: const Text('Home',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12,
                                                fontFamily: 'WorkSans')),
                                      ),
                                      TextButton(
                                        onPressed: () => Navigator.pushNamed(
                                            context, '/shop'),
                                        child: const Text('Shop',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12,
                                                fontFamily: 'WorkSans')),
                                      ),
                                      TextButton(
                                        onPressed:
                                            placeholderCallbackForButtons,
                                        child: const Text('The Print Shack',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12,
                                                fontFamily: 'WorkSans')),
                                      ),
                                      TextButton(
                                        onPressed:
                                            placeholderCallbackForButtons,
                                        child: const Text('SALE!',
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12,
                                                fontFamily: 'WorkSans')),
                                      ),
                                      TextButton(
                                        onPressed: () => Navigator.pushNamed(
                                            context, '/about'),
                                        child: const Text('About',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12,
                                                fontFamily: 'WorkSans')),
                                      ),
                                      TextButton(
                                        onPressed:
                                            placeholderCallbackForButtons,
                                        child: const Text('UPSU.net',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12,
                                                fontFamily: 'WorkSans')),
                                      ),
                                    ],
                                  ),
                          ),
                          ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 600),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(
                                    Icons.search,
                                    size: 18,
                                    color: Colors.grey,
                                  ),
                                  padding: const EdgeInsets.all(8),
                                  constraints: const BoxConstraints(
                                    minWidth: 32,
                                    minHeight: 32,
                                  ),
                                  onPressed: placeholderCallbackForButtons,
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.person_outline,
                                    size: 18,
                                    color: Colors.grey,
                                  ),
                                  padding: const EdgeInsets.all(8),
                                  constraints: const BoxConstraints(
                                    minWidth: 32,
                                    minHeight: 32,
                                  ),
                                  onPressed: placeholderCallbackForButtons,
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.shopping_bag_outlined,
                                    size: 18,
                                    color: Colors.grey,
                                  ),
                                  padding: const EdgeInsets.all(8),
                                  constraints: const BoxConstraints(
                                    minWidth: 32,
                                    minHeight: 32,
                                  ),
                                  onPressed: placeholderCallbackForButtons,
                                ),
                                Builder(
                                  builder: (context) => IconButton(
                                    icon: const Icon(
                                      Icons.menu,
                                      size: 18,
                                      color: Colors.grey,
                                    ),
                                    padding: const EdgeInsets.all(8),
                                    constraints: const BoxConstraints(
                                      minWidth: 32,
                                      minHeight: 32,
                                    ),
                                    onPressed: isMobile
                                        ? () =>
                                            Scaffold.of(context).openDrawer()
                                        : placeholderCallbackForButtons,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

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

            // Footer
            Container(
              width: double.infinity,
              color: Colors.grey[50],
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  // Footer sections
                  LayoutBuilder(
                    builder: (context, constraints) {
                      final isMobile = constraints.maxWidth < 600;
                      return isMobile
                          ? Column(
                              children: [
                                _buildFooterSection('Opening Hours', [
                                  '(Term Time)',
                                  'Monday - Friday: 9:00 AM - 4:00 PM',
                                  "(Outside of Term Time / Consolidation Weeks)",
                                  'Monday - Friday: 9:00 AM - 3:00 PM',
                                ]),
                                const SizedBox(height: 24),
                                _buildFooterSection('Help and Information', [
                                  {
                                    'text': 'Search',
                                    'onTap': placeholderCallbackForButtons
                                  },
                                  {
                                    'text': 'Terms & Conditions of Sale Policy',
                                    'onTap': placeholderCallbackForButtons
                                  },
                                ]),
                              ],
                            )
                          : Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: _buildFooterSection('Opening Hours', [
                                    '(Term Time)',
                                    'Monday - Friday: 9:00 AM - 4:00 PM',
                                    '(Outside of Term Time / Consolidation Weeks)',
                                    'Monday - Friday: 9:00 AM - 3:00 PM',
                                  ]),
                                ),
                                const SizedBox(width: 24),
                                Expanded(
                                  child: _buildFooterSection(
                                      'Help and Information', [
                                    {
                                      'text': 'Search',
                                      'onTap': placeholderCallbackForButtons
                                    },
                                    {
                                      'text':
                                          'Terms & Conditions of Sale Policy',
                                      'onTap': placeholderCallbackForButtons
                                    },
                                  ]),
                                ),
                              ],
                            );
                    },
                  ),
                  const SizedBox(height: 24),
                  // Bottom section with powered by
                  const Text(
                    'Powered by Flutter',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'WorkSans',
                    ),
                  ),
                ],
              ),
            ),
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
