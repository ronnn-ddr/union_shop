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
        id: 'test-id',
      );

      expect(collection.name, 'Test Collection');
      expect(collection.description, 'A test collection');
      expect(collection.image, 'test_image.png');
      expect(collection.id, 'test-id');
    });

    test('Collection toString', () {
      final collection = Collection(
        name: 'Test',
        description: 'Desc',
        image: 'img.png',
        id: 'test-id',
      );

      expect(
        collection.toString(),
        'Collection(name: Test, description: Desc, image: img.png, id: test-id)',
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
        expect(collection.id, isNotEmpty);
      }
    });
  });
}
