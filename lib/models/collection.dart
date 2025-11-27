class Collection {
  final String name;
  final String description;
  final String image;
  final String id;

  const Collection({
    required this.name,
    required this.description,
    required this.image,
    required this.id,
  });

  @override
  String toString() {
    return 'Collection(name: $name, description: $description, image: $image, id: $id)';
  }
}
