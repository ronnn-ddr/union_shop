import 'package:flutter/material.dart';

class PaginationWidget extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final ValueChanged<int> onPageChanged;

  const PaginationWidget({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    // Check if narrow screen (< 500px) to use compact layout
    final isNarrow = MediaQuery.of(context).size.width < 500;
    final spacing = isNarrow ? 8.0 : 16.0;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed:
              currentPage > 1 ? () => onPageChanged(currentPage - 1) : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF4d2963),
            foregroundColor: Colors.white,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
            // Use compact padding on narrow screens
            padding: isNarrow
                ? const EdgeInsets.symmetric(horizontal: 12, vertical: 8)
                : null,
          ),
          child: Text(
            isNarrow ? 'Prev' : 'Previous',
            style: const TextStyle(fontFamily: 'WorkSans'),
          ),
        ),
        SizedBox(width: spacing),
        Text(
          'Page $currentPage of $totalPages',
          style: TextStyle(
            fontFamily: 'WorkSans',
            fontSize: isNarrow ? 12 : 14,
          ),
        ),
        SizedBox(width: spacing),
        ElevatedButton(
          onPressed: currentPage < totalPages
              ? () => onPageChanged(currentPage + 1)
              : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF4d2963),
            foregroundColor: Colors.white,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
            // Use compact padding on narrow screens
            padding: isNarrow
                ? const EdgeInsets.symmetric(horizontal: 12, vertical: 8)
                : null,
          ),
          child: const Text(
            'Next',
            style: TextStyle(fontFamily: 'WorkSans'),
          ),
        ),
      ],
    );
  }
}
