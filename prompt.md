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

The collections page should be renamed from `lib/product_categories.dart` to `lib/collections.dart`, and updated to display collections dynamically based on a new data model. Create a Collection model in `lib/models/collection.dart` with fields for name, description, image, and id. Create a data source in `lib/data/collections.dart` with a list of Collection instances, derived from the unique collections in the products dataset (e.g., 'Clothing', 'Accessories') to ensure consistency, with IDs created as lowercase versions of the collection names (e.g., 'clothing', 'accessories').

Specifically:

1. **Rename Files**: Rename `lib/product_categories.dart` to `lib/collections.dart`, and `test/product_categories_test.dart` to `test/collections_test.dart`, keeping the same format and functionality.

2. **Update References**: Change any mentions of "product_categories" or "categories" that link to this page to "Collections" in [`lib/main.dart`](lib/main.dart ), navigation, and other files to maintain functionality.

3. **Make Dynamic**: Replace hardcoded categories with dynamic data from `lib/data/collections.dart`. Display collections as cards or buttons, with name, description, and image. On tap, navigate to the appropriate page (e.g., 'Clothing' to '/shop/clothing'), or do nothing for unavailable collections. Ensure collections are tied to the products dataset by deriving them from the unique values in products' collections field. Implement dynamic routing for collections, by renaming the current clothing page to a dynamic collection page that filters products based on the collection ID from the URL, analogous to how ProductPage works with product IDs.

4. **Add IDs and Routes**: Add id field to Collection model and assign IDs in the data source. Implement dynamic routing in `lib/main.dart` using `onGenerateRoute` to handle '/shop/<id>' routes, parsing the collection ID from the URL and passing it to a generic `CollectionPage` that filters products accordingly, without hardcoding specific routes for each collection.

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

2. **Filtering Widget**: Create `lib/widgets/filter_widget.dart` with FilterChips for filtering options. On collections page: no filtering (since collections are separate). On individual collection pages: filter price range (under £20, £20-£30, over £40).

3. **Pagination Widget**: Create `lib/widgets/pagination_widget.dart` with Previous/Next buttons and page indicator. Paginate every 4 items, updating the GridView to show only the current page's items.

4. **Integration**: Update `lib/collections.dart` to include sorting and pagination above the GridView. Update `lib/collection_page.dart` to include sorting, filtering, and pagination. Use StatefulWidgets to manage state and rebuild on changes.

Additional requirements:
- Use Flutter widgets like DropdownButton, FilterChip, ElevatedButton for the widgets.
- Ensure the widgets are responsive: Adjust padding and sizes with MediaQuery (16px mobile, 32px desktop).
- Styling: Use 'WorkSans' font, theme color (Color(0xFF4d2963)) for buttons, black/grey text.
- Handle edge cases: Disable buttons when no previous/next page, show all items if fewer than 4.
- Integrate seamlessly with existing code; update state in page build methods.

Provide the new code for `lib/widgets/sort_widget.dart`, `lib/widgets/filter_widget.dart`, `lib/widgets/pagination_widget.dart`, updated code for `lib/collections.dart`, `lib/collection_page.dart`, and ensure the app builds and runs without errors. Create unit tests for the new functionality if possible. Add brief comments explaining the changes and how they integrate with the existing code.

# Mobile Navigation Drawer Widget Feature

Create a reusable mobile navigation drawer widget for the Union Shop app by extracting the existing drawer code from `lib/main.dart` HomeScreen into a separate widget. The main entry point is in `lib/main.dart`, which sets up a MaterialApp with routes. The app has multiple pages like home screen (`lib/main.dart` HomeScreen), product page (`lib/product_page.dart`), collections page (`lib/collections.dart`), collection page (`lib/collection_page.dart`), sale page (`lib/sale_page.dart`), about page (`lib/about_page.dart`), and login page (`lib/login_page.dart`). Currently, the drawer code is duplicated across pages or only in HomeScreen.

Extract the Drawer widget from the HomeScreen in `lib/main.dart` into a new StatelessWidget `lib/widgets/mobile_drawer_widget.dart`. This widget should contain the exact same Drawer with ListTiles for Home, Shop, The Print Shack, SALE!, About, UPSU.net, using the same styling, colors, and navigation logic. Update all pages that have mobile drawers (HomeScreen, CollectionPage, etc.) to use `drawer: isMobile ? const MobileDrawerWidget() : null` in their Scaffold, removing the duplicated drawer code.

