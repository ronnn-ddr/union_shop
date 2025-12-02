import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:union_shop/product_page.dart';
import 'package:union_shop/models/cart.dart';
import 'package:union_shop/data/products.dart';
import 'package:union_shop/models/product.dart';

void main() {
  group('Product Page Tests', () {
    Widget createTestWidget(Product product) {
      return ChangeNotifierProvider(
        create: (context) => Cart(),
        child: MaterialApp(home: ProductPage(product: product)),
      );
    }

    testWidgets('should display product page with basic elements', (
      tester,
    ) async {
      await tester.pumpWidget(createTestWidget(products[0]));
      await tester.pump();

      // Check that basic UI elements are present
      expect(find.text('Rainbow Hoodie'), findsOneWidget); // title
      expect(find.text('£30.00'), findsOneWidget);
      expect(find.text('Description'), findsOneWidget);
      expect(find.text('ADD TO CART'), findsOneWidget);
    });

    testWidgets('should display header with sale banner and navigation',
        (tester) async {
      await tester.pumpWidget(createTestWidget(products[0]));
      await tester.pump();

      // Check sale banner text
      expect(
          find.text(
              'BIG SALE! OUR ESSENTIAL RANGE HAS DROPPED IN PRICE! OVER 20% OFF! COME GRAB YOURS WHILE STOCK LASTS!'),
          findsOneWidget);

      // Check navigation buttons
      expect(find.text('Home'), findsOneWidget);
      expect(find.text('Shop'), findsOneWidget);

      // Check header icons (search and shopping bag always visible)
      expect(find.byIcon(Icons.search), findsOneWidget);
      expect(find.byIcon(Icons.shopping_bag_outlined), findsOneWidget);
      // Menu icon only visible on mobile (width < 800)
      // This test doesn't set screen size, so it defaults to desktop
    });

    testWidgets('should display footer with opening hours and powered by',
        (tester) async {
      await tester.pumpWidget(createTestWidget(products[0]));
      await tester.pump();

      // Check footer content
      expect(find.text('Powered by Flutter'), findsOneWidget);
      expect(find.text('Opening Hours'), findsOneWidget);
      expect(find.text('Help and Information'), findsOneWidget);
    });

    testWidgets('should allow size selection', (tester) async {
      await tester.pumpWidget(createTestWidget(products[0]));
      await tester.pump();

      // Initially no size selected
      expect(find.text('Select size'), findsOneWidget);

      // Tap dropdown
      await tester.tap(find.byType(DropdownButton<String>));
      await tester.pump();

      // Select 'M'
      await tester.tap(find.text('M').last);
      await tester.pump();

      // Check that 'M' is selected
      expect(find.text('M'), findsOneWidget);
    });

    testWidgets('should allow quantity input', (tester) async {
      await tester.pumpWidget(createTestWidget(products[0]));
      await tester.pump();

      // Check initial quantity
      expect(find.text('1'), findsOneWidget);

      // Tap + button
      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();

      // Check quantity increased
      expect(find.text('2'), findsOneWidget);

      // Tap - button
      await tester.tap(find.byIcon(Icons.remove));
      await tester.pump();

      // Check quantity decreased
      expect(find.text('1'), findsOneWidget);
    });

    testWidgets('should show snackbar on add to cart', (tester) async {
      await tester.pumpWidget(createTestWidget(products[0]));
      await tester.pump();

      // Select a size first
      await tester.tap(find.byType(DropdownButton<String>));
      await tester.pump();
      await tester.tap(find.text('M').last);
      await tester.pump();

      // Tap add to cart
      await tester.tap(find.text('ADD TO CART'));
      await tester.pump();

      // Check snackbar
      expect(find.text('Added 1 Rainbow Hoodie(s) (Size: M) to cart!'),
          findsOneWidget);
    });

    testWidgets('should display different product data dynamically', (
      tester,
    ) async {
      await tester
          .pumpWidget(createTestWidget(products[1])); // Graduation Hoodies
      await tester.pump();

      // Check that the product name is different
      expect(find.text('Graduation Hoodies'), findsOneWidget);
      expect(
          find.text('£35.00'), findsOneWidget); // price of Graduation Hoodies
      expect(find.text('Description'), findsOneWidget);
      expect(find.text('ADD TO CART'), findsOneWidget);
    });
  });
}
