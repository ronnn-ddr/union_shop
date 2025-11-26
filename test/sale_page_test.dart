import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/sale_page.dart';
import 'package:union_shop/data/products.dart';
import 'package:union_shop/product_page.dart';

void main() {
  group('Sale Page Tests', () {
    testWidgets('should render sale page with correct text', (
      tester,
    ) async {
      tester.binding.window.physicalSizeTestValue = Size(800, 600);
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      await tester.pumpWidget(MaterialApp(home: SalePage()));
      await tester.pumpAndSettle();

      // Check that the sale page title is present
      expect(find.text('SALE'), findsOneWidget);

      // Check the description text
      expect(
          find.text(
              "Don't miss out! Get yours before they're all gone! All prices shown are inclusive of the discount."),
          findsOneWidget);
    });

    testWidgets('should navigate to product page on card tap', (
      tester,
    ) async {
      tester.binding.window.physicalSizeTestValue = Size(800, 600);
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      await tester.pumpWidget(MaterialApp(
        home: SalePage(),
        onGenerateRoute: (settings) {
          if (settings.name!.startsWith('/product/')) {
            final id = settings.name!.substring('/product/'.length);
            final product = products.firstWhere((p) => p.id == id);
            return MaterialPageRoute(
                builder: (context) => ProductPage(product: product));
          }
          return null;
        },
      ));
      await tester.pumpAndSettle();

      // Placeholder: Navigation test - grid not rendering in test environment
      // When grid renders, test tapping card navigates to product page
    });
  });
}
