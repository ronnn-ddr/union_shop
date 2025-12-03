import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/models/product.dart';
import 'package:union_shop/data/products.dart';

void main() {
  group('Product Model Tests', () {
    test('Product instantiation with all fields', () {
      const product = Product(
        name: 'Test Product',
        image: 'test_image.png',
        price: 10.0,
        salePrice: 8.0,
        description: 'A test product',
        material: 'Cotton',
        sizes: ['S', 'M', 'L'],
        collections: ['Test'],
        id: 'test-id',
      );

      expect(product.name, 'Test Product');
      expect(product.image, 'test_image.png');
      expect(product.price, 10.0);
      expect(product.salePrice, 8.0);
      expect(product.description, 'A test product');
      expect(product.material, 'Cotton');
      expect(product.sizes, ['S', 'M', 'L']);
      expect(product.collections, ['Test']);
      expect(product.id, 'test-id');
    });

    test('Product instantiation without salePrice', () {
      const product = Product(
        name: 'Test Product',
        image: 'test_image.png',
        price: 10.0,
        description: 'A test product',
        material: 'Cotton',
        sizes: ['S', 'M', 'L'],
        collections: ['Test'],
        id: 'test-id',
      );

      expect(product.salePrice, isNull);
    });

    test('Product toString', () {
      const product = Product(
        name: 'Test Product',
        image: 'test_image.png',
        price: 10.0,
        salePrice: 8.0,
        description: 'A test product',
        material: 'Cotton',
        sizes: ['S', 'M', 'L'],
        collections: ['Test'],
        id: 'test-id',
      );

      const expectedString =
          'Product(name: Test Product, image: test_image.png, price: 10.0, salePrice: 8.0, description: A test product, material: Cotton, sizes: [S, M, L], collections: [Test], id: test-id)';
      expect(product.toString(), expectedString);
    });

    test('Products data source is a list of Product instances', () {
      expect(products, isA<List<Product>>());
      expect(products.isNotEmpty, true);
    });

    test('Products data source contains expected products', () {
      final rainbowHoodie =
          products.firstWhere((p) => p.id == 'rainbow-hoodie');
      expect(rainbowHoodie.name, 'Rainbow Hoodie');
      expect(rainbowHoodie.price, 30.0);
      expect(rainbowHoodie.salePrice, 25.0);

      final unionTShirt = products.firstWhere((p) => p.id == 'union-t-shirt');
      expect(unionTShirt.name, 'Union T-Shirt');
      expect(unionTShirt.price, 15.0);
      expect(unionTShirt.salePrice, 12.0);
    });
  });
}
