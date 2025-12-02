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

    group('Responsive Layout Tests', () {
      testWidgets('should adapt layout at 800px breakpoint (mobile vs desktop)',
          (
        tester,
      ) async {
        // Test mobile layout (width < 800)
        tester.view.physicalSize = const Size(700, 2000);
        tester.view.devicePixelRatio = 1.0;

        await tester.pumpWidget(createTestWidget(products[0]));
        await tester.pump();

        // On mobile, menu icon should be visible
        expect(find.byIcon(Icons.menu), findsOneWidget);
        expect(find.text('Rainbow Hoodie'), findsOneWidget);
        expect(find.text('ADD TO CART'), findsOneWidget);

        // Test desktop layout (width >= 800)
        tester.view.physicalSize = const Size(1200, 2000);
        await tester.pumpWidget(createTestWidget(products[0]));
        await tester.pump();

        // On desktop, navigation buttons should be visible
        expect(find.text('Home'), findsOneWidget);
        expect(find.text('Shop'), findsOneWidget);
        expect(find.text('Rainbow Hoodie'), findsOneWidget);

        // Test at exactly 800px (should be desktop)
        tester.view.physicalSize = const Size(800, 2000);
        await tester.pumpWidget(createTestWidget(products[0]));
        await tester.pump();

        expect(find.text('Rainbow Hoodie'), findsOneWidget);
        expect(find.text('ADD TO CART'), findsOneWidget);

        // Reset for other tests
        addTearDown(() => tester.view.reset());
      });

      testWidgets(
          'should display product content correctly on different screen sizes',
          (tester) async {
        // Test on wide screens (>= 600px for row layout)
        tester.view.physicalSize = const Size(1200, 2000);
        tester.view.devicePixelRatio = 1.0;

        await tester.pumpWidget(createTestWidget(products[0]));
        await tester.pump();

        expect(find.text('Rainbow Hoodie'), findsOneWidget);
        expect(find.text('Description'), findsOneWidget);
        expect(find.text('£30.00'), findsOneWidget);
        expect(find.text('Size'), findsOneWidget);
        expect(find.text('Quantity'), findsOneWidget);

        // Test on narrow screens (< 600px for column layout)
        tester.view.physicalSize = const Size(500, 2000);
        await tester.pumpWidget(createTestWidget(products[0]));
        await tester.pump();

        expect(find.text('Rainbow Hoodie'), findsOneWidget);
        expect(find.text('Description'), findsOneWidget);
        expect(find.text('£30.00'), findsOneWidget);
        expect(find.text('Size'), findsOneWidget);
        expect(find.text('Quantity'), findsOneWidget);

        // Reset for other tests
        addTearDown(() => tester.view.reset());
      });
    });

    group('Sale Price Display Tests', () {
      testWidgets('should display sale price when product has salePrice', (
        tester,
      ) async {
        // Find a product with salePrice (Rainbow Hoodie has salePrice: 25.0)
        final productWithSale = products.firstWhere((p) => p.salePrice != null);

        await tester.pumpWidget(createTestWidget(productWithSale));
        await tester.pump();

        // Check sale price is displayed
        expect(find.text('£${productWithSale.salePrice!.toStringAsFixed(2)}'),
            findsOneWidget);

        // Check original price is displayed with strikethrough
        expect(find.text('£${productWithSale.price.toStringAsFixed(2)}'),
            findsOneWidget);
      });

      testWidgets('should display regular price when product has no salePrice',
          (tester) async {
        // Find a product without salePrice (Graduation Hoodies has no salePrice)
        final productWithoutSale =
            products.firstWhere((p) => p.salePrice == null);

        await tester.pumpWidget(createTestWidget(productWithoutSale));
        await tester.pump();

        // Check regular price is displayed
        expect(find.text('£${productWithoutSale.price.toStringAsFixed(2)}'),
            findsOneWidget);

        // Verify there's only one price (no crossed-out original price)
        final priceText =
            find.text('£${productWithoutSale.price.toStringAsFixed(2)}');
        expect(priceText, findsOneWidget);
      });

      testWidgets('should show both prices when salePrice exists', (
        tester,
      ) async {
        // Use Rainbow Hoodie which has salePrice: 25.0, price: 30.0
        final rainbowHoodie = products[0];

        await tester.pumpWidget(createTestWidget(rainbowHoodie));
        await tester.pump();

        // Check both prices are present
        expect(find.text('£25.00'), findsOneWidget); // sale price
        expect(find.text('£30.00'), findsOneWidget); // original price
      });
    });

    group('Size Selection Tests', () {
      testWidgets('should display size dropdown with all available sizes', (
        tester,
      ) async {
        // Rainbow Hoodie has sizes: ['S', 'M', 'L', 'XL']
        final productWithSizes = products[0];

        await tester.pumpWidget(createTestWidget(productWithSizes));
        await tester.pump();

        // Find the size dropdown by type
        final dropdown = find.byType(DropdownButton<String>);
        expect(dropdown, findsOneWidget);

        // Verify hint text is displayed
        expect(find.text('Select size'), findsOneWidget);

        // Tap the dropdown to open it
        await tester.tap(dropdown);
        await tester.pumpAndSettle();

        // Verify all size options are displayed in dropdown menu
        for (final size in productWithSizes.sizes) {
          expect(find.text(size).last, findsOneWidget);
        }
      });

      testWidgets('should update selected size when user selects from dropdown',
          (tester) async {
        await tester.pumpWidget(createTestWidget(products[0]));
        await tester.pump();

        // Initial state shows "Select size"
        expect(find.text('Select size'), findsOneWidget);

        // Open dropdown and select a size
        final dropdown = find.byType(DropdownButton<String>);
        await tester.tap(dropdown);
        await tester.pumpAndSettle();
        await tester.tap(find.text('M').last);
        await tester.pumpAndSettle();

        // Verify the selected size is now displayed
        expect(find.text('M'), findsOneWidget);
        expect(find.text('Select size'), findsNothing);
      });

      testWidgets('should persist size selection when changing other fields',
          (tester) async {
        await tester.pumpWidget(createTestWidget(products[0]));
        await tester.pump();

        // Select a size
        final dropdown = find.byType(DropdownButton<String>);
        await tester.tap(dropdown);
        await tester.pumpAndSettle();
        await tester.tap(find.text('L').last);
        await tester.pumpAndSettle();

        // Verify size is selected
        expect(find.text('L'), findsOneWidget);

        // Change quantity (tap increment button)
        await tester.tap(find.byIcon(Icons.add));
        await tester.pump();

        // Verify size selection persists
        expect(find.text('L'), findsOneWidget);
      });
    });

    group('Quantity Controls Tests', () {
      testWidgets(
          'should increment/decrement quantity with buttons and enforce bounds (1-99)',
          (tester) async {
        await tester.pumpWidget(createTestWidget(products[0]));
        await tester.pump();

        // Initial quantity is 1
        expect(find.text('1'), findsWidgets);

        // Try to decrement below 1 - should stay at 1
        await tester.tap(find.byIcon(Icons.remove));
        await tester.pump();
        expect(find.text('1'), findsWidgets);

        // Increment to 2
        await tester.tap(find.byIcon(Icons.add));
        await tester.pump();
        expect(find.text('2'), findsOneWidget);

        // Decrement back to 1
        await tester.tap(find.byIcon(Icons.remove));
        await tester.pump();
        expect(find.text('1'), findsWidgets);

        // Test upper bound: set to 99 and try to increment
        final textField = find.byType(TextField);
        await tester.enterText(textField, '99');
        await tester.pump();
        expect(find.text('99'), findsOneWidget);

        // Try to increment above 99 - should stay at 99
        await tester.tap(find.byIcon(Icons.add));
        await tester.pump();
        expect(find.text('99'), findsOneWidget);
      });

      testWidgets('should handle manual quantity entry and validate input', (
        tester,
      ) async {
        await tester.pumpWidget(createTestWidget(products[0]));
        await tester.pump();

        final textField = find.byType(TextField);

        // Enter valid quantity
        await tester.enterText(textField, '5');
        await tester.pump();
        expect(find.text('5'), findsOneWidget);

        // Enter another valid quantity
        await tester.enterText(textField, '10');
        await tester.pump();
        expect(find.text('10'), findsOneWidget);

        // Enter invalid quantity (0) - validation rejects it
        await tester.enterText(textField, '0');
        await tester.pump();
        // The field reverts to the last valid value (10)
        expect(find.text('10'), findsOneWidget);
      });
    });
  });
}
