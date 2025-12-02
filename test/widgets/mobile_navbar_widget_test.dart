import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/widgets/mobile_navbar_widget.dart';

void main() {
  group('MobileNavbarWidget Tests', () {
    testWidgets('should render all navigation items', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: const MobileNavbarWidget(),
          ),
        ),
      );

      // Check that all navigation items are present
      expect(find.text('Home'), findsOneWidget);
      expect(find.text('Shop'), findsOneWidget);
      expect(find.text('The Print Shack'), findsOneWidget);
      expect(find.text('SALE!'), findsOneWidget);
      expect(find.text('About'), findsOneWidget);
      expect(find.text('UPSU.net'), findsOneWidget);
    });

    testWidgets('should render all navigation icons', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: const MobileNavbarWidget(),
          ),
        ),
      );

      // Check that all icons are present
      expect(find.byIcon(Icons.home), findsOneWidget);
      expect(find.byIcon(Icons.shop), findsOneWidget);
      expect(find.byIcon(Icons.print), findsOneWidget);
      expect(find.byIcon(Icons.local_offer), findsOneWidget);
      expect(find.byIcon(Icons.info), findsOneWidget);
      expect(find.byIcon(Icons.web), findsOneWidget);
    });

    testWidgets('should have WorkSans font family for all text',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: const MobileNavbarWidget(),
          ),
        ),
      );

      // Get all Text widgets
      final textWidgets = tester.widgetList<Text>(find.byType(Text));

      // Check that each text widget uses WorkSans font
      for (final textWidget in textWidgets) {
        expect(textWidget.style?.fontFamily, 'WorkSans');
      }
    });
  });
}
