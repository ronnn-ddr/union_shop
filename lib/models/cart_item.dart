class CartItem {
  final String id;
  final String title;
  final String price;
  final String imageUrl;
  final String size;
  final int quantity;

  CartItem({
    required this.id,
    required this.title,
    required this.price,
    required this.imageUrl,
    required this.size,
    required this.quantity,
  });

  CartItem copyWith({
    String? id,
    String? title,
    String? price,
    String? imageUrl,
    String? size,
    int? quantity,
  }) {
    return CartItem(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
      size: size ?? this.size,
      quantity: quantity ?? this.quantity,
    );
  }

  @override
  String toString() {
    return 'CartItem(id: $id, title: $title, price: $price, size: $size, quantity: $quantity)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CartItem &&
        other.id == id &&
        other.title == title &&
        other.price == price &&
        other.imageUrl == imageUrl &&
        other.size == size &&
        other.quantity == quantity;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        price.hashCode ^
        imageUrl.hashCode ^
        size.hashCode ^
        quantity.hashCode;
  }
}
