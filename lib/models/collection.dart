class Collection {
  final String name;
  final String description;
  final String image;

  const Collection({
    required this.name,
    required this.description,
    required this.image,
  });

  @override
  String toString() {
    return 'Collection(name: $name, description: $description, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Collection &&
        other.name == name &&
        other.description == description &&
        other.image == image;
  }

  @override
  int get hashCode => name.hashCode ^ description.hashCode ^ image.hashCode;
}
