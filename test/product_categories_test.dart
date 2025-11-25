import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/product_categories.dart';

void main() {
  testWidgets('ProductCategories renders correctly',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1080, 1920);
    tester.view.devicePixelRatio = 1.0;
    await tester.pumpWidget(
      const MaterialApp(
        home: ProductCategories(),
      ),
    );

    expect(find.text('Choose a Category'), findsOneWidget);
    expect(find.text('Clothing'), findsOneWidget);
    expect(find.byType(GridView), findsOneWidget);
  });

  testWidgets('Tapping non-Clothing category shows SnackBar',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1080, 1920);
    tester.view.devicePixelRatio = 1.0;
    await tester.pumpWidget(
      const MaterialApp(
        home: ProductCategories(),
      ),
    );

    await tester.tap(find.text('Merchandise'));
    await tester.pump();

    expect(find.text('Coming soon: Merchandise products'), findsOneWidget);
  });
}
