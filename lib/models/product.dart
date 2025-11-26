class Product {
  final String name;
  final String image;
  final double price;
  final double? salePrice;
  final String description;
  final String material;
  final List<String> sizes;

  const Product({
    required this.name,
    required this.image,
    required this.price,
    this.salePrice,
    required this.description,
    required this.material,
    required this.sizes,
  });

  @override
  String toString() {
    return 'Product(name: $name, image: $image, price: $price, salePrice: $salePrice, description: $description, material: $material, sizes: $sizes)';
  }
}
