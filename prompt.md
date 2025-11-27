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

Provide the updated code for `lib/product_page.dart`, any necessary changes to `lib/main.dart` for routing if needed, and ensure the app builds and runs without errors. Include unit tests for the new functionality in `test/product_test.dart` if possible. Add brief comments explaining the changes and how they integrate with the existing code.

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

Provide the new code for `lib/sale_page.dart`, updated code for [`lib/product_page.dart`](lib/product_page.dart ) (to accept dynamic data), any necessary changes to [`lib/main.dart`](lib/main.dart ) for routing if needed, and ensure the app builds and runs without errors. Create unit tests for the new functionality in `test/sale_page_test.dart` if possible. Add brief comments explaining the changes and how they integrate with the existing code.

# Login/Sign-Up Page Feature

Create a detailed Flutter login/sign-up page for the Union Shop app. The main entry point is in [`lib/main.dart`](lib/main.dart ), which sets up a MaterialApp with routes including '/login' leading to the LoginPage. The app has screens like home screen ([`lib/main.dart`](lib/main.dart ) HomeScreen), product page ([`lib/product_page.dart`](lib/product_page.dart )), about page ([`lib/about_page.dart`](lib/about_page.dart )), shop menu page ([`lib/shop_menu_page.dart`](lib/shop_menu_page.dart )), clothing page ([`lib/clothing_page.dart`](lib/clothing_page.dart )), and sale page ([`lib/sale_page.dart`](lib/sale_page.dart )). The app uses HeaderWidget and FooterWidget for consistency.

The login/sign-up page should be a new screen in `lib/login_page.dart`; create it to display forms for user login and sign-up, with tabs or sections to switch between them. The forms should include fields for email, password, and for sign-up additional fields like confirm password and name. Buttons for "Login" and "Sign Up" should be present, but functionality is not required yet (just show a SnackBar on press).

Specifically:

1. **Page Layout**: Use a Scaffold with the existing `lib/widgets/header_widget` at the top and `lib/widgets/footer_widget` at the bottom, and a centered Container with a Column containing a TabBar or buttons to switch between Login and Sign-Up tabs. Use TabBarView for the forms.

2. **Login Form**: Include TextFormField for email and password, with labels and basic validation (e.g., email format, password length). An ElevatedButton for "Login" that shows a SnackBar "Login successful!".

3. **Sign-Up Form**: Include TextFormField for name, email, password, confirm password, with validation. An ElevatedButton for "Sign Up" that shows a SnackBar "Sign up successful!".

4. **Navigation Integration**: Add '/login' route to [`lib/main.dart`](lib/main.dart ). Update HeaderWidget to have a login button if needed.

Additional requirements:
- Use Flutter widgets like TextFormField, ElevatedButton, TabBar, TabBarView for layout.
- Ensure the page is responsive: Use MediaQuery for padding adjustments on mobile vs. desktop.
- Styling: Update all Text widgets to use 'WorkSans' font family, background color white, text colors black for labels and grey for hints, theme color (Color(0xFF4d2963)) for buttons.
- Navigation: Integrate with existing routes; the page is accessed via '/login' and the person icon in the header.
- Handle edge cases: Basic form validation, but no backend integration.
- Integrate seamlessly with existing code; for example, use similar styling to other pages.

Provide the new code for `lib/login_page.dart`, any necessary changes to [`lib/main.dart`](lib/main.dart ) for routing, and ensure the app builds and runs without errors. Include unit tests for the new functionality in `test/login_page_test.dart` if possible. Add brief comments explaining the changes and how they integrate with the existing code.

# Product Data Model Feature

Create a data model for products in the Union Shop app to replace hardcoded data. The main entry point is in [`lib/main.dart`](lib/main.dart ), which sets up a MaterialApp with routes. The app has screens like home screen ([`lib/main.dart`](lib/main.dart ) HomeScreen), product page ([`lib/product_page.dart`](lib/product_page.dart )), about page ([`lib/about_page.dart`](lib/about_page.dart )), shop menu page ([`lib/shop_menu_page.dart`](lib/shop_menu_page.dart )), clothing page ([`lib/clothing_page.dart`](lib/clothing_page.dart )), sale page ([`lib/sale_page.dart`](lib/sale_page.dart )), and login page ([`lib/login_page.dart`](lib/login_page.dart )). Currently, product data is hardcoded in various places, such as strings and maps in product_page.dart and sale_page.dart.

