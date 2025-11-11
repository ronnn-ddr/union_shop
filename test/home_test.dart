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

      // Check that product cards are displayed
      expect(find.text('Classic Rainbow Hoodies'), findsOneWidget);
      expect(find.text('Graduation Hoodies'), findsOneWidget);
      expect(find.text('Classic Cap'), findsOneWidget);
      expect(find.text('Heavyweight Shorts'), findsOneWidget);

      // Check prices are displayed
      expect(find.text('£30.00'), findsOneWidget);
      expect(find.text('£35.00'), findsOneWidget);
      expect(find.text('£12.00'), findsOneWidget);
      expect(find.text('£20.00'), findsOneWidget);
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
  });
}
