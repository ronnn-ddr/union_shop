import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/widgets/filter_widget.dart';

void main() {
  group('FilterWidget Tests', () {
    testWidgets('FilterWidget displays price filter chips',
        (WidgetTester tester) async {
      List<String> selectedPriceRanges = [];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: FilterWidget(
                selectedPriceRanges: selectedPriceRanges,
                onPriceRangesChanged: (ranges) => selectedPriceRanges = ranges,
              ),
            ),
          ),
        ),
      );

      // Check if label is present
      expect(find.text('Filter by Price:'), findsOneWidget);

      // Check if price chips are present
      expect(find.text('Under £20'), findsOneWidget);
      expect(find.text('£20-£50'), findsOneWidget);
      expect(find.text('Over £50'), findsOneWidget);
    });

    testWidgets('FilterWidget calls callback when price chips are selected',
        (WidgetTester tester) async {
      List<String> selectedPriceRanges = [];
      List<String>? updatedRanges;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: FilterWidget(
                selectedPriceRanges: selectedPriceRanges,
                onPriceRangesChanged: (ranges) => updatedRanges = ranges,
              ),
            ),
          ),
        ),
      );

      // Tap on price chip 'Under £20'
      await tester.tap(find.text('Under £20'));
      await tester.pump();

      // Check if callback was called
      expect(updatedRanges, ['Under £20']);
    });
  });
}
