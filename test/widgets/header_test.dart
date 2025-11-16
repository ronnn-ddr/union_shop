import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/widgets/header_widget.dart';

void main() {
  group('HeaderWidget Tests', () {
    testWidgets('should display header with basic elements', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: HeaderWidget(),
          ),
        ),
      );

      // Check that basic header elements are present
      expect(
        find.text(
            'BIG SALE! OUR ESSENTIAL RANGE HAS DROPPED IN PRICE! OVER 20% OFF! COME GRAB YOURS WHILE STOCK LASTS!'),
        findsOneWidget,
      );
      expect(find.byType(Image), findsOneWidget);
    });

    testWidgets('should display navigation buttons on desktop', (tester) async {
      tester.view.physicalSize = const Size(1200, 800); // Set desktop size
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: HeaderWidget(),
          ),
        ),
      );

      // Check that navigation buttons are present on desktop
      expect(find.text('Home'), findsOneWidget);
      expect(find.text('Shop'), findsOneWidget);
      expect(find.text('The Print Shack'), findsOneWidget);
      expect(find.text('SALE!'), findsOneWidget);
      expect(find.text('About'), findsOneWidget);
      expect(find.text('UPSU.net'), findsOneWidget);
    });

    testWidgets('should hide navigation buttons on mobile', (tester) async {
      tester.view.physicalSize = const Size(600, 800); // Set mobile size
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: HeaderWidget(),
          ),
        ),
      );

      // Check that navigation buttons are hidden on mobile
      expect(find.text('Home'), findsNothing);
      expect(find.text('Shop'), findsNothing);
      expect(find.text('The Print Shack'), findsNothing);
      expect(find.text('SALE!'), findsNothing);
      expect(find.text('About'), findsNothing);
      expect(find.text('UPSU.net'), findsNothing);
    });

    testWidgets('should display header icons', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: HeaderWidget(),
          ),
        ),
      );

      // Check that header icons are present
      expect(find.byIcon(Icons.search), findsOneWidget);
      expect(find.byIcon(Icons.person_outline), findsOneWidget);
      expect(find.byIcon(Icons.shopping_bag_outlined), findsOneWidget);
      expect(find.byIcon(Icons.menu), findsOneWidget);
    });
  });
}
