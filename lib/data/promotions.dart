import '../models/promotion_slide.dart';

final List<PromotionSlide> promotionSlides = [
  // Slide 1: The Print Shack
  const PromotionSlide(
    title: 'The Print Shack',
    description:
        'Let\'s create something uniquely yours with our personalisation service - From £3 for one line of text!',
    buttonText: 'FIND OUT MORE',
    route: null, // Coming soon - will show SnackBar
    imagePath: 'assets/images/Personalisation.png',
  ),

  // Slide 2: Sale
  const PromotionSlide(
    title: 'Limited Time Sale',
    description: 'Discover discounts on our great products!',
    buttonText: 'SHOP SALE',
    route: '/sale',
    imagePath: 'assets/images/SalePromotion.png',
  ),

  // Slide 3: Graduation
  const PromotionSlide(
    title: 'Celebrate Your Achievement',
    description:
        'Make your graduation unforgettable with our exclusive graduation merchandise. Capture the moment with keepsakes.',
    buttonText: 'VIEW COLLECTION',
    route: '/shop/graduation',
    imagePath: 'assets/images/GraduateCollectionPromotion.png',
  ),

  // Slide 4: Student Accommodation
  const PromotionSlide(
    title: 'Find Your Perfect Home',
    description:
        'Looking for student accommodation? Browse our curated listings and find the perfect place to call home during your studies.',
    buttonText: 'EXPLORE HOUSING',
    route: null, // Coming soon - will show SnackBar
    imagePath: 'assets/images/AccommodationPromotion.png',
  ),
];
