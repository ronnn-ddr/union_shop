import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/widgets/sort_widget.dart';

void main() {
  group('SortWidget Tests', () {
    testWidgets('SortWidget displays dropdown', (WidgetTester tester) async {
      String selectedSort = 'name-asc';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 300,
              child: SortWidget(
                selectedSort: selectedSort,
                onSortChanged: (value) {
                  selectedSort = value;
                },
              ),
            ),
          ),
        ),
      );

      // Check if the dropdown is present
      expect(find.byType(DropdownButtonFormField<String>), findsOneWidget);

      // Check if the label is present
      expect(find.text('Sort by'), findsOneWidget);
    });

    testWidgets('SortWidget calls onSortChanged when selection changes',
        (WidgetTester tester) async {
      String selectedSort = 'name-asc';
      String? changedValue;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 300,
              child: SortWidget(
                selectedSort: selectedSort,
                onSortChanged: (value) {
                  changedValue = value;
                },
              ),
            ),
          ),
        ),
      );

      // Tap the dropdown
      await tester.tap(find.byType(DropdownButtonFormField<String>));
      await tester.pumpAndSettle();

      // Select 'Price Low-High'
      await tester.tap(find.text('Price Low-High').last);
      await tester.pumpAndSettle();

      // Check if callback was called
      expect(changedValue, 'price-asc');
    });
  });
}