Specifically:

1. **Extract MobileDrawerWidget**: Create `lib/widgets/mobile_drawer_widget.dart` as a StatelessWidget that returns the Drawer from HomeScreen, with the DrawerHeader and ListTiles intact.

2. **Update Pages**: Replace inline drawer code in `lib/main.dart` HomeScreen, `lib/collection_page.dart`, and any other pages with `drawer: isMobile ? const MobileDrawerWidget() : null`.

Additional requirements:
- Use the existing drawer code exactly as is from `lib/main.dart`.
- Ensure the drawer only appears on mobile (MediaQuery width < 800).
- Styling: Keep the existing 'WorkSans' font, theme color (Color(0xFF4d2963)) for header, white text.
- Navigation: Preserve all existing navigation logic and route handling.
- Integrate seamlessly with existing code; eliminate code duplication.

Provide the new code for `lib/widgets/mobile_drawer_widget.dart`, updated code for `lib/main.dart` HomeScreen and other pages, and ensure the app builds and runs without errors. Create unit tests for the new widget if possible. Add brief comments explaining the changes and how they integrate with the existing code.

# Mobile Navbar Widget Feature

Create a mobile-specific navigation bar widget for the Union Shop app to replace the removed drawer and provide navigation on mobile devices. The main entry point is in `lib/main.dart`, which sets up a MaterialApp with routes. The app has screens like home screen (`lib/main.dart` HomeScreen), product page (`lib/product_page.dart`), about page (`lib/about_page.dart`), collections page (`lib/collections.dart`), collection page (`lib/collection_page.dart`), sale page (`lib/sale_page.dart`), and login page (`lib/login_page.dart`). The app uses header and footer widgets for consistent layout.

The mobile navbar should be a new widget in `lib/widgets/mobile_navbar_widget.dart`; create it as a bottom navigation bar with icons and labels for key navigation items. It will be used by the HeaderWidget to display navigation on mobile devices (MediaQuery width < 800), solving the lack of navigation after removing the drawer.

Specifically:

1. **Widget Structure**: Create a widget that displays a list of navigation items: Home, Shop, The Print Shack, SALE!, About, and UPSU.net. Use a Column with ListTile widgets for each item, each with an appropriate icon (e.g., Icons.home for Home, Icons.shop for Shop, Icons.print for The Print Shack, Icons.local_offer for SALE!, Icons.info for About, Icons.web for UPSU.net) and text. Style with white background, using the theme color (Color(0xFF4d2963)) for accents like selected items or icons.

2. **Navigation Logic**: Each ListTile onTap should navigate to routes like '/', '/shop' (for Shop), '/sale' (for SALE!), '/about' (for About). For The Print Shack and UPSU.net, use placeholder callbacks for now, doing nothing, since routes may not be implemented yet. Close the navbar after navigation.

3. **Integration with HeaderWidget**: Modify `lib/widgets/header_widget.dart` so that the Icons.menu button, which is only shown on mobile (hide it on desktop where width >= 800), onTap opens the MobileNavbarWidget in a modal bottom sheet (using showModalBottomSheet). On desktop, the menu button is not needed and should be hidden.

4. **Responsive Behavior**: The menu button in HeaderWidget is only visible on mobile (width < 800); on desktop, it's hidden as navigation is handled by the header buttons.

Additional requirements:
- Use Flutter widgets like Column, ListTile, Icon, Text for layout.
- Ensure the widget is stateless.
- Styling: Use 'WorkSans' font for text, consistent with app theme.
- Navigation: Integrate with existing routes in `lib/main.dart`.
- Handle edge cases: Ensure proper navigation and modal dismissal.
- Integrate seamlessly with existing code; for example, use similar styling to other widgets.

Provide the new code for `lib/widgets/mobile_navbar_widget.dart`, updated code for `lib/widgets/header_widget.dart`, any necessary changes to `lib/main.dart` if needed, and ensure the app builds and runs without errors. Create unit tests for the new widget in `test/widgets/mobile_navbar_widget_test.dart` if possible. Update unit tests for the header widget in `test/widgets/header_test.dart` to cover the new menu button behavior.

# Comprehensive Test Coverage for Missing Features

