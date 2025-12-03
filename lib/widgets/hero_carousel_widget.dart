import 'package:flutter/material.dart';
import '../models/promotion_slide.dart';

/// A carousel widget that displays promotional slides with pagination controls.
/// Manages the current slide state and handles navigation between slides.
class HeroCarouselWidget extends StatefulWidget {
  final List<PromotionSlide> slides;

  const HeroCarouselWidget({
    super.key,
    required this.slides,
  });

  @override
  State<HeroCarouselWidget> createState() => _HeroCarouselWidgetState();
}

class _HeroCarouselWidgetState extends State<HeroCarouselWidget> {
  // Track the current slide index (0-based)
  int _currentIndex = 0;

  /// Updates the current slide index
  void _onPageChanged(int newPage) {
    setState(() {
      _currentIndex = newPage - 1; // PaginationWidget uses 1-based pages
    });
  }

  @override
  Widget build(BuildContext context) {
    // Get the current slide
    final currentSlide = widget.slides[_currentIndex];

    return Column(
      children: [
        // Hero section container - will be filled in next subtask
        SizedBox(
          height: 400,
          width: double.infinity,
          child: Container(
            color: Colors.grey[300],
            child: Center(
              child: Text(
                'Slide ${_currentIndex + 1}: ${currentSlide.title}',
                style: const TextStyle(
                  fontSize: 24,
                  fontFamily: 'WorkSans',
                ),
              ),
            ),
          ),
        ),
        // Pagination widget will be added in a later subtask
        const SizedBox(height: 20),
        Text(
          'Pagination controls go here',
          style: TextStyle(
            color: Colors.grey[600],
            fontFamily: 'WorkSans',
          ),
        ),
      ],
    );
  }
}