Create a Product model class in `lib/models/product.dart` with fields for name, image, price, salePrice (optional for sales), description, material, sizes (list of strings), collections (list of strings for multiple collections, but can have one), and id (string for product ID/slug). Make it a data class with appropriate constructors, toString, and equality methods if needed.

Then, create a list of Product instances in a new file `lib/data/products.dart` or integrate it into `lib/main.dart`, containing sample products like the Rainbow Hoodie and others used in the app.

Update `lib/product_page.dart` to accept a Product object via ModalRoute arguments instead of hardcoded values, and display the data from the Product instance. For pricing, show the salePrice if available, otherwise the price. Products should be accessible via routes like `/product/rainbow-hoodie` where the product ID is used in the URL.

Update `lib/sale_page.dart` to use the list of products from the data file instead of hardcoded maps, and pass the Product object when navigating to ProductPage. In the product cards, display Row for prices (salePrice in black if available, price struck-through in grey).

Ensure that other pages using product data, like clothing_page.dart or product_categories.dart, are updated accordingly if they reference products. Specifically, update clothing_page.dart to display products from the data source instead of hardcoded items, filtering for clothing category if applicable.
- Update navigation in `lib/main.dart` to use product IDs for direct links to specific products, pulling information from the dataset.

Specifically:

1. **Product Model**: Define a class Product with final fields: String name, String image, double price, double? salePrice, String description, String material, List<String> sizes, List<String> collections, String id.

2. **Data Source**: Create a list of Product objects in `lib/data/products.dart`, e.g., Rainbow Hoodie with appropriate values.

3. **Update ProductPage**: Modify to receive Product via route arguments, and use its properties for title, price (or salePrice), description, etc. Fallback to a default product if none provided.

4. **Update SalePage**: Replace hardcoded list with the products list, and when tapping a card, pass the Product to ProductPage.

Additional requirements:
- Use Dart classes and constructors appropriately.
- Ensure the app is responsive and styled consistently with existing pages.
- Navigation: Update routes to pass Product objects where needed. Products should be accessible via `/product/(productid)` routes.
- Handle edge cases: Ensure proper null handling for optional fields like salePrice.
- Integrate seamlessly with existing code; for example, use similar structures to other models like cart_item.dart.
- Use existing header and footer widgets (`lib/widgets/header_widget.dart` and `lib/widgets/footer_widget.dart`) in updated pages where applicable.
- Include headers and footers similar to other pages if applicable.
- Modify any affected existing tests to accommodate the new data model.

Provide the new code for `lib/models/product.dart`, `lib/data/products.dart`, updated code for [`lib/product_page.dart`](lib/product_page.dart ), [`lib/sale_page.dart`](lib/sale_page.dart ), any necessary changes to [`lib/main.dart`](lib/main.dart ) for data integration, and ensure the app builds and runs without errors. Include unit tests for the new functionality in `test/product_model_test.dart` if possible. Add brief comments explaining the changes and how they integrate with the existing code.

# Collections Data Model Feature (And name change from Category & /shop)

Create a detailed Flutter collections page for the Union Shop app, renaming and updating the existing product categories page. The main entry point is in [`lib/main.dart`](lib/main.dart ), which sets up a MaterialApp with routes including '/shop' leading to the CollectionsPage. The app has screens like home screen ([`lib/main.dart`](lib/main.dart ) HomeScreen), product page ([`lib/product_page.dart`](lib/product_page.dart )), about page ([`lib/about_page.dart`](lib/about_page.dart )), clothing page ([`lib/clothing_page.dart`](lib/clothing_page.dart )), sale page ([`lib/sale_page.dart`](lib/sale_page.dart )), and login page ([`lib/login_page.dart`](lib/login_page.dart )). The app uses HeaderWidget and FooterWidget for consistency.

The collections page should be renamed from `lib/product_categories.dart` to `lib/collections.dart`, and updated to display collections dynamically based on a new data model. Create a Collection model in `lib/models/collection.dart` with fields for name, description, and image. Create a data source in `lib/data/collections.dart` with a list of Collection instances, derived from the unique collections in the products dataset (e.g., 'Clothing', 'Accessories') to ensure consistency.

Specifically:

1. **Rename Files**: Rename `lib/product_categories.dart` to `lib/collections.dart`, and `test/product_categories_test.dart` to `test/collections_test.dart`, keeping the same format and functionality.

