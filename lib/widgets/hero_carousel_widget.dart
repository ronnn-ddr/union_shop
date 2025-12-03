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
        // AnimatedSwitcher for smooth transitions between slides
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          switchInCurve: Curves.easeInOut,
          switchOutCurve: Curves.easeInOut,
          child: SizedBox(
            key: ValueKey<int>(_currentIndex), // Unique key triggers animation
            height: 400,
            width: double.infinity,
            child: Stack(
              children: [
                // Background image with error handling
                Positioned.fill(
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Image.asset(
                          currentSlide.imagePath,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: Colors.grey[300],
                              child: const Center(
                                child: Icon(
                                  Icons.image_not_supported,
                                  color: Colors.grey,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      // Semi-transparent overlay for text readability
                      Positioned.fill(
                        child: Container(
                          color: const Color.fromRGBO(0, 0, 0, 0.35),
                        ),
                      ),
                    ],
                  ),
                ),
                // Content overlay (title, description, button)
                Positioned(
                  left: 24,
                  right: 24,
                  top: 80,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Title
                      Text(
                        currentSlide.title,
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          height: 1.2,
                          fontFamily: 'WorkSans',
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Description
                      Text(
                        currentSlide.description,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          height: 1.5,
                          fontFamily: 'WorkSans',
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 32),
                      // Call-to-action button
                      ElevatedButton(
                        onPressed: () {
                          // Button handler will be implemented in subtask 7
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF4d2963),
                          foregroundColor: Colors.white,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                        ),
                        child: Text(
                          currentSlide.buttonText,
                          style: const TextStyle(
                            fontSize: 14,
                            letterSpacing: 1,
                            fontFamily: 'WorkSans',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        // Pagination widget will be added in subtask 6
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
