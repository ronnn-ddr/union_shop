import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:union_shop/cart_page.dart';
import 'package:union_shop/models/cart.dart';

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
}
