import 'package:flutter/material.dart';

class FilterWidget extends StatelessWidget {
  final List<String> selectedPriceRanges;
  final ValueChanged<List<String>> onPriceRangesChanged;

  const FilterWidget({
    super.key,
    required this.selectedPriceRanges,
    required this.onPriceRangesChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Filter by Price:',
          style: TextStyle(
            fontFamily: 'WorkSans',
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          children: ['Under £20', '£20-£50', 'Over £50'].map((range) {
            final isSelected = selectedPriceRanges.contains(range);
            return FilterChip(
              label: Text(
                range,
                style: TextStyle(
                  fontFamily: 'WorkSans',
                  color: isSelected ? Colors.white : Colors.black,
                ),
              ),
              selected: isSelected,
              onSelected: (selected) {
                final newRanges = List<String>.from(selectedPriceRanges);
                if (selected) {
                  newRanges.add(range);
                } else {
                  newRanges.remove(range);
                }
                onPriceRangesChanged(newRanges);
              },
              backgroundColor: Colors.grey[200],
              selectedColor: const Color(0xFF4d2963),
              checkmarkColor: Colors.white,
            );
          }).toList(),
        ),
      ],
    );
  }
}
