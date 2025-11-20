import 'package:flutter/material.dart';
import 'cart_item.dart';

class Cart with ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => List.unmodifiable(_items);

  int get itemCount => _items.length;

  double get totalAmount {
    return _items.fold(0.0, (sum, item) {
      final price = double.tryParse(item.price.replaceAll('£', '')) ?? 0.0;
      return sum + (price * item.quantity);
    });
  }

  void addItem({
    required String id,
    required String title,
    required String price,
    required String imageUrl,
    required String size,
    required int quantity,
  }) {
    final existingIndex =
        _items.indexWhere((item) => item.id == id && item.size == size);
    if (existingIndex >= 0) {
      // Update quantity if same item and size
      final existingItem = _items[existingIndex];
      _items[existingIndex] = existingItem.copyWith(
        quantity: existingItem.quantity + quantity,
      );
    } else {
      _items.add(CartItem(
        id: id,
        title: title,
        price: price,
        imageUrl: imageUrl,
        size: size,
        quantity: quantity,
      ));
    }
    notifyListeners();
  }

  void removeItem(String id, String size) {
    _items.removeWhere((item) => item.id == id && item.size == size);
    notifyListeners();
  }

  void updateQuantity(String id, String size, int quantity) {
    final index =
        _items.indexWhere((item) => item.id == id && item.size == size);
    if (index >= 0) {
      if (quantity <= 0) {
        removeItem(id, size);
      } else {
        _items[index] = _items[index].copyWith(quantity: quantity);
        notifyListeners();
      }
    }
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }
}
