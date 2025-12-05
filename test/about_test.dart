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
      // Menu icon only visible on mobile (width < 800)
      // This test doesn't set screen size, so it defaults to desktop
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

      // Tap the menu icon to open modal navbar
      await tester.tap(find.byIcon(Icons.menu));
      await tester.pumpAndSettle();

      // Check that modal navbar is open with navigation items
      expect(find.text('Home'), findsAtLeast(1)); // In navbar
      expect(find.text('Shop'), findsAtLeast(1)); // In navbar
      expect(find.text('The Print Shack'), findsAtLeast(1)); // In navbar
      expect(find.text('SALE!'), findsAtLeast(1)); // In navbar
      expect(find.text('About'), findsAtLeast(1)); // In navbar
      expect(find.text('UPSU.net'), findsAtLeast(1)); // In navbar

      // Reset for other tests
      addTearDown(() => tester.view.reset());
    });

    testWidgets('should navigate to home page from drawer on mobile',
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

      // Verify we're on the about page
      expect(find.text('About us'), findsOneWidget);
      expect(find.textContaining('Welcome to the Union Shop'), findsOneWidget);

      // Open the drawer
      await tester.tap(find.byIcon(Icons.menu));
      await tester.pumpAndSettle();

      // Tap "Home" in the drawer
      final homeButton = find.text('Home').last;
      await tester.tap(homeButton);
      await tester.pumpAndSettle();

      // Verify we navigated back to home page
      expect(find.text('About us'), findsNothing);
      // Check for home page specific content
      expect(find.text('PRODUCTS SECTION'), findsOneWidget);
    });

    testWidgets('should display all content sections and be scrollable',
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

      // Verify the page uses SingleChildScrollView (scrollable)
      expect(find.byType(SingleChildScrollView), findsOneWidget);

      // Verify header section is visible
      expect(
        find.text(
            'BIG SALE! OUR ESSENTIAL RANGE HAS DROPPED IN PRICE! OVER 20% OFF! COME GRAB YOURS WHILE STOCK LASTS!'),
        findsOneWidget,
      );

      // Verify main content is visible
      expect(find.text('About us'), findsOneWidget);
      expect(find.textContaining('Welcome to the Union Shop'), findsOneWidget);
      expect(find.textContaining('hello@upsu.net'), findsOneWidget);

      // Scroll to ensure footer is accessible
      await tester.drag(
          find.byType(SingleChildScrollView), const Offset(0, -200));
      await tester.pumpAndSettle();

      // Verify footer section is now visible
      expect(find.text('Powered by Flutter'), findsOneWidget);
      expect(find.text('Opening Hours'), findsOneWidget);
    });

    testWidgets('should display about page with correct text styling',
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

      // Find the "About us" heading text widget
      final aboutUsText = tester.widget<Text>(find.text('About us'));

      // Verify heading styling
      expect(aboutUsText.style?.fontSize, 50);
      expect(aboutUsText.style?.fontWeight, FontWeight.bold);
      expect(aboutUsText.style?.color, Colors.black);
      expect(aboutUsText.style?.fontFamily, 'WorkSans');

      // Find the main content text widget
      final contentText = tester
          .widget<Text>(find.textContaining('Welcome to the Union Shop!'));

      // Verify content text styling
      expect(contentText.style?.fontSize, 18);
      expect(contentText.style?.height, 1.6);
      expect(contentText.style?.color, Colors.black87);
      expect(contentText.style?.fontFamily, 'WorkSans');

      // Verify the content container has white background and padding
      final container = tester.widget<Container>(find
          .ancestor(
            of: find.text('About us'),
            matching: find.byType(Container),
          )
          .first);

      expect(container.color, Colors.white);
      expect(container.padding, const EdgeInsets.all(40.0));
    });
  });
}
