import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:union_shop/cart_page.dart';
import 'package:union_shop/models/cart.dart';
import 'package:union_shop/models/product.dart';

void main() {
  group('CartPage Empty State Tests', () {
    testWidgets(
        'displays empty cart icon, message, and Continue Shopping button',
        (WidgetTester tester) async {
      // Create empty cart
      final cart = Cart();

      // Build the CartPage with Provider
      await tester.pumpWidget(
        MaterialApp(
          home: ChangeNotifierProvider.value(
            value: cart,
            child: const CartPage(),
          ),
        ),
      );

      // Verify empty cart icon is displayed
      expect(find.byIcon(Icons.shopping_cart_outlined), findsOneWidget);

      // Verify "Your cart is empty" message is displayed
      expect(find.text('Your cart is empty'), findsOneWidget);

      // Verify subtitle message is displayed
      expect(find.text('Add some items to get started!'), findsOneWidget);

      // Verify Continue Shopping button is displayed
      expect(find.text('Continue Shopping'), findsOneWidget);
      expect(
        find.widgetWithText(ElevatedButton, 'Continue Shopping'),
        findsOneWidget,
      );
    });

    testWidgets('Continue Shopping button navigates to home page',
        (WidgetTester tester) async {
      // Create empty cart
      final cart = Cart();

      // Build the app with routes
      await tester.pumpWidget(
        ChangeNotifierProvider.value(
          value: cart,
          child: MaterialApp(
            initialRoute: '/cart',
            routes: {
              '/': (context) => const Scaffold(
                    body: Center(child: Text('Home Page')),
                  ),
              '/cart': (context) => const CartPage(),
            },
          ),
        ),
      );

      // Verify we're on the cart page
      expect(find.text('Your cart is empty'), findsOneWidget);

      // Tap the Continue Shopping button
      final button = find.widgetWithText(ElevatedButton, 'Continue Shopping');
      await tester.ensureVisible(button);
      await tester.pumpAndSettle();
      await tester.tap(button);
      await tester.pumpAndSettle();

      // Verify navigation to home page
      expect(find.text('Home Page'), findsOneWidget);
      expect(find.text('Your cart is empty'), findsNothing);
    });
  });

  group('CartPage with Items Tests', () {
    testWidgets('displays cart items with all fields', (tester) async {
      // Create cart with items
      final cart = Cart();
      cart.addItem(
        id: 'p1',
        title: 'Test Shirt',
        price: '£29.99',
        imageUrl: 'https://example.com/shirt.jpg',
        size: 'M',
        quantity: 1,
      );
      cart.addItem(
        id: 'p2',
        title: 'Test Pants',
        price: '£49.99',
        imageUrl: 'https://example.com/pants.jpg',
        size: 'L',
        quantity: 1,
      );

      // Build the CartPage
      await tester.pumpWidget(
        ChangeNotifierProvider.value(
          value: cart,
          child: const MaterialApp(
            home: CartPage(),
          ),
        ),
      );

      // Verify title
      expect(find.text('Shopping Cart'), findsOneWidget);

      // Verify first item details
      expect(find.text('Test Shirt'), findsOneWidget);
      expect(find.text('Size: M'), findsOneWidget);
      expect(find.text('£29.99 each'), findsOneWidget);
      expect(find.text('Subtotal: £29.99'), findsOneWidget);

      // Verify second item details
      expect(find.text('Test Pants'), findsOneWidget);
      expect(find.text('Size: L'), findsOneWidget);
      expect(find.text('£49.99 each'), findsOneWidget);
      expect(find.text('Subtotal: £49.99'), findsOneWidget);

      // Verify item count
      expect(find.text('2 items'), findsOneWidget);

      // Verify total (displayed as "Subtotal" in summary section)
      expect(find.text('Subtotal: £79.98'), findsAtLeastNWidgets(1));

      // Verify checkout button
      expect(find.widgetWithText(ElevatedButton, 'Checkout'), findsOneWidget);
    });
  });

  group('CartPage Quantity Controls Tests', () {
    testWidgets('quantity controls increase and decrease work correctly', (tester) async {
      // Create cart with one item
      final cart = Cart();
      cart.addItem(
        id: 'p1',
        title: 'Test Product',
        price: '£25.00',
        imageUrl: 'https://example.com/product.jpg',
        size: 'M',
        quantity: 1,
      );

      // Build the CartPage with routes
      await tester.pumpWidget(
        ChangeNotifierProvider.value(
          value: cart,
          child: MaterialApp(
            home: const CartPage(),
            routes: {
              '/cart': (context) => const CartPage(),
            },
          ),
        ),
      );

      // Verify initial quantity is 1 and subtotal
      expect(find.text('1'), findsWidgets);
      expect(find.textContaining('Subtotal: £25.00'), findsWidgets);

      // Find the + button (add_circle_outline icon)
      final addButton = find.byIcon(Icons.add_circle_outline);
      expect(addButton, findsOneWidget);
      
      // Tap the + button to increase quantity
      await tester.tap(addButton);
      await tester.pumpAndSettle();

      // Verify quantity increased to 2
      expect(find.text('2'), findsWidgets);
      expect(find.textContaining('Subtotal: £50.00'), findsWidgets);

      // Find and tap the - button (remove_circle_outline icon)
      final decreaseButton = find.byIcon(Icons.remove_circle_outline);
      await tester.tap(decreaseButton);
      await tester.pumpAndSettle();

      // Verify quantity decreased back to 1
      expect(find.text('1'), findsWidgets);
      expect(find.textContaining('Subtotal: £25.00'), findsWidgets);

      // Verify - button is disabled at quantity 1
      final iconButtonFinder = find.ancestor(
        of: decreaseButton,
        matching: find.byType(IconButton),
      );
      final IconButton minusButton = tester.widget<IconButton>(iconButtonFinder);
      expect(minusButton.onPressed, isNull);
    });
  });
}
