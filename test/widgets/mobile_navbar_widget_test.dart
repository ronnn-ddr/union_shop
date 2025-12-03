import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/widgets/mobile_navbar_widget.dart';

void main() {
  group('MobileNavbarWidget Tests', () {
    testWidgets('should render all navigation items', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: MobileNavbarWidget(),
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
        const MaterialApp(
          home: Scaffold(
            body: MobileNavbarWidget(),
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
        const MaterialApp(
          home: Scaffold(
            body: MobileNavbarWidget(),
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

    testWidgets('should show placeholder for unimplemented routes',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () => showModalBottomSheet(
                  context: context,
                  builder: (context) => const MobileNavbarWidget(),
                ),
                child: const Text('Open'),
              ),
            ),
          ),
        ),
      );

      // Test The Print Shack placeholder
      await tester.tap(find.text('Open'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('The Print Shack'));
      await tester.pumpAndSettle();
      expect(find.text('Coming soon!'), findsOneWidget);

      // Dismiss snackbar and modal
      await tester.pumpAndSettle(const Duration(seconds: 5));

      // Test UPSU.net placeholder
      await tester.tap(find.text('Open'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('UPSU.net'));
      await tester.pumpAndSettle();
      expect(find.text('Coming soon!'), findsOneWidget);
    });

    testWidgets('should navigate to correct routes when tapped',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          initialRoute: '/test',
          routes: {
            '/test': (context) => Scaffold(
                  body: Builder(
                    builder: (context) => ElevatedButton(
                      onPressed: () => showModalBottomSheet(
                        context: context,
                        builder: (context) => const MobileNavbarWidget(),
                      ),
                      child: const Text('Open'),
                    ),
                  ),
                ),
            '/': (context) => const Scaffold(body: Text('Home Page')),
            '/shop': (context) => const Scaffold(body: Text('Shop Page')),
            '/sale': (context) => const Scaffold(body: Text('Sale Page')),
            '/about': (context) => const Scaffold(body: Text('About Page')),
          },
        ),
      );

      // Test Home navigation - modal should close after navigation
      await tester.tap(find.text('Open'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Home'));
      await tester.pumpAndSettle();
      // Modal closes, so navigation items should not be visible
      expect(find.text('Home'), findsNothing);
      expect(find.text('Shop'), findsNothing);
    });
  });
}
