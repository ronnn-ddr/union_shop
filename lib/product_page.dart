import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'widgets/header_widget.dart';
import 'widgets/footer_widget.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  // Local UI state for size and quantity
  String? _selectedSize;
  int _quantity = 1;
  final TextEditingController _quantityController =
      TextEditingController(text: '1');

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _quantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            const HeaderWidget(),

            // Product details (responsive: image left, info right on wide screens)
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(24),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final isWide = constraints.maxWidth >= 600;

                  // Image widget (square)
                  final productImage = Container(
                    width: isWide ? 300 : double.infinity,
                    height: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey[200],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        'assets/images/RainbowHoodie.png',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.grey[300],
                            child: const Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.image_not_supported,
                                    size: 64,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    'Image unavailable',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );

                  final productInfoContent = Padding(
                    padding: EdgeInsets.only(
                        left: isWide ? 24 : 0, top: isWide ? 0 : 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Rainbow Hoodie',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontFamily: 'WorkSans',
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          '£30.00',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF4d2963),
                            fontFamily: 'WorkSans',
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Option controls: Size (full width) and Quantity (compact, right)
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Size column: label + dropdown (expand)
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Size',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontFamily: 'WorkSans')),
                                  const SizedBox(height: 8),
                                  Container(
                                    height: 48,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.grey.shade300),
                                      borderRadius: BorderRadius.circular(6),
                                      color: Colors.white,
                                    ),
                                    child: DropdownButton<String>(
                                      isExpanded: true,
                                      value: _selectedSize,
                                      hint: const Text('Select size'),
                                      underline: const SizedBox.shrink(),
                                      items: ['S', 'M', 'L', 'XL']
                                          .map((s) => DropdownMenuItem(
                                              value: s, child: Text(s)))
                                          .toList(),
                                      onChanged: (value) {
                                        setState(() {
                                          _selectedSize = value;
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 16),

                            // Quantity column: label + spinbox
                            Flexible(
                              fit: FlexFit.loose,
                              child: ConstrainedBox(
                                constraints:
                                    const BoxConstraints(maxWidth: 120),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('Quantity',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black,
                                            fontFamily: 'WorkSans')),
                                    const SizedBox(height: 8),
                                    Container(
                                      height: 48,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.grey.shade300),
                                        borderRadius: BorderRadius.circular(6),
                                        color: Colors.white,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          IconButton(
                                            padding: EdgeInsets.zero,
                                            constraints:
                                                const BoxConstraints.tightFor(
                                                    width: 28, height: 28),
                                            icon: const Icon(Icons.remove,
                                                size: 14),
                                            onPressed: () {
                                              setState(() {
                                                if (_quantity > 1) {
                                                  _quantity--;
                                                  _quantityController.text =
                                                      _quantity.toString();
                                                }
                                              });
                                            },
                                          ),
                                          Expanded(
                                            child: SizedBox(
                                              height: 28,
                                              child: TextField(
                                                controller: _quantityController,
                                                keyboardType:
                                                    TextInputType.number,
                                                textAlign: TextAlign.center,
                                                textAlignVertical:
                                                    TextAlignVertical.center,
                                                decoration:
                                                    const InputDecoration(
                                                  border: InputBorder.none,
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                          vertical: 6),
                                                ),
                                                inputFormatters: [
                                                  FilteringTextInputFormatter
                                                      .digitsOnly,
                                                ],
                                                onChanged: (value) {
                                                  int? v = int.tryParse(value);
                                                  if (v != null &&
                                                      v >= 1 &&
                                                      v <= 99) {
                                                    _quantity = v;
                                                  } else {
                                                    _quantityController.text =
                                                        _quantity.toString();
                                                    _quantityController
                                                            .selection =
                                                        TextSelection.collapsed(
                                                            offset:
                                                                _quantityController
                                                                    .text
                                                                    .length);
                                                  }
                                                },
                                              ),
                                            ),
                                          ),
                                          IconButton(
                                            padding: EdgeInsets.zero,
                                            constraints:
                                                const BoxConstraints.tightFor(
                                                    width: 28, height: 28),
                                            icon:
                                                const Icon(Icons.add, size: 14),
                                            onPressed: () {
                                              setState(() {
                                                if (_quantity < 99) {
                                                  _quantity++;
                                                  _quantityController.text =
                                                      _quantity.toString();
                                                }
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 20),

                        // Add to Cart button (full width)
                        SizedBox(
                          width: double.infinity,
                          height: 48,
                          child: ElevatedButton(
                            onPressed: () {
                              // Validate selection (simple)
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Added to cart!')),
                              );
                              // TODO: integrate with cart model
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF4d2963),
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4)),
                            ),
                            child: const Text('ADD TO CART',
                                style: TextStyle(letterSpacing: 1.2)),
                          ),
                        ),

                        const SizedBox(height: 20),
                        const Text(
                          'Description',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            fontFamily: 'WorkSans',
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Introducing our new Rainbow Hoodie! With a prominent Rainbow print, this hoodie is a must have!',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                            height: 1.5,
                            fontFamily: 'WorkSans',
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          '• Material: Cotton\n• Sizes: S, M, L, XL\n• Care Instructions: Machine wash cold',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                            height: 1.5,
                            fontFamily: 'WorkSans',
                          ),
                        ),
                      ],
                    ),
                  );

                  if (isWide) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        productImage,
                        // Wrap info in Expanded when in a Row to take remaining space
                        Expanded(child: productInfoContent),
                      ],
                    );
                  }

                  // Narrow layout: image above, info below (no Expanded)
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      productImage,
                      const SizedBox(height: 24),
                      productInfoContent,
                    ],
                  );
                },
              ),
            ),

            // Footer
            const FooterWidget(),
          ],
        ),
      ),
    );
  }
}
