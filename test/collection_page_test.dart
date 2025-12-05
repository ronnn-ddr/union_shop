import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/collection_page.dart';
import 'package:union_shop/widgets/header_widget.dart';
import 'package:union_shop/widgets/footer_widget.dart';
import 'package:union_shop/data/products.dart';
import 'package:union_shop/models/product.dart';
import 'package:union_shop/product_page.dart';

void main() {
  group('CollectionPage Rendering Tests', () {
    testWidgets('displays HeaderWidget, FooterWidget, and product grid',
        (WidgetTester tester) async {
      // Set screen size for consistent testing
      tester.view.physicalSize = const Size(1080, 1920);
      tester.view.devicePixelRatio = 1.0;

      // Build the CollectionPage with MaterialApp wrapper
      await tester.pumpWidget(
        const MaterialApp(
          home: CollectionPage(collectionId: 'clothing'),
        ),
      );

      // Verify HeaderWidget is present
      expect(find.byType(HeaderWidget), findsOneWidget);

      // Verify FooterWidget is present
      expect(find.byType(FooterWidget), findsOneWidget);

      // Verify GridView is present for displaying products
      expect(find.byType(GridView), findsOneWidget);
    });
  });

  group('CollectionPage Product Display Tests', () {
    testWidgets('displays products from clothing collection with names and prices',
        (WidgetTester tester) async {
      // Set screen size for consistent testing
      tester.view.physicalSize = const Size(1080, 1920);
      tester.view.devicePixelRatio = 1.0;

      // Build the CollectionPage with clothing collection
      await tester.pumpWidget(
        const MaterialApp(
          home: CollectionPage(collectionId: 'clothing'),
        ),
      );

      // Wait for widget to settle
      await tester.pumpAndSettle();

      // Check if GridView exists
      expect(find.byType(GridView), findsOneWidget);

      // Products are sorted by name A-Z and paginated (4 per page)
      // First page should show: Classic Sweatshirt, Graduation Hoodies, Graduation Zipped Sweatshirt, Heavyweight Shorts
      
      // Classic Sweatshirt - price 28.0, salePrice 12.99
      expect(find.text('Classic Sweatshirt'), findsOneWidget);
      expect(find.text('£12.99'), findsOneWidget);

      // Graduation Hoodies - price 35.0 (no sale)
      expect(find.text('Graduation Hoodies'), findsOneWidget);
      expect(find.text('£35.00'), findsOneWidget);

      // Heavyweight Shorts - price 20.0 (no sale)
      expect(find.text('Heavyweight Shorts'), findsOneWidget);
      expect(find.text('£20.00'), findsOneWidget);

      // Verify images are displayed (check for Image widgets)
      expect(find.byType(Image), findsWidgets);

      // Verify non-clothing products are NOT displayed on this page
      expect(find.text('Classic Cap'), findsNothing); // accessories
      expect(find.text('Sticker Pack'), findsNothing); // accessories
    });
  });

  group('CollectionPage Navigation Tests', () {
    // Navigation tests will go here
  });

  group('CollectionPage Mobile Features Tests', () {
    // Mobile drawer tests will go here
  });

  group('CollectionPage Edge Cases Tests', () {
    // Empty collection tests will go here
  });
}
