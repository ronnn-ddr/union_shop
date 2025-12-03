import 'package:flutter/material.dart';
import '../models/promotion_slide.dart';
import 'pagination_widget.dart';

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

    // Responsive sizing
    final isMobile = MediaQuery.of(context).size.width < 800;
    final horizontalPadding = isMobile ? 16.0 : 32.0;
    final titleSize = isMobile ? 24.0 : 32.0;
    final descriptionSize = isMobile ? 14.0 : 20.0;

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
                  left: horizontalPadding,
                  right: horizontalPadding,
                  top: 80,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Title
                      Text(
                        currentSlide.title,
                        style: TextStyle(
                          fontSize: titleSize,
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
                        style: TextStyle(
                          fontSize: descriptionSize,
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
                          if (currentSlide.route != null) {
                            Navigator.pushNamed(context, currentSlide.route!);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Coming soon!')),
                            );
                          }
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
        // Pagination controls
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: PaginationWidget(
            currentPage: _currentIndex + 1, // Convert 0-based to 1-based
            totalPages: widget.slides.length,
            onPageChanged: _onPageChanged,
          ),
        ),
      ],
    );
  }
}
