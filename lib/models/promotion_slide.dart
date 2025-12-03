class PromotionSlide {
  final String title;
  final String description;
  final String buttonText;
  final String? route; // null means no navigation, show SnackBar instead
  final String imagePath;

  const PromotionSlide({
    required this.title,
    required this.description,
    required this.buttonText,
    this.route,
    required this.imagePath,
  });
}