2. **Update References**: Change any mentions of "product_categories" or "categories" that link to this page to "Collections" in [`lib/main.dart`](lib/main.dart ), navigation, and other files to maintain functionality.

3. **Make Dynamic**: Replace hardcoded categories with dynamic data from `lib/data/collections.dart`. Display collections as cards or buttons, with name, description, and image. On tap, navigate to the appropriate page (e.g., 'Clothing' to '/collection/clothing'), or do nothing for unavailable collections. Ensure collections are tied to the products dataset by deriving them from the unique values in products' collections field. Implement dynamic routing for collections, by renaming the current clothing page to a dynamic collection page that filters products based on the collection ID from the URL, analogous to how ProductPage works with product IDs.

Additional requirements:
- Use Flutter widgets like ListView or GridView for displaying collections.
- Ensure the page is responsive: Use MediaQuery for padding and layout adjustments on mobile vs. desktop.
- Styling: Update all Text widgets to use 'WorkSans' font family, background color white, text colors black for titles and grey for descriptions, theme color (Color(0xFF4d2963)) for buttons.
- Navigation: Integrate with existing routes; the page is accessed via '/shop'.
- Handle edge cases: Ensure proper error handling for images and navigation.
- Integrate seamlessly with existing code; for example, use similar structures to other models like product.dart.
- Include headers and footers similar to other pages if applicable.

Provide the new code for `lib/models/collection.dart`, `lib/data/collections.dart`, updated code for [`lib/product_categories.dart`](lib/product_categories.dart ) (renamed to `lib/collections.dart`), any necessary changes to [`lib/main.dart`](lib/main.dart ) for routing and renaming, and ensure the app builds and runs without errors. Create unit tests for the new functionality in `test/product_categories_test.dart` (renamed to `test/collections_test.dart`) if possible. Add brief comments explaining the changes and how they integrate with the existing code.

# Sorting, Filtering, and Pagination Widgets Feature

Create sorting, filtering, and pagination widgets for the Union Shop app to enhance the collections page (`lib/collections.dart`) and individual collection pages (`lib/collection_page.dart`). The main entry point is in `lib/main.dart`, which sets up a MaterialApp with routes. The app uses HeaderWidget and FooterWidget for consistency, and displays collections/products in responsive GridViews.

Add reusable widgets for sorting (by name A-Z, price low-high, price high-low), filtering (on individual collection pages: by size or price range), and pagination (every 4 items). Integrate these above the GridView in each page, using state management for dynamic updates. Ensure responsiveness with MediaQuery adjustments for mobile vs. desktop.

Specifically:

1. **Sorting Widget**: Create `lib/widgets/sort_widget.dart` with a DropdownButton for sorting options (name A-Z, price low-high, price high-low). Apply sorting to the displayed list.

2. **Filtering Widget**: Create `lib/widgets/filter_widget.dart` with FilterChips for filtering options. On collections page: no filtering (since collections are separate). On individual collection pages: filter by size (S, M, L, XL) or price range (under £20, £20-£30, over £40).

3. **Pagination Widget**: Create `lib/widgets/pagination_widget.dart` with Previous/Next buttons and page indicator. Paginate every 4 items, updating the GridView to show only the current page's items.

4. **Integration**: Update `lib/collections.dart` to include sorting and pagination above the GridView. Update `lib/collection_page.dart` to include sorting, filtering, and pagination. Use StatefulWidgets to manage state and rebuild on changes.

Additional requirements:
- Use Flutter widgets like DropdownButton, FilterChip, ElevatedButton for the widgets.
- Ensure the widgets are responsive: Adjust padding and sizes with MediaQuery (16px mobile, 32px desktop).
- Styling: Use 'WorkSans' font, theme color (Color(0xFF4d2963)) for buttons, black/grey text.
- Handle edge cases: Disable buttons when no previous/next page, show all items if fewer than 4.
- Integrate seamlessly with existing code; update state in page build methods.

Provide the new code for `lib/widgets/sort_widget.dart`, `lib/widgets/filter_widget.dart`, `lib/widgets/pagination_widget.dart`, updated code for `lib/collections.dart`, `lib/collection_page.dart`, and ensure the app builds and runs without errors. Create unit tests for the new functionality if possible. Add brief comments explaining the changes and how they integrate with the existing code.