import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/data/products.dart';
import 'package:union_shop/data/collections.dart';

void main() {
  group('Product Data Validation Tests', () {
    test('all products should have required fields', () {
      for (final product in products) {
        // Verify required string fields are not empty
        expect(product.id, isNotEmpty,
            reason: 'Product ${product.name} has empty id');
        expect(product.name, isNotEmpty,
            reason: 'Product ${product.id} has empty name');
        expect(product.image, isNotEmpty,
            reason: 'Product ${product.name} has empty image path');
        expect(product.description, isNotEmpty,
            reason: 'Product ${product.name} has empty description');
        expect(product.material, isNotEmpty,
            reason: 'Product ${product.name} has empty material');

        // Verify price is positive
        expect(product.price, greaterThan(0),
            reason:
                'Product ${product.name} has invalid price: ${product.price}');

        // Verify sizes list is not empty
        expect(product.sizes, isNotEmpty,
            reason: 'Product ${product.name} has no sizes');

        // Verify collections list is not empty
        expect(product.collections, isNotEmpty,
            reason:
                'Product ${product.name} is not assigned to any collections');
      }
    });

    test('all product IDs should be unique', () {
      final ids = products.map((p) => p.id).toList();
      final uniqueIds = ids.toSet();

      expect(ids.length, equals(uniqueIds.length),
          reason: 'Duplicate product IDs found');
    });

    test('all product names should be unique', () {
      final names = products.map((p) => p.name).toList();
      final uniqueNames = names.toSet();

      expect(names.length, equals(uniqueNames.length),
          reason: 'Duplicate product names found');
    });

    test('product image paths should follow expected format', () {
      for (final product in products) {
        expect(product.image, startsWith('assets/images/'),
            reason:
                'Product ${product.name} has invalid image path: ${product.image}');
        expect(product.image, endsWith('.png'),
            reason:
                'Product ${product.name} image is not a PNG: ${product.image}');
      }
    });

    test('product IDs should be lowercase with hyphens', () {
      final validIdPattern = RegExp(r'^[a-z0-9-]+$');

      for (final product in products) {
        expect(product.id, matches(validIdPattern),
            reason:
                'Product ${product.name} has invalid ID format: ${product.id}');
      }
    });

    test('product descriptions should have reasonable length', () {
      for (final product in products) {
        expect(product.description.length, greaterThanOrEqualTo(10),
            reason: 'Product ${product.name} has too short description');
        expect(product.description.length, lessThanOrEqualTo(500),
            reason: 'Product ${product.name} has too long description');
      }
    });
  });

  group('Collection Data Validation Tests', () {
    test('all collections should have required fields', () {
      for (final collection in collections) {
        // Verify required string fields are not empty
        expect(collection.id, isNotEmpty,
            reason: 'Collection ${collection.name} has empty id');
        expect(collection.name, isNotEmpty,
            reason: 'Collection ${collection.id} has empty name');
        expect(collection.image, isNotEmpty,
            reason: 'Collection ${collection.name} has empty image path');
        expect(collection.description, isNotEmpty,
            reason: 'Collection ${collection.name} has empty description');
      }
    });

    test('all collection IDs should be unique', () {
      final ids = collections.map((c) => c.id).toList();
      final uniqueIds = ids.toSet();

      expect(ids.length, equals(uniqueIds.length),
          reason: 'Duplicate collection IDs found');
    });

    test('all collection names should be unique', () {
      final names = collections.map((c) => c.name).toList();
      final uniqueNames = names.toSet();

      expect(names.length, equals(uniqueNames.length),
          reason: 'Duplicate collection names found');
    });

    test('all products should belong to valid collections', () {
      final validCollectionIds = collections.map((c) => c.id).toSet();

      for (final product in products) {
        for (final collectionId in product.collections) {
          expect(validCollectionIds.contains(collectionId), isTrue,
              reason:
                  'Product ${product.name} references invalid collection: $collectionId');
        }
      }
    });
  });
}
