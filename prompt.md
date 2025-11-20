# Rainbow Hoodie Product Page Feature

Create a detailed Flutter product page for the "Rainbow Hoodie" item in the Union Shop app. The main entry point is in `lib/main.dart`, which sets up a MaterialApp with routes including '/product' leading to the ProductPage. The app has screens like home screen (`lib/main.dart` HomeScreen), product page (`lib/product_page.dart`), about page (`lib/about_page.dart`), shop menu page (`lib/shop_menu_page.dart`), and clothing page (`lib/clothing_page.dart`). The app uses product cards and navigation.

The product page already exists in `lib/product_page.dart`; I need to modify it to display detailed information for the Rainbow Hoodie, including the image, description, and interactive widgets. Specifically:

1. **Product Image**: Change the existing Image.network to Image.asset('assets/images/RainbowHoodie.png'). Keep the height of 300 pixels, full width, BoxFit.cover, and error handling with a fallback container showing an icon if the image fails to load.

2. **Product Details**: Update the product title from "Placeholder Product Name" to "Rainbow Hoodie" in bold, large font (e.g., 24px). Change the price from "£15.00" to "£30.00" prominently. Replace the description with: "Introducing our new Rainbow Hoodie! With a prominent Rainbow print, this hoodie is a must have!" Add bullet points below for features like "Material: 100% Cotton", "Sizes: S, M, L, XL", "Care Instructions: Machine washable".

3. **Interactive Widgets**: Add size selection with a DropdownButton for sizes (S, M, L, XL) below the description. Include an ElevatedButton for "Add to Cart" with the app's theme color (Color(0xFF4d2963)), white text, and a callback that shows a SnackBar saying "Added to cart!" for now. Optionally, add quantity selection with a numeric input field (e.g., TextField with increment/decrement buttons or a Stepper widget) next to the size selection.

4. **Page Structure**: Add existing widgets to the page.

Additional requirements:
- Use Flutter widgets like Container, Padding, SizedBox, and Text for layout.
- Ensure the page is responsive: Use MediaQuery for padding adjustments on mobile vs. desktop.
- Styling: Update all Text widgets to use 'WorkSans' font family, background color white, text colors black for titles and grey for descriptions.
- Navigation: Integrate with existing routes; the page is accessed via '/product'.
- Handle edge cases: Ensure proper error handling for images and form-like interactions.
- Integrate seamlessly with existing code; for example, use similar styling to other pages.

Provide the updated code for `lib/product_page.dart`, any necessary changes to `lib/main.dart` for routing if needed, and ensure the app builds and runs without errors. Include unit tests for the new functionality in `test/product_page_test.dart` if possible. Add brief comments explaining the changes and how they integrate with the existing code.