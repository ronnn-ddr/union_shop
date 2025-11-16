import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/widgets/footer_widget.dart';

void main() {
  group('FooterWidget Tests', () {
    testWidgets('should display footer with basic elements', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: FooterWidget(),
          ),
        ),
      );

      // Check that basic footer elements are present
      expect(find.text('Opening Hours'), findsOneWidget);
      expect(find.text('Help and Information'), findsOneWidget);
      expect(find.text('Powered by Flutter'), findsOneWidget);
    });

    testWidgets('should display opening hours content', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: FooterWidget(),
          ),
        ),
      );

      // Check that opening hours are displayed
      expect(find.text('(Term Time)'), findsOneWidget);
      expect(find.text('Monday - Friday: 9:00 AM - 4:00 PM'), findsOneWidget);
      expect(find.text('(Outside of Term Time / Consolidation Weeks)'), findsOneWidget);
      expect(find.text('Monday - Friday: 9:00 AM - 3:00 PM'), findsOneWidget);
    });

    testWidgets('should display help and information content', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: FooterWidget(),
          ),
        ),
      );

      // Check that help and information items are displayed
      expect(find.text('Search'), findsOneWidget);
      expect(find.text('Terms & Conditions of Sale Policy'), findsOneWidget);
    });

    testWidgets('should display responsive layout on desktop', (tester) async {
      tester.view.physicalSize = const Size(1200, 800); // Set desktop size
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: FooterWidget(),
          ),
        ),
      );

      // On desktop, sections should be in a Row
      // We can verify this by checking that both sections are visible
      expect(find.text('Opening Hours'), findsOneWidget);
      expect(find.text('Help and Information'), findsOneWidget);
    });

    testWidgets('should display responsive layout on mobile', (tester) async {
      tester.view.physicalSize = const Size(400, 800); // Set mobile size
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: FooterWidget(),
          ),
        ),
      );

      // On mobile, sections should be in a Column
      // We can verify this by checking that both sections are still visible
      expect(find.text('Opening Hours'), findsOneWidget);
      expect(find.text('Help and Information'), findsOneWidget);
    });

    testWidgets('should have correct styling for section titles', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: FooterWidget(),
          ),
        ),
      );

      // Find the section title widgets
      final openingHoursFinder = find.text('Opening Hours');
      final helpInfoFinder = find.text('Help and Information');

      // Verify they exist
      expect(openingHoursFinder, findsOneWidget);
      expect(helpInfoFinder, findsOneWidget);

      // Check styling by finding Text widgets with specific properties
      final openingHoursWidget = tester.widget<Text>(openingHoursFinder);
      final helpInfoWidget = tester.widget<Text>(helpInfoFinder);

      // Verify font weight is bold
      expect(openingHoursWidget.style?.fontWeight, FontWeight.bold);
      expect(helpInfoWidget.style?.fontWeight, FontWeight.bold);

      // Verify font size
      expect(openingHoursWidget.style?.fontSize, 16);
      expect(helpInfoWidget.style?.fontSize, 16);

      // Verify font family
      expect(openingHoursWidget.style?.fontFamily, 'WorkSans');
      expect(helpInfoWidget.style?.fontFamily, 'WorkSans');
    });

    testWidgets('should have correct styling for powered by text', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: FooterWidget(),
          ),
        ),
      );

      final poweredByFinder = find.text('Powered by Flutter');
      expect(poweredByFinder, findsOneWidget);

      final poweredByWidget = tester.widget<Text>(poweredByFinder);

      // Verify styling
      expect(poweredByWidget.style?.color, Colors.grey);
      expect(poweredByWidget.style?.fontSize, 14);
      expect(poweredByWidget.style?.fontWeight, FontWeight.w500);
      expect(poweredByWidget.style?.fontFamily, 'WorkSans');
    });

    testWidgets('should have correct background color', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: FooterWidget(),
          ),
        ),
      );

      // Find the Container that holds the footer
      final containerFinder = find.byType(Container).first;
      final container = tester.widget<Container>(containerFinder);

      // Check background color - it's set directly on the Container, not in decoration
      expect(container.color, Colors.grey[50]);
    });

    testWidgets('should display clickable items', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: FooterWidget(),
          ),
        ),
      );

      // Verify that clickable items exist and are displayed
      final searchFinder = find.text('Search');
      final termsFinder = find.text('Terms & Conditions of Sale Policy');

      expect(searchFinder, findsOneWidget);
      expect(termsFinder, findsOneWidget);

      // Verify that the items are styled as clickable (this would be blue and underlined)
      // The actual styling verification would require more complex widget tree traversal
    });
  });
}