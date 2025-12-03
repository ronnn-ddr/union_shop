import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/models/cart.dart';

void main() {
  late Cart cart;

  setUp(() {
    // Create a fresh Cart instance before each test
    cart = Cart();
  });

  group('Add Item Tests', () {
    test('adds single item to empty cart', () {
      // Verify cart starts empty
      expect(cart.itemCount, 0);
      expect(cart.totalAmount, 0.0);
      expect(cart.items, isEmpty);

      // Add one item
      cart.addItem(
        id: 'p1',
        title: 'Test Product',
        price: '£25.00',
        imageUrl: 'test.jpg',
        size: 'M',
        quantity: 1,
      );

      // Verify item was added correctly
      expect(cart.itemCount, 1);
      expect(cart.totalAmount, 25.0);
      expect(cart.items.length, 1);
      expect(cart.items.first.id, 'p1');
      expect(cart.items.first.title, 'Test Product');
      expect(cart.items.first.price, '£25.00');
      expect(cart.items.first.size, 'M');
      expect(cart.items.first.quantity, 1);
    });

    test('adds same item with same size increases quantity not duplicate', () {
      // Add item with quantity 1
      cart.addItem(
        id: 'p1',
        title: 'Test Product',
        price: '£25.00',
        imageUrl: 'test.jpg',
        size: 'M',
        quantity: 1,
      );

      expect(cart.itemCount, 1);
      expect(cart.items.first.quantity, 1);

      // Add same item (same id and size) with quantity 2
      cart.addItem(
        id: 'p1',
        title: 'Test Product',
        price: '£25.00',
        imageUrl: 'test.jpg',
        size: 'M',
        quantity: 2,
      );

      // Verify no duplicate created - itemCount stays 1
      expect(cart.itemCount, 1);

      // Verify quantity increased to 3 (1 + 2)
      expect(cart.items.first.quantity, 3);

      // Verify totalAmount reflects combined quantity (3 * £25 = £75)
      expect(cart.totalAmount, 75.0);
    });
  });

  group('Update Quantity and Remove Tests', () {
    test('increases and decreases quantity correctly', () {
      // Add item with quantity 1
      cart.addItem(
        id: 'p1',
        title: 'Test Product',
        price: '£25.00',
        imageUrl: 'test.jpg',
        size: 'M',
        quantity: 1,
      );

      expect(cart.items.first.quantity, 1);
      expect(cart.totalAmount, 25.0);

      // Update quantity to 3
      cart.updateQuantity('p1', 'M', 3);

      // Verify quantity updated and totalAmount recalculates
      expect(cart.items.first.quantity, 3);
      expect(cart.totalAmount, 75.0);

      // Update quantity to 1
      cart.updateQuantity('p1', 'M', 1);

      // Verify quantity decreased and totalAmount recalculates
      expect(cart.items.first.quantity, 1);
      expect(cart.totalAmount, 25.0);
    });

    test('updating quantity to 0 or negative removes item', () {
      // Add item
      cart.addItem(
        id: 'p1',
        title: 'Test Product',
        price: '£25.00',
        imageUrl: 'test.jpg',
        size: 'M',
        quantity: 1,
      );

      expect(cart.itemCount, 1);

      // Update quantity to 0
      cart.updateQuantity('p1', 'M', 0);

      // Verify item is removed from cart
      expect(cart.itemCount, 0);
      expect(cart.items, isEmpty);
      expect(cart.totalAmount, 0.0);

      // Add item again
      cart.addItem(
        id: 'p1',
        title: 'Test Product',
        price: '£25.00',
        imageUrl: 'test.jpg',
        size: 'M',
        quantity: 1,
      );

      expect(cart.itemCount, 1);

      // Update quantity to -1
      cart.updateQuantity('p1', 'M', -1);

      // Verify item is removed from cart
      expect(cart.itemCount, 0);
      expect(cart.items, isEmpty);
      expect(cart.totalAmount, 0.0);
    });
  });

  group('Clear Cart and Listener Notifications', () {
    // Tests for clearing cart and listener notifications will go here
  });
}
