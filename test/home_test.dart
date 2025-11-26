import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/main.dart';

void main() {
  group('Home Page Tests', () {
    testWidgets('should display home page with basic elements', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pump();

      // Check that basic UI elements are present
      expect(
        find.text(
            'BIG SALE! OUR ESSENTIAL RANGE HAS DROPPED IN PRICE! OVER 20% OFF! COME GRAB YOURS WHILE STOCK LASTS!'),
        findsOneWidget,
      );
      expect(find.text('The Print Shack'), findsAtLeast(1));
      expect(find.text('PRODUCTS SECTION'), findsOneWidget);
      expect(find.text('FIND OUT MORE'), findsOneWidget);
    });

    testWidgets('should display product cards', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pump();

      // Check that product cards are displayed (from products data)
      expect(find.byType(ProductCard), findsNWidgets(4));

      // Check that prices are displayed (at least 4 price texts)
      expect(find.textContaining('£'), findsAtLeastNWidgets(4));
    });

    testWidgets('should display header icons', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pump();

      // Check that header icons are present
      expect(find.byIcon(Icons.search), findsOneWidget);
      expect(find.byIcon(Icons.shopping_bag_outlined), findsOneWidget);
      expect(find.byIcon(Icons.menu), findsOneWidget);
    });

    testWidgets('should display navigation bar with buttons', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pump();

      // Check that navigation buttons are present in the header bar
      expect(find.text('Home'), findsAtLeast(1));
      expect(find.text('Shop'), findsAtLeast(1));
      expect(find.text('The Print Shack'),
          findsAtLeast(2)); // Appears in nav and hero
      expect(find.text('SALE!'), findsAtLeast(1));
      expect(find.text('About'), findsAtLeast(1));
      expect(find.text('UPSU.net'), findsAtLeast(1));
    });

    testWidgets('should display footer', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pump();

      // Check that footer is present
      expect(find.text('Powered by Flutter'), findsOneWidget);
    });

    testWidgets('should hide navigation buttons on mobile', (tester) async {
      tester.view.physicalSize = const Size(600, 800); // Set mobile size
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(const UnionShopApp());
      await tester.pump();

      // Check that navigation buttons are hidden on mobile
      expect(find.text('Home'), findsNothing);
      expect(find.text('Shop'), findsNothing);
      expect(find.text('The Print Shack'),
          findsOneWidget); // Still appears in hero section
      expect(find.text('SALE!'), findsNothing);
      expect(find.text('About'), findsNothing);
      expect(find.text('UPSU.net'), findsNothing);
    });

    testWidgets('should show drawer navigation on mobile', (tester) async {
      tester.view.physicalSize = const Size(600, 800); // Set mobile size
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(const UnionShopApp());
      await tester.pump();

      // Check that menu icon is present
      expect(find.byIcon(Icons.menu), findsOneWidget);

      // Tap the menu icon to open drawer
      await tester.tap(find.byIcon(Icons.menu));
      await tester.pumpAndSettle();

      // Check that drawer is open with navigation items
      expect(find.text('Union Shop'), findsOneWidget); // Drawer header
      expect(find.text('Home'), findsAtLeast(1)); // In drawer
      expect(find.text('Shop'), findsAtLeast(1)); // In drawer
      expect(
          find.text('The Print Shack'), findsAtLeast(2)); // In drawer and hero
      expect(find.text('SALE!'), findsAtLeast(1)); // In drawer
      expect(find.text('About'), findsAtLeast(1)); // In drawer
      expect(find.text('UPSU.net'), findsAtLeast(1)); // In drawer
    });
  });
}
