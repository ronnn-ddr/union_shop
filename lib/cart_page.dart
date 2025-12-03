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
            const SizedBox(height: 32),
            // Cart summary
            _buildCartSummary(context, cart),
          ],
        ),
      ),
    );
  }

  /// Builds cart summary section with total and checkout button
  Widget _buildCartSummary(BuildContext context, Cart cart) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${cart.itemCount} ${cart.itemCount == 1 ? 'item' : 'items'}',
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontFamily: 'WorkSans',
                ),
              ),
              Text(
                'Subtotal: £${cart.totalAmount.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontFamily: 'WorkSans',
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: cart.itemCount > 0
                ? () {
                    _handleCheckout(context, cart);
                  }
                : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF4d2963),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
              disabledBackgroundColor: Colors.grey[400],
            ),
            child: const Text(
              'Checkout',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'WorkSans',
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Handles checkout process
  void _handleCheckout(BuildContext context, Cart cart) {
    cart.clear();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Order placed successfully!',
          style: TextStyle(fontFamily: 'WorkSans'),
        ),
        duration: Duration(seconds: 3),
        backgroundColor: Colors.green,
      ),
    );
  }

  /// Builds a single cart item card
  Widget _buildCartItemCard(BuildContext context, item, bool isDesktop) {
    // Parse price to calculate subtotal
    final priceValue =
        double.tryParse(item.price.replaceAll('£', '').trim()) ?? 0.0;
    final subtotal = priceValue * item.quantity;

    return Card(
      elevation: 2.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: isDesktop
            ? _buildDesktopLayout(item, priceValue, subtotal, context)
            : _buildMobileLayout(item, priceValue, subtotal, context),
      ),
    );
  }

  /// Builds desktop layout (horizontal Row)
  Widget _buildDesktopLayout(
      item, double priceValue, double subtotal, BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Product image
        _buildProductImage(item.imageUrl),
        const SizedBox(width: 24),
        // Product details
        Expanded(
          child: _buildProductDetails(item, priceValue, subtotal),
        ),
        const SizedBox(width: 24),
        // Quantity controls and remove button
        Column(
          children: [
            _buildQuantityControls(context, item),
            const SizedBox(height: 8),
            _buildRemoveButton(context, item),
          ],
        ),
      ],
    );
  }

  /// Builds mobile layout (vertical Column)
  Widget _buildMobileLayout(
      item, double priceValue, double subtotal, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProductImage(item.imageUrl),
            const SizedBox(width: 16),
            Expanded(
              child: _buildProductDetails(item, priceValue, subtotal),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildQuantityControls(context, item),
            _buildRemoveButton(context, item),
          ],
        ),
      ],
    );
  }

  /// Builds product details (title, size, prices)
  Widget _buildProductDetails(item, double priceValue, double subtotal) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          item.title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontFamily: 'WorkSans',
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'Size: ${item.size}',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
            fontFamily: 'WorkSans',
          ),
        ),
        const SizedBox(height: 8),
        Text(
          '£${priceValue.toStringAsFixed(2)} each',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
            fontFamily: 'WorkSans',
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'Subtotal: £${subtotal.toStringAsFixed(2)}',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontFamily: 'WorkSans',
          ),
        ),
      ],
    );
  }

  /// Builds quantity controls (- and + buttons with quantity display)
  Widget _buildQuantityControls(BuildContext context, item) {
    final cart = context.read<Cart>();

    return Row(
      children: [
        IconButton(
          onPressed: item.quantity > 1
              ? () {
                  cart.updateQuantity(item.id, item.size, item.quantity - 1);
                }
              : null,
          icon: const Icon(Icons.remove_circle_outline),
          color: const Color(0xFF4d2963),
          tooltip: 'Decrease quantity',
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            '${item.quantity}',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: 'WorkSans',
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            cart.updateQuantity(item.id, item.size, item.quantity + 1);
          },
          icon: const Icon(Icons.add_circle_outline),
          color: const Color(0xFF4d2963),
          tooltip: 'Increase quantity',
        ),
      ],
    );
  }

  /// Builds remove button
  Widget _buildRemoveButton(BuildContext context, item) {
    return IconButton(
      onPressed: () {
        _showRemoveItemDialog(context, item);
      },
      icon: const Icon(Icons.delete_outline),
      color: Colors.red[700],
      tooltip: 'Remove item',
    );
  }

  /// Shows confirmation dialog before removing item
  void _showRemoveItemDialog(BuildContext context, item) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text(
            'Remove item from cart?',
            style: TextStyle(fontFamily: 'WorkSans'),
          ),
          content: Text(
            'Are you sure you want to remove ${item.title} (Size: ${item.size}) from your cart?',
            style: const TextStyle(fontFamily: 'WorkSans'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
              child: const Text(
                'Cancel',
                style: TextStyle(fontFamily: 'WorkSans'),
              ),
            ),
            TextButton(
              onPressed: () {
                final cart = context.read<Cart>();
                cart.removeItem(item.id, item.size);
                Navigator.of(dialogContext).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Item removed from cart',
                      style: TextStyle(fontFamily: 'WorkSans'),
                    ),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              child: Text(
                'Remove',
                style: TextStyle(
                  color: Colors.red[700],
                  fontFamily: 'WorkSans',
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  /// Builds product image with error handling
  Widget _buildProductImage(String imageUrl) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.asset(
        imageUrl,
        width: 100,
        height: 100,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            width: 100,
            height: 100,
            color: Colors.grey[300],
            child: const Icon(
              Icons.image_not_supported,
              color: Colors.grey,
              size: 40,
            ),
          );
        },
      ),
    );
  }
}
