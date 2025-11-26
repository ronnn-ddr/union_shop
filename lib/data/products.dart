import '../models/product.dart';

const List<Product> products = [
  Product(
    name: 'Rainbow Hoodie',
    image: 'assets/images/RainbowHoodie.png',
    price: 30.0,
    description:
        'Introducing our new Rainbow Hoodie! With a prominent Rainbow print, this hoodie is a must have!',
    material: '100% Cotton',
    sizes: ['S', 'M', 'L', 'XL'],
    collections: ['Clothing'],
  ),
  Product(
    name: 'Graduation Hoodies',
    image: 'assets/images/GraduationHoodie.png',
    price: 35.0,
    description: 'Celebrate your graduation with our stylish hoodies.',
    material: '100% Cotton',
    sizes: ['S', 'M', 'L', 'XL'],
    collections: ['Clothing'],
  ),
  Product(
    name: 'Classic Cap',
    image: 'assets/images/ClassicCap.png',
    price: 12.0,
    description: 'A timeless classic cap for everyday wear.',
    material: 'Cotton',
    sizes: ['One Size'],
    collections: ['Accessories'],
  ),
  Product(
    name: 'Heavyweight Shorts',
    image: 'assets/images/HeavyweightShorts.png',
    price: 20.0,
    description: 'Comfortable heavyweight shorts for all activities.',
    material: 'Cotton Blend',
    sizes: ['S', 'M', 'L', 'XL'],
    collections: ['Clothing'],
  ),
];
