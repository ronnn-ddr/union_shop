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
  });
}
