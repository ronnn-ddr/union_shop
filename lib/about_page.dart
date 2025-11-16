import 'package:flutter/material.dart';
import 'package:union_shop/widgets/header_widget.dart';
import 'package:union_shop/widgets/footer_widget.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

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
                      placeholderCallbackForButtons();
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
                      Navigator.pop(context);
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
            const HeaderWidget(),

            // About Content
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(40.0),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      'About us',
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontFamily: 'WorkSans',
                      ),
                    ),
                  ),
                  SizedBox(height: 24),
                  Text(
                    'Welcome to the Union Shop!\n\nWe\'re dedicated to giving you the very best University branded products, with a range of clothing and merchandise available to shop all year round! We even offer an exclusive personalisation service!\n\nAll online purchases are available for delivery or instore collection!\n\nWe hope you enjoy our products as much as we enjoy offering them to you. If you have any questions or comments, please don\'t hesitate to contact us at hello@upsu.net.\n\nHappy shopping!\n\nThe Union Shop & Reception Team',
                    style: TextStyle(
                      fontSize: 18,
                      height: 1.6,
                      color: Colors.black87,
                      fontFamily: 'WorkSans',
                    ),
                  ),
                ],
              ),
            ),
            const FooterWidget(),
          ],
        ),
      ),
    );
  }
}
