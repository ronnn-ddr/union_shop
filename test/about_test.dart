import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/main.dart';

void main() {
  group('About Page Tests', () {
    testWidgets('should navigate to about page', (tester) async {
      tester.view.physicalSize = const Size(1200, 800); // Set desktop size
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(const UnionShopApp());
      await tester.pump();

      // Navigate to about page
      await tester.tap(find.text('About'));
      await tester.pumpAndSettle();

      // Check that we're on the about page by verifying about-specific content
      expect(find.text('About us'), findsOneWidget);
      expect(find.textContaining('Welcome to the Union Shop'), findsOneWidget);
    });

    testWidgets('should display about page with basic elements',
        (tester) async {
      tester.view.physicalSize = const Size(1200, 800); // Set desktop size
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(const UnionShopApp());
      await tester.pump();

      // Navigate to about page
      await tester.tap(find.text('About'));
      await tester.pumpAndSettle();

      // Check that basic UI elements are present
      expect(
        find.text(
            'BIG SALE! OUR ESSENTIAL RANGE HAS DROPPED IN PRICE! OVER 20% OFF! COME GRAB YOURS WHILE STOCK LASTS!'),
        findsOneWidget,
      );
      expect(find.text('About us'), findsOneWidget);
      expect(find.textContaining('Welcome to the Union Shop'), findsOneWidget);
      expect(find.text('Powered by Flutter'), findsOneWidget);
    });

    testWidgets('should display about page content', (tester) async {
      tester.view.physicalSize = const Size(1200, 800); // Set desktop size
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(const UnionShopApp());
      await tester.pump();

      // Navigate to about page
      await tester.tap(find.text('About'));
      await tester.pumpAndSettle();

      // Check that about page content is displayed
      expect(find.text('About us'), findsOneWidget);
      expect(
          find.textContaining('University branded products'), findsOneWidget);
      expect(find.textContaining('personalisation service'), findsOneWidget);
      expect(find.textContaining('hello@upsu.net'), findsOneWidget);
      expect(find.textContaining('The Union Shop & Reception Team'),
          findsOneWidget);
    });

    testWidgets('should display header icons on about page', (tester) async {
      tester.view.physicalSize = const Size(1200, 800); // Set desktop size
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(const UnionShopApp());
      await tester.pump();

      // Navigate to about page
      await tester.tap(find.text('About'));
      await tester.pumpAndSettle();

      // Check that header icons are present
      expect(find.byIcon(Icons.search), findsOneWidget);
      expect(find.byIcon(Icons.shopping_bag_outlined), findsOneWidget);
      expect(find.byIcon(Icons.menu), findsOneWidget);
    });

    testWidgets('should display navigation bar with buttons on about page',
        (tester) async {
      tester.view.physicalSize = const Size(1200, 800); // Set desktop size
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(const UnionShopApp());
      await tester.pump();

      // Navigate to about page
      await tester.tap(find.text('About'));
      await tester.pumpAndSettle();

      // Check that navigation buttons are present in the header bar
      expect(find.text('Home'), findsAtLeast(1));
      expect(find.text('Shop'), findsAtLeast(1));
      expect(find.text('The Print Shack'), findsAtLeast(1));
      expect(find.text('SALE!'), findsAtLeast(1));
      expect(find.text('About'), findsAtLeast(1));
      expect(find.text('UPSU.net'), findsAtLeast(1));
    });

    testWidgets('should display footer on about page', (tester) async {
      tester.view.physicalSize = const Size(1200, 800); // Set desktop size
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(const UnionShopApp());
      await tester.pump();

      // Navigate to about page
      await tester.tap(find.text('About'));
      await tester.pumpAndSettle();

      // Check that footer is present
      expect(find.text('Powered by Flutter'), findsOneWidget);
    });

    testWidgets('should hide navigation buttons on mobile about page',
        (tester) async {
      tester.view.physicalSize = const Size(600, 800); // Set mobile size
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(const UnionShopApp());
      await tester.pump();

      // Navigate to about page
      await tester.tap(find.byIcon(Icons.menu));
      await tester.pumpAndSettle();
      await tester.tap(find.text('About'));
      await tester.pumpAndSettle();

      // Check that navigation buttons are hidden on mobile
      expect(find.text('Home'), findsNothing);
      expect(find.text('Shop'), findsNothing);
      expect(find.text('The Print Shack'),
          findsNothing); // Not in header on mobile
      expect(find.text('SALE!'), findsNothing);
      expect(find.text('About'), findsNothing);
      expect(find.text('UPSU.net'), findsNothing);
    });

    testWidgets('should show drawer navigation on mobile about page',
        (tester) async {
      tester.view.physicalSize = const Size(600, 800); // Set mobile size
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(const UnionShopApp());
      await tester.pump();

      // Navigate to about page via drawer
      await tester.tap(find.byIcon(Icons.menu));
      await tester.pumpAndSettle();
      await tester.tap(find.text('About'));
      await tester.pumpAndSettle();

      // Check that menu icon is present
      expect(find.byIcon(Icons.menu), findsOneWidget);

      // Tap the menu icon to open drawer
      await tester.tap(find.byIcon(Icons.menu));
      await tester.pumpAndSettle();

      // Check that drawer is open with navigation items
      expect(find.text('Union Shop'), findsOneWidget); // Drawer header
      expect(find.text('Home'), findsAtLeast(1)); // In drawer
      expect(find.text('Shop'), findsAtLeast(1)); // In drawer
      expect(find.text('The Print Shack'), findsAtLeast(1)); // In drawer
      expect(find.text('SALE!'), findsAtLeast(1)); // In drawer
      expect(find.text('About'), findsAtLeast(1)); // In drawer
      expect(find.text('UPSU.net'), findsAtLeast(1)); // In drawer
    });
  });
}
