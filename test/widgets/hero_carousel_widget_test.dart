import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/widgets/hero_carousel_widget.dart';
import 'package:union_shop/models/promotion_slide.dart';

void main() {
  // Test data - sample promotion slides
  final testSlides = [
    const PromotionSlide(
      title: 'Test Slide 1',
      description: 'This is test slide 1 description',
      buttonText: 'BUTTON 1',
      route: '/test1',
      imagePath: 'assets/images/Personalisation.png',
    ),
    const PromotionSlide(
      title: 'Test Slide 2',
      description: 'This is test slide 2 description',
      buttonText: 'BUTTON 2',
      route: null, // No route - should show SnackBar
      imagePath: 'assets/images/Personalisation.png',
    ),
    const PromotionSlide(
      title: 'Test Slide 3',
      description: 'This is test slide 3 description',
      buttonText: 'BUTTON 3',
      route: '/test3',
      imagePath: 'assets/images/Personalisation.png',
    ),
  ];

  /// Helper function to create the carousel widget wrapped in a MaterialApp
  Widget createTestWidget(List<PromotionSlide> slides) {
    return MaterialApp(
      home: Scaffold(
        body: HeroCarouselWidget(slides: slides),
      ),
    );
  }

  group('HeroCarouselWidget', () {
    testWidgets('displays the first slide initially',
        (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget(testSlides));

      // Verify first slide content is displayed
      expect(find.text('Test Slide 1'), findsOneWidget);
      expect(find.text('This is test slide 1 description'), findsOneWidget);
      expect(find.text('BUTTON 1'), findsOneWidget);

      // Verify second slide is not displayed
      expect(find.text('Test Slide 2'), findsNothing);
    });

    testWidgets('displays PaginationWidget', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget(testSlides));

      // PaginationWidget should be present
      // Look for the Previous and Next buttons
      expect(find.text('Previous'), findsOneWidget);
      expect(find.text('Next'), findsOneWidget);
    });

    testWidgets('displays correct page indicator', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget(testSlides));

      // Should show "Page 1 of 3" for first slide of 3 total
      expect(find.text('Page 1 of 3'), findsOneWidget);
    });

    testWidgets('navigates to next slide when Next button is tapped',
        (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget(testSlides));

      // Verify we start on slide 1
      expect(find.text('Test Slide 1'), findsOneWidget);
      expect(find.text('Page 1 of 3'), findsOneWidget);

      // Tap the Next button
      await tester.tap(find.text('Next'));
      await tester.pumpAndSettle(); // Wait for animations to complete

      // Verify we moved to slide 2
      expect(find.text('Test Slide 2'), findsOneWidget);
      expect(find.text('This is test slide 2 description'), findsOneWidget);
      expect(find.text('Page 2 of 3'), findsOneWidget);

      // Verify slide 1 is no longer displayed
      expect(find.text('Test Slide 1'), findsNothing);
    });

    testWidgets('navigates to previous slide when Previous button is tapped',
        (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget(testSlides));

      // First navigate to slide 2
      await tester.tap(find.text('Next'));
      await tester.pumpAndSettle();
      expect(find.text('Test Slide 2'), findsOneWidget);

      // Now tap Previous to go back to slide 1
      await tester.tap(find.text('Previous'));
      await tester.pumpAndSettle();

      // Verify we're back on slide 1
      expect(find.text('Test Slide 1'), findsOneWidget);
      expect(find.text('Page 1 of 3'), findsOneWidget);

      // Verify slide 2 is no longer displayed
      expect(find.text('Test Slide 2'), findsNothing);
    });

    testWidgets('Previous button is disabled on first slide',
        (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget(testSlides));

      // On first slide, Previous button should be disabled
      final previousButton = tester.widget<ElevatedButton>(
        find.widgetWithText(ElevatedButton, 'Previous'),
      );
      expect(previousButton.onPressed, isNull);
    });

    testWidgets('Next button is disabled on last slide',
        (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget(testSlides));

      // Navigate to the last slide (slide 3)
      await tester.tap(find.text('Next'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Next'));
      await tester.pumpAndSettle();

      // Verify we're on slide 3
      expect(find.text('Test Slide 3'), findsOneWidget);
      expect(find.text('Page 3 of 3'), findsOneWidget);

      // Next button should be disabled
      final nextButton = tester.widget<ElevatedButton>(
        find.widgetWithText(ElevatedButton, 'Next'),
      );
      expect(nextButton.onPressed, isNull);
    });

    testWidgets('button with route navigates to correct page',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: HeroCarouselWidget(slides: testSlides),
          ),
          routes: {
            '/test1': (context) => const Scaffold(
                  body: Center(child: Text('Test Page 1')),
                ),
          },
        ),
      );

      // Verify we're on slide 1 with route '/test1'
      expect(find.text('Test Slide 1'), findsOneWidget);

      // Tap the button
      await tester.tap(find.text('BUTTON 1'));
      await tester.pumpAndSettle();

      // Verify navigation occurred
      expect(find.text('Test Page 1'), findsOneWidget);
    });

    testWidgets('button with null route shows SnackBar',
        (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget(testSlides));

      // Navigate to slide 2 (has null route)
      await tester.tap(find.text('Next'));
      await tester.pumpAndSettle();

      expect(find.text('Test Slide 2'), findsOneWidget);

      // Tap the button with null route
      await tester.tap(find.text('BUTTON 2'));
      await tester.pumpAndSettle();

      // Verify SnackBar appears with "Coming soon!" message
      expect(find.text('Coming soon!'), findsOneWidget);
    });

    testWidgets('button on slide 3 navigates correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: HeroCarouselWidget(slides: testSlides),
          ),
          routes: {
            '/test3': (context) => const Scaffold(
                  body: Center(child: Text('Test Page 3')),
                ),
          },
        ),
      );

      // Navigate to slide 3
      await tester.tap(find.text('Next'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Next'));
      await tester.pumpAndSettle();

      expect(find.text('Test Slide 3'), findsOneWidget);

      // Tap the button
      await tester.tap(find.text('BUTTON 3'));
      await tester.pumpAndSettle();

      // Verify navigation occurred
      expect(find.text('Test Page 3'), findsOneWidget);
    });
  });
}
