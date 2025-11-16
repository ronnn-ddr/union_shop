import 'package:flutter/material.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  void placeholderCallbackForButtons() {
    // This is the event handler for buttons that don't work yet
  }

  Widget _buildFooterSection(String title, dynamic items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontFamily: 'WorkSans',
          ),
        ),
        const SizedBox(height: 12),
        ...items.map((item) {
          if (item is String) {
            // Simple text item
            return Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Text(
                item,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  fontFamily: 'WorkSans',
                ),
              ),
            );
          } else if (item is Map<String, dynamic>) {
            // Clickable item
            return Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: GestureDetector(
                onTap: item['onTap'] as VoidCallback?,
                child: Text(
                  item['text'] as String,
                  style: TextStyle(
                    fontSize: 14,
                    color: item['onTap'] != null ? Colors.blue : Colors.grey,
                    fontFamily: 'WorkSans',
                    decoration:
                        item['onTap'] != null ? TextDecoration.underline : null,
                  ),
                ),
              ),
            );
          }
          return const SizedBox.shrink();
        }),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.grey[50],
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          // Footer sections
          LayoutBuilder(
            builder: (context, constraints) {
              final isMobile = constraints.maxWidth < 600;
              return isMobile
                  ? Column(
                      children: [
                        _buildFooterSection('Opening Hours', [
                          '(Term Time)',
                          'Monday - Friday: 9:00 AM - 4:00 PM',
                          "(Outside of Term Time / Consolidation Weeks)",
                          'Monday - Friday: 9:00 AM - 3:00 PM',
                        ]),
                        const SizedBox(height: 24),
                        _buildFooterSection('Help and Information', [
                          {
                            'text': 'Search',
                            'onTap': placeholderCallbackForButtons
                          },
                          {
                            'text': 'Terms & Conditions of Sale Policy',
                            'onTap': placeholderCallbackForButtons
                          },
                        ]),
                      ],
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: _buildFooterSection('Opening Hours', [
                            '(Term Time)',
                            'Monday - Friday: 9:00 AM - 4:00 PM',
                            '(Outside of Term Time / Consolidation Weeks)',
                            'Monday - Friday: 9:00 AM - 3:00 PM',
                          ]),
                        ),
                        const SizedBox(width: 24),
                        Expanded(
                          child: _buildFooterSection('Help and Information', [
                            {
                              'text': 'Search',
                              'onTap': placeholderCallbackForButtons
                            },
                            {
                              'text': 'Terms & Conditions of Sale Policy',
                              'onTap': placeholderCallbackForButtons
                            },
                          ]),
                        ),
                      ],
                    );
            },
          ),
          const SizedBox(height: 24),
          // Bottom section with powered by
          const Text(
            'Powered by Flutter',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              fontFamily: 'WorkSans',
            ),
          ),
        ],
      ),
    );
  }
}