Create comprehensive unit and widget tests for features in the Union Shop app that currently lack test coverage. The main entry point is in `lib/main.dart`, which sets up a MaterialApp with routes. The app has multiple pages: home screen (`lib/main.dart` HomeScreen), product page (`lib/product_page.dart`), about page (`lib/about_page.dart`), collections page (`lib/collections.dart`), collection page (`lib/collection_page.dart`), sale page (`lib/sale_page.dart`), and login page (`lib/login_page.dart`). The app uses models (Product, Collection, Cart, CartItem) and widgets (HeaderWidget, FooterWidget, MobileNavbarWidget, SortWidget, FilterWidget, PaginationWidget).

Current test coverage includes tests for models (Product, Collection, Cart, CartItem), widgets (HeaderWidget, FooterWidget, MobileNavbarWidget, SortWidget, FilterWidget, PaginationWidget), and pages (HomeScreen, AboutPage, Collections). However, several critical features lack test coverage and need comprehensive testing.

Specifically, create tests for:

1. **ProductPage Tests** (`test/product_page_test.dart`):
   - Test product details display from route arguments
   - Test size selection dropdown functionality
   - Test quantity input controls
   - Test "Add to Cart" button and SnackBar confirmation
   - Test image carousel navigation
   - Test responsive layout (mobile vs desktop)
   - Test fallback when no product data provided
   - Test product information tabs rendering

2. **CollectionPage Tests** (`test/collection_page_test.dart`):
   - Test collection filtering by ID from route
   - Test product grid display for filtered collection
   - Test sorting functionality integration (name, price)
   - Test filtering by price range
   - Test filtering by size
   - Test pagination controls
   - Test responsive grid layout (mobile vs desktop)
   - Test empty collection state

3. **SalePage Tests** (`test/sale_page_test.dart`):
   - Test sale products grid rendering
   - Test sale price display vs original price
   - Test struck-through original price styling
   - Test "View Details" button navigation with product data
   - Test responsive grid (2 columns mobile, 3 columns desktop)
   - Test empty sale state

4. **LoginPage Tests** (`test/login_page_test.dart`):
   - Test login form rendering (email, password fields)
   - Test sign-up form rendering (name, email, password, confirm password)
   - Test tab switching between login and sign-up
   - Test email validation (format check)
   - Test password validation (length >= 6)
   - Test confirm password matching
   - Test login button SnackBar feedback
   - Test sign-up button SnackBar feedback
   - Test responsive padding

5. **Routing Tests** (`test/routing_test.dart`):
   - Test onGenerateRoute for '/product/<id>' parsing
   - Test onGenerateRoute for '/shop/<id>' parsing
   - Test route fallbacks for invalid paths
   - Test product lookup by ID
   - Test collection lookup by ID
   - Test default route '/' navigation

7. **Data Source Validation Tests**:
   - Test all products have required fields (name, image, price, id)
   - Test all products have valid image paths
   - Test all products have at least one collection
   - Test all collections have unique IDs
   - Test product IDs are unique and valid

7. **Integration Tests**:
   - Test navigation flow from home to product details
6. **Data Source Validation Tests**:ges
   - Test cart state persistence using Provider
   - Test filtering and sorting maintaining state

Additional requirements:
- Use flutter_test package and testWidgets for widget tests
- Use MediaQuery sizing for responsive tests (e.g., 600px, 800px breakpoints)
- Mock route arguments using ModalRoute settings
- Test with sample product and collection data
- Ensure all tests are isolated and don't depend on each other
- Use proper setUp and tearDown if needed
- Add descriptive test names and organize into groups
- Aim for comprehensive coverage of user interactions and edge cases

Note on existing test files:
- `test/product_test.dart` - already exists with basic tests, needs enhancement with comprehensive coverage
- `test/sale_page_test.dart` - already exists, needs additional tests for responsive layout and edge cases
- `test/login_page_test.dart` - already exists, needs enhancement with validation and responsive tests
- `test/collections_test.dart` - already exists for the collections listing page
- `test/collection_page_test.dart` - needs to be created for individual collection pages (different from collections_test.dart)

- `test/routing_test.dart` - needs to be created for dynamic routing tests
- `test/data/products_test.dart` and `test/data/collections_test.dart` - need to be created for data validation

Provide enhanced test files for existing test suites and new test files for missing ones, ensuring they follow the existing test patterns in the codebase (e.g., `test/home_test.dart`, `test/about_test.dart`). Ensure all tests pass with `flutter test`. Add brief comments explaining the test structure and what each test group covers.