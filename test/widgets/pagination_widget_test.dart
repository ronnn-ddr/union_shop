import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/widgets/pagination_widget.dart';

void main() {
  group('PaginationWidget Tests', () {
    testWidgets('PaginationWidget displays page info and buttons',
        (WidgetTester tester) async {
      int currentPage = 1;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PaginationWidget(
              currentPage: currentPage,
              totalPages: 5,
              onPageChanged: (page) => currentPage = page,
            ),
          ),
        ),
      );

      // Check if buttons are present
      expect(find.text('Previous'), findsOneWidget);
      expect(find.text('Next'), findsOneWidget);

      // Check if page info is displayed
      expect(find.text('Page 1 of 5'), findsOneWidget);
    });

    testWidgets('PaginationWidget disables Previous on first page',
        (WidgetTester tester) async {
      int? calledPage;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PaginationWidget(
              currentPage: 1,
              totalPages: 5,
              onPageChanged: (page) => calledPage = page,
            ),
          ),
        ),
      );

      // Tap Previous button - should not call callback
      await tester.tap(find.text('Previous'));
      await tester.pump();

      // Check that callback was not called
      expect(calledPage, isNull);
    });

    testWidgets('PaginationWidget disables Next on last page',
        (WidgetTester tester) async {
      int? calledPage;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PaginationWidget(
              currentPage: 5,
              totalPages: 5,
              onPageChanged: (page) => calledPage = page,
            ),
          ),
        ),
      );

      // Tap Next button - should not call callback
      await tester.tap(find.text('Next'));
      await tester.pump();

      // Check that callback was not called
      expect(calledPage, isNull);
    });

    testWidgets('PaginationWidget calls onPageChanged when buttons are pressed',
        (WidgetTester tester) async {
      int? changedPage;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PaginationWidget(
              currentPage: 2,
              totalPages: 5,
              onPageChanged: (page) => changedPage = page,
            ),
          ),
        ),
      );

      // Tap Next button
      await tester.tap(find.text('Next'));
      await tester.pump();

      // Check if callback was called with correct page
      expect(changedPage, 3);

      // Reset
      changedPage = null;

      // Tap Previous button
      await tester.tap(find.text('Previous'));
      await tester.pump();

      // Check if callback was called with correct page
      expect(changedPage, 1);
    });
  });
}
