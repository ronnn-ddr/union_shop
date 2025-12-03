import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:union_shop/product_page.dart';
import 'package:union_shop/about_page.dart';
import 'package:union_shop/collections.dart';
import 'package:union_shop/collection_page.dart';
import 'package:union_shop/sale_page.dart';
import 'package:union_shop/login_page.dart';
import 'package:union_shop/widgets/header_widget.dart';
import 'package:union_shop/widgets/footer_widget.dart';
import 'package:union_shop/models/cart.dart';
import 'package:union_shop/data/products.dart';
import 'package:union_shop/models/product.dart';

void main() {
  runApp(const UnionShopApp());
}

class UnionShopApp extends StatelessWidget {
  const UnionShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Cart(),
      child: MaterialApp(
        title: 'Union Shop',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF4d2963)),
        ),
        home: const HomeScreen(),
        // By default, the app starts at the '/' route, which is the HomeScreen
        initialRoute: '/',
        onGenerateRoute: (settings) {
          final uri = Uri.parse(settings.name ?? '/');
          if (uri.path == '/') {
            return MaterialPageRoute(
              builder: (context) => const HomeScreen(),
              settings: RouteSettings(name: settings.name),
            );
          } else if (uri.path.startsWith('/product')) {
            final id = uri.pathSegments.length > 1 ? uri.pathSegments[1] : null;
            final product = id != null
                ? products.firstWhere((p) => p.id == id,
                    orElse: () => products[0])
                : products[0];
            return MaterialPageRoute(
              builder: (context) => ProductPage(product: product),
              settings: RouteSettings(name: settings.name, arguments: product),
            );
          } else if (uri.path == '/about') {
            return MaterialPageRoute(
              builder: (context) => const AboutPage(),
              settings: RouteSettings(name: settings.name),
            );
          } else if (uri.path.startsWith('/shop')) {
            if (uri.pathSegments.length == 1) {
              // '/shop' -> Collections page
              return MaterialPageRoute(
                  builder: (context) => const Collections(),
                  settings: RouteSettings(name: settings.name));
            } else if (uri.pathSegments.length == 2) {
              // '/shop/<id>' -> CollectionPage
              final id = uri.pathSegments[1];
              return MaterialPageRoute(
                builder: (context) => CollectionPage(collectionId: id),
                settings: RouteSettings(name: settings.name),
              );
            }
            return MaterialPageRoute(
                builder: (context) => const Collections(),
                settings: RouteSettings(name: settings.name));
          } else if (uri.path == '/sale') {
            return MaterialPageRoute(
              builder: (context) => SalePage(),
              settings: RouteSettings(name: settings.name),
            );
          } else if (uri.path == '/login') {
            return MaterialPageRoute(
              builder: (context) => const LoginPage(),
              settings: RouteSettings(name: settings.name),
            );
          }
          return null;
        },
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Use the reusable HeaderWidget
            const HeaderWidget(),

            // Hero Section
            SizedBox(
              height: 400,
              width: double.infinity,
              child: Stack(
                children: [
                  // Background image (use Image.asset so we can show a fallback with errorBuilder)
                  Positioned.fill(
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: Image.asset(
                            'assets/images/Personalisation.png',
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
                        ),
                        // Semi-transparent overlay
                        Positioned.fill(
                          child: Container(
                            color: const Color.fromRGBO(0, 0, 0, 0.35),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Content overlay
                  Positioned(
                    left: 24,
                    right: 24,
                    top: 80,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'The Print Shack',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            height: 1.2,
                            fontFamily: 'WorkSans',
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          "Let's create something uniquely yours with our personalisation service - From £3 for one line of text!",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            height: 1.5,
                            fontFamily: 'WorkSans',
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 32),
                        ElevatedButton(
                          onPressed: placeholderCallbackForButtons,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF4d2963),
                            foregroundColor: Colors.white,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                          ),
                          child: const Text(
                            'FIND OUT MORE',
                            style: TextStyle(
                                fontSize: 14,
                                letterSpacing: 1,
                                fontFamily: 'WorkSans'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Products Section
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  children: [
                    const Text(
                      'PRODUCTS SECTION',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        letterSpacing: 1,
                        fontFamily: 'WorkSans',
                      ),
                    ),
                    const SizedBox(height: 48),
                    GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount:
                          MediaQuery.of(context).size.width > 800 ? 2 : 1,
                      crossAxisSpacing: 24,
                      mainAxisSpacing: 48,
                      children: [
                        ProductCard(product: products[0]),
                        ProductCard(product: products[1]),
                        ProductCard(product: products[2]),
                        ProductCard(product: products[3]),
                      ],
                    ),
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
  final Product product;

  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final displayPrice = product.salePrice ?? product.price;
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/product/${product.id}');
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.asset(
              product.image,
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
                product.name,
                style: const TextStyle(
                    fontSize: 14, color: Colors.black, fontFamily: 'WorkSans'),
                maxLines: 2,
              ),
              const SizedBox(height: 4),
              Text(
                '£${displayPrice.toStringAsFixed(2)}',
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
