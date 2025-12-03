import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/cart.dart';
import 'widgets/header_widget.dart';
import 'widgets/footer_widget.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Cart>();
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 800;
    final padding = isDesktop ? 32.0 : 16.0;

    return Scaffold(
      body: Column(
        children: [
          const HeaderWidget(),
          Expanded(
            child: cart.itemCount == 0
                ? _buildEmptyCart(context)
                : _buildCartContent(context, cart, padding, isDesktop),
          ),
          const FooterWidget(),
        ],
      ),
    );
  }

  /// Builds the empty cart state with message and continue shopping button
  Widget _buildEmptyCart(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.shopping_cart_outlined,
              size: 120,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 24),
            const Text(
              'Your cart is empty',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontFamily: 'WorkSans',
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Add some items to get started!',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
                fontFamily: 'WorkSans',
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4d2963),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 16,
                ),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
              ),
              child: const Text(
                'Continue Shopping',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'WorkSans',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Builds cart content with items list
  Widget _buildCartContent(
      BuildContext context, Cart cart, double padding, bool isDesktop) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Shopping Cart',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontFamily: 'WorkSans',
              ),
            ),
            const SizedBox(height: 24),
            // Map through cart items
            ...cart.items.map((item) => Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: _buildCartItemCard(context, item, isDesktop),
                )),
          ],
        ),
      ),
    );
  }

  /// Builds a single cart item card - placeholder for next subtask
  Widget _buildCartItemCard(BuildContext context, item, bool isDesktop) {
    return Card(
      elevation: 2.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          '${item.title} - Size: ${item.size} - Qty: ${item.quantity}',
          style: const TextStyle(fontFamily: 'WorkSans'),
        ),
      ),
    );
  }
}
