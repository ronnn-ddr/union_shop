import 'package:flutter/material.dart';

class SortWidget extends StatelessWidget {
  final String selectedSort;
  final ValueChanged<String> onSortChanged;

  const SortWidget({
    super.key,
    required this.selectedSort,
    required this.onSortChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 200, minWidth: 150),
      child: DropdownButtonFormField<String>(
        initialValue: selectedSort,
        isExpanded: true,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          labelText: 'Sort by',
        ),
        items: const [
          DropdownMenuItem(
            value: 'name-asc',
            child: Text(
              'Name A-Z',
              style: TextStyle(fontFamily: 'WorkSans', fontSize: 14),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          DropdownMenuItem(
            value: 'price-asc',
            child: Text(
              'Price Low-High',
              style: TextStyle(fontFamily: 'WorkSans', fontSize: 14),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          DropdownMenuItem(
            value: 'price-desc',
            child: Text(
              'Price High-Low',
              style: TextStyle(fontFamily: 'WorkSans', fontSize: 14),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
        onChanged: (value) {
          if (value != null) {
            onSortChanged(value);
          }
        },
      ),
    );
  }
}
