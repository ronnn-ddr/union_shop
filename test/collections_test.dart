import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/product_categories.dart';
import 'package:union_shop/widgets/header_widget.dart';
import 'package:union_shop/widgets/footer_widget.dart';

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

  testWidgets('Displays all categories', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1080, 1920);
    tester.view.devicePixelRatio = 1.0;
    await tester.pumpWidget(
      const MaterialApp(
        home: ProductCategories(),
      ),
    );

    expect(find.text('Clothing'), findsOneWidget);
    expect(find.text('Merchandise'), findsOneWidget);
    expect(find.text('Signature & Essential Range'), findsOneWidget);
    expect(find.text('Portsmouth City Collection'), findsOneWidget);
    expect(find.text('Graduation'), findsOneWidget);
  });

  testWidgets('Header and footer are present on clothing category page',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1080, 1920);
    tester.view.devicePixelRatio = 1.0;
    await tester.pumpWidget(
      const MaterialApp(
        home: ProductCategories(),
      ),
    );

    expect(find.byType(HeaderWidget), findsOneWidget);
    expect(find.byType(FooterWidget), findsOneWidget);
  });
}
