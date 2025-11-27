import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/models/collection.dart';
import 'package:union_shop/data/collections.dart';

void main() {
  group('Collection Model Tests', () {
    test('Collection instantiation', () {
      final collection = Collection(
        name: 'Test Collection',
        description: 'A test collection',
        image: 'test_image.png',
      );

      expect(collection.name, 'Test Collection');
      expect(collection.description, 'A test collection');
      expect(collection.image, 'test_image.png');
    });

    test('Collection equality', () {
      final collection1 = Collection(
        name: 'Test',
        description: 'Desc',
        image: 'img.png',
      );

      final collection2 = Collection(
        name: 'Test',
        description: 'Desc',
        image: 'img.png',
      );

      final collection3 = Collection(
        name: 'Different',
        description: 'Desc',
        image: 'img.png',
      );

      expect(collection1, equals(collection2));
      expect(collection1, isNot(equals(collection3)));
    });

    test('Collection toString', () {
      final collection = Collection(
        name: 'Test',
        description: 'Desc',
        image: 'img.png',
      );

      expect(
        collection.toString(),
        'Collection(name: Test, description: Desc, image: img.png)',
      );
    });
  });

  group('Collections Data Source Tests', () {
    test('Collections list is not empty', () {
      expect(collections, isNotEmpty);
    });

    test('All collections have required fields', () {
      for (final collection in collections) {
        expect(collection.name, isNotEmpty);
        expect(collection.description, isNotEmpty);
        expect(collection.image, isNotEmpty);
      }
    });
  });
}
