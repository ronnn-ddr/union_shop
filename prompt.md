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

# Sale Page Feature

Create a detailed Flutter sale page for the Union Shop app, showcasing products on sale. The main entry point is in [`lib/main.dart`](lib/main.dart ), which sets up a MaterialApp with routes including '/sale' leading to the SalePage. The app has screens like home screen ([`lib/main.dart`](lib/main.dart ) HomeScreen), product page ([`lib/product_page.dart`](lib/product_page.dart )), about page ([`lib/about_page.dart`](lib/about_page.dart )), shop menu page ([`lib/shop_menu_page.dart`](lib/shop_menu_page.dart )), and clothing page ([`lib/clothing_page.dart`](lib/clothing_page.dart )). The app uses product cards and navigation.

The sale page should be a new screen in `lib/sale_page.dart`; create it to display a grid of products on sale, each with a card showing image, name, sale price, original price (struck through), and a brief description. Tapping a card navigates to the existing ProductPage with that product's details. Assume sample sale products (e.g., Rainbow Hoodie and others) for demonstration; in a real app, this would pull from a data source.

Specifically:

1. **Page Layout**: Use a Scaffold with an AppBar titled "Sale" and a GridView.builder for a responsive grid (2 columns on mobile, 3 on desktop). Each grid item is a Card with an image, title, prices, description.

2. **Product Cards**: For each sale product, display Image.asset (with error handling), Text for name (bold), Row for prices (sale in black, original struck-through in grey), Text for description (truncated), and the button. Use a list of maps for product data (keys: 'name', 'image', 'price', 'originalPrice', 'description', 'material', 'sizes').

3. **Navigation Integration**: Update ProductPage to use ModalRoute arguments for product data, falling back to a default (e.g., Rainbow Hoodie) if none provided. Ensure '/sale' route is added to [`lib/main.dart`](lib/main.dart ).

4. **Interactive Elements**: The "View Details" button passes product data to ProductPage. No cart logic yet; just navigation.

Additional requirements:
- Use Flutter widgets like Container, Padding, SizedBox, and Text for layout.
- Ensure the page is responsive: Use MediaQuery for padding and grid adjustments on mobile vs. desktop.
- Styling: Update all Text widgets to use 'WorkSans' font family, background color white, text colors black for titles and grey for descriptions, theme color (Color(0xFF4d2963)) for buttons.
- Navigation: Integrate with existing routes; the page is accessed via '/sale'.
- Handle edge cases: Ensure proper error handling for images and navigation.
- Integrate seamlessly with existing code; for example, use similar styling to other pages.
- Include headers and footers similar to other pages in the app, such as an AppBar header and a footer (e.g., a Container at the bottom with copyright text or links).

Provide the new code for `lib/sale_page.dart`, updated code for [`lib/product_page.dart`](lib/product_page.dart ) (to accept dynamic data), any necessary changes to [`lib/main.dart`](lib/main.dart ) for routing if needed, and ensure the app builds and runs without errors. Include unit tests for the new functionality in `test/sale_page_test.dart` if possible. Add brief comments explaining the changes and how they integrate with the existing code.