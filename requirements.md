### Feature Requirements Document: Rainbow Hoodie Product Page

#### 1. Feature Description and Purpose
The Rainbow Hoodie Product Page feature updates the existing `lib/product_page.dart` to present full product details for the Rainbow Hoodie, including an asset image, updated metadata (title and price), description, selectable options (size and quantity), and an "Add to Cart" action. The goal is to provide customers a clear, responsive, and interactive product view that matches the app's style and integrates with cart functionality in the future.

#### 2. User Stories
- View Product Image
	- As a customer, I want to view the Rainbow Hoodie image (from app assets) so I can see the product.

- Read Product Details
	- As a customer, I want the correct title, price, and a short compelling description so I can evaluate the product.

- Select Size and Quantity
	- As a customer, I want to select a size (S, M, L, XL) and specify quantity using a numeric input so I can order the correct item.

- Add to Cart
	- As a customer, I want to add the item to my cart and see a confirmation (SnackBar) so I know the action succeeded.

- Navigation and Responsiveness
	- As a customer, I want an AppBar with a back button to return home and responsive layout that adapts between mobile and desktop.

#### 3. Acceptance Criteria

##### UI and Display
- [ ] Product image uses `Image.asset('assets/images/RainbowHoodie.png')`, height 300px, `BoxFit.cover`, full width, with an error fallback UI.
- [ ] Title is "Rainbow Hoodie" (bold, ~24px) and uses `fontFamily: 'WorkSans'`.
- [ ] Price is "£30.00" styled with `Color(0xFF4d2963)`.
- [ ] Description text is: "Introducing our new Rainbow Hoodie! With a prominent Rainbow print, this hoodie is a must have!" followed by bullet points: Material, Sizes, Care Instructions.

##### Interactive Elements
- [ ] A `DropdownButton<String>` provides size selection: S, M, L, XL.
- [ ] A numeric quantity input (spinbox-style) allows choosing quantity (clamped 1–99).
- [ ] An `ElevatedButton` labeled "Add to Cart" uses theme color and shows a `SnackBar` on success.

##### Structure and Navigation
- [ ] Replace the custom header with an `AppBar(title: Text('Rainbow Hoodie'))` that includes a leading back button which calls `navigateToHome(context)`.
- [ ] The page uses `SingleChildScrollView` and `Column` for content layout and responsive `Padding` (24px mobile, 48px desktop).

##### Styling and Responsiveness
- [ ] All relevant `Text` widgets use `fontFamily: 'WorkSans'`.
- [ ] Title color is black; descriptions and details use grey.
- [ ] Layout adjusts for viewport widths (<600px mobile, >=600px desktop).

##### Integration and Testing
- [ ] No routing changes required; page remains accessible via `/product`.
- [ ] Add/modify unit/widget tests in `test/product_page_test.dart` to cover rendering and interactions.
- [ ] App builds and runs; `flutter analyze` and `flutter test` succeed.

#### 4. Subtasks
- Implement asset image usage in `lib/product_page.dart`.
- Update product title and price to "Rainbow Hoodie" and "£30.00".
- Replace placeholder description with the new marketing copy and add bullet-point details.
- Convert `ProductPage` to a `StatefulWidget` and add state fields for size and quantity.
- Implement the size selector (`DropdownButton<String>`) and numeric spinbox for quantity.
- Implement the "Add to Cart" `ElevatedButton` with SnackBar feedback and a TODO for real cart integration.
- Add unit/widget tests in `test/product_page_test.dart` covering render and interactions.

### Feature Requirements Document: Sale Page

#### 1. Feature Description and Purpose
The Sale Page feature introduces a new screen in `lib/sale_page.dart` to showcase products on sale in a responsive grid layout. Each product card displays an image, name, sale price, original price (struck through), and a brief description, with a "View Details" button that navigates to the updated ProductPage with dynamic product data. The ProductPage is modified to accept product data via route arguments, enabling reuse for multiple products. The goal is to highlight discounted items, encourage purchases, and maintain consistent styling and navigation across the app.

#### 2. User Stories
- Browse Sale Products
	- As a customer, I want to view a grid of products on sale so I can discover discounted items.

- View Product Details on Sale Page
	- As a customer, I want to see each sale product's image, name, sale price, original price, and description so I can compare options.

- Navigate to Detailed View
	- As a customer, I want to tap "View Details" on a sale product to view its full details on the ProductPage.

- Responsive Layout
	- As a customer, I want the sale page to adapt to my device (2 columns on mobile, 3 on desktop) for easy browsing.

- Consistent Styling
	- As a customer, I want the sale page to match the app's design (WorkSans font, theme colors) and include headers/footers like other pages.

#### 3. Acceptance Criteria

##### UI and Display
- [ ] Sale page uses a `Scaffold` with an `AppBar` titled "Sale" and a `GridView.builder` for product cards.
- [ ] Each product card is a `Card` with `Image.asset` (with error fallback), bold name text, `Row` for prices (sale in black, original struck-through in grey), truncated description, and "View Details" `ElevatedButton`.
- [ ] Sample sale products include at least Rainbow Hoodie and one other (e.g., Union T-Shirt), stored as a list of maps with keys: 'name', 'image', 'price', 'originalPrice', 'description', 'material', 'sizes'.

##### Interactive Elements
- [ ] "View Details" button navigates to '/product' with product data as arguments.
- [ ] ProductPage accepts dynamic data via `ModalRoute.of(context)?.settings.arguments`, falling back to Rainbow Hoodie if none provided.

##### Structure and Navigation
- [ ] Add '/sale' route to `lib/main.dart` routes map.
- [ ] Sale page includes headers and footers similar to other pages (e.g., AppBar and a footer Container).
- [ ] ProductPage updates to use dynamic data for image, title, price, description, material, sizes, etc.

##### Styling and Responsiveness
- [ ] All `Text` widgets use `fontFamily: 'WorkSans'`.
- [ ] Colors: black for titles, grey for descriptions, theme color (Color(0xFF4d2963)) for buttons.
- [ ] Grid adjusts columns based on `MediaQuery` (2 for <600px, 3 for >=600px); padding responsive (16px mobile, 32px desktop).

##### Integration and Testing
- [ ] App builds and runs; `flutter analyze` and `flutter test` succeed.
- [ ] Create unit/widget tests in `test/sale_page_test.dart` for rendering grid, navigation, and interactions.
- [ ] ProductPage tests updated to cover dynamic data.

#### 4. Subtasks
- Create `lib/sale_page.dart` with basic Scaffold.
- Add GridView.builder to SalePage.
- Add product card widgets to SalePage.
- Define sample sale products list in SalePage.
- Use existing formatting from the clothing oage
- Create `test/sale_page_test.dart` file.
- Add unit/widget tests in `test/sale_page_test.dart` for SalePage rendering.
- Add unit/widget tests in `test/sale_page_test.dart` for navigation.
- Update ProductPage tests to cover dynamic data.

### Feature Requirements Document: Login/Sign-Up Page

#### 1. Feature Description and Purpose
The Login/Sign-Up Page feature introduces a new screen in `lib/login_page.dart` for user authentication. The page includes tabbed forms for login and sign-up, with fields for email, password, and additional details for sign-up. The forms are non-functional (no backend), showing SnackBar feedback on button press. The goal is to provide a UI foundation for future authentication integration, maintaining app consistency with HeaderWidget and FooterWidget.

#### 2. User Stories
- Login
	- As a user, I want to enter my email and password to log in so I can access my account.

- Sign Up
	- As a new user, I want to create an account by providing name, email, password, and confirmation so I can register.

- Form Validation
	- As a user, I want basic validation on fields (e.g., email format, password match) so I know if my input is correct.

- Feedback
	- As a user, I want a confirmation message after submitting the form so I know the action was attempted.

#### 3. Acceptance Criteria

##### UI and Display
- [ ] Page uses HeaderWidget and FooterWidget for consistency.
- [ ] Centered Container with TabBar for "Login" and "Sign Up" tabs, using TabBarView.
- [ ] Login tab: TextFormField for email and password with labels.
- [ ] Sign-Up tab: TextFormField for name, email, password, confirm password with labels.

##### Interactive Elements
- [ ] Login button shows SnackBar "Login successful!" on press.
- [ ] Sign-Up button shows SnackBar "Sign up successful!" on press.
- [ ] Basic validation: Email regex, password length >=6, confirm password matches.

##### Structure and Navigation
- [ ] Add '/login' route to `lib/main.dart`.
- [ ] Page accessible via '/login'; update HeaderWidget to add a shortcut in the existing person button.

##### Styling and Responsiveness
- [ ] All Text uses 'WorkSans' font; labels black, hints grey.
- [ ] Buttons use theme color (Color(0xFF4d2963)).
- [ ] Responsive padding with MediaQuery (16px mobile, 32px desktop).

##### Integration and Testing
- [ ] App builds and runs; `flutter analyze` and `flutter test` succeed.
- [ ] Add unit/widget tests in `test/login_page_test.dart` for form rendering and interactions.

#### 4. Subtasks
- Create `lib/login_page.dart` with Scaffold, HeaderWidget, FooterWidget.
- Add TabBar and TabBarView for Login and Sign-Up.
- Implement Login form with TextFormField and validation.
- Implement Sign-Up form with TextFormField and validation.
- Add buttons with SnackBar feedback.
- Add '/login' route to `lib/main.dart` along with a shortcut in the header, the person icon.
- Create `test/login_page_test.dart` with tests for rendering and button presses.

### Feature Requirements Document: Product Data Model

#### 1. Feature Description and Purpose
The Product Data Model feature introduces a structured data model for products in the Union Shop app, replacing hardcoded strings and maps in files like `lib/product_page.dart` and `lib/sale_page.dart`. A new `Product` class in `lib/models/product.dart` defines product attributes, and a data source in `lib/data/products.dart` provides sample product instances. Updated pages use this model for dynamic data display, improving maintainability and enabling future features like data persistence or API integration.

#### 2. User Stories
- Define Product Structure
	- As a developer, I want a Product class with fields for name, image, price, salePrice, description, material, sizes, collections, id so I can represent products consistently.

- Create Product Data Source
	- As a developer, I want a list of Product instances in a dedicated file so I can manage sample data centrally.

- Update Product Page for Dynamic Data
	- As a user, I want the ProductPage to display data from a Product object passed via navigation so I can view different products dynamically.

- Update Sale Page for Model Data
	- As a user, I want the SalePage to use Product objects for its grid, showing salePrice prominently and price struck-through if applicable.

- Maintain Existing Widgets
	- As a developer, I want updated pages to continue using existing header and footer widgets where applicable.

#### 3. Acceptance Criteria

##### UI and Display
- [ ] Product class in `lib/models/product.dart` has final fields: String name, String image, double price, double? salePrice, String description, String material, List<String> sizes, List<String> collections, String id.
- [ ] Data source in `lib/data/products.dart` contains a list of Product instances, including Rainbow Hoodie and others with appropriate values.
- [ ] ProductPage displays salePrice if available, otherwise price; uses Product properties for all details.
- [ ] SalePage uses Product list for grid; cards show salePrice in black, price struck-through in grey if salePrice exists.

##### Interactive Elements
- [ ] ProductPage accepts Product via ModalRoute arguments, with fallback to default product. Products should be accessible via `/product/(productid)` routes.
- Update SalePage passes Product object to ProductPage on navigation.

##### Structure and Navigation
- [ ] No new routes required; updates integrate with existing '/product' and '/sale'. Products should be accessible via `/product/(productid)` routes.
- [ ] Updated pages use existing header and footer widgets (`lib/widgets/header_widget.dart` and `lib/widgets/footer_widget.dart`) where applicable.
- [ ] Category pages like `lib/clothing_page.dart` are updated to pull products from the data source instead of hardcoded data, filtering for relevant categories if needed.

##### Styling and Responsiveness
- [ ] Maintains existing styling: 'WorkSans' font, theme colors, responsive layouts.
- [ ] Pricing display handles null salePrice gracefully.

##### Integration and Testing
- [ ] App builds and runs; `flutter analyze` and `flutter test` succeed.
- [ ] Add unit tests in `test/product_model_test.dart` for Product class and data source.
- [ ] Update tests in `test/product_test.dart` and `test/sale_page_test.dart` to cover dynamic data usage.
- [ ] Modify any affected existing tests to accommodate the new data model.

#### 4. Subtasks
- Create `lib/models/product.dart` with Product class definition.
- Create `lib/data/products.dart` with list of Product instances.
- Update `lib/product_page.dart` to accept and use Product object via arguments.
- Update `lib/sale_page.dart` to use Product list instead of hardcoded maps.
- Ensure existing header and footer widgets are used in updated pages.
- Update `lib/clothing_page.dart` to pull products from the data source instead of hardcoded data, adding category filtering if necessary.
- Modify affected tests in other relevant test files (e.g., `test/clothing_page_test.dart` if applicable) to accommodate changes from hardcoded data to the new data model.

Note: Update `lib/product_categories.dart` to use dynamic data will be handled separately when categories are made non-hardcoded.
- Create `test/models/product_model_test.dart` and add unit tests for Product class instantiation, equality, and toString.
- Create `test/models/product_model_test.dart` and add unit tests for the products data source list.
- Update `test/product_test.dart` to include tests for rendering with dynamic Product data via arguments.
- Create `test/sale_page_test.dart` and add tests for grid rendering using Product list instead of hardcoded maps.
- Create `test/sale_page_test.dart` and add tests for navigation passing Product objects to ProductPage.
- Modify affected tests in `test/sale_page_test.dart` to accommodate changes from hardcoded data to the new data model.
- Modify affected tests in other relevant test files (e.g., `test/clothing_page_test.dart` if applicable) to accommodate changes from hardcoded data to the new data model.

### Feature Requirements Document: Collections Data Model Feature

#### 1. Feature Description and Purpose
The Collections Data Model Feature introduces a structured data model for collections in the Union Shop app, renaming and updating the existing product categories page to display collections dynamically. A new `Collection` class in `lib/models/collection.dart` defines collection attributes, and a data source in `lib/data/collections.dart` provides sample collection instances derived from the products dataset. The collections page is renamed from `lib/product_categories.dart` to `lib/collections.dart` and updated to use this model, with dynamic routing for navigating to filtered product lists based on collection IDs, similar to the ProductPage. The goal is to provide a consistent, maintainable way to display and navigate collections, integrating with the existing product data and app structure.

#### 2. User Stories
- Browse Collections
	- As a customer, I want to view a list or grid of collections so I can explore different product categories.

- View Collection Details
	- As a customer, I want to see each collection's name, description, and image so I can understand what products it contains.

- Navigate to Collection Products
	- As a customer, I want to tap on a collection to view the products in that collection, filtered dynamically.

- Responsive Experience
	- As a customer, I want the collections page to adapt to my device (list on mobile, grid on desktop) for easy browsing.

- Consistent Styling
	- As a customer, I want the collections page to match the app's design (WorkSans font, theme colors) and include headers/footers like other pages.

#### 3. Acceptance Criteria

##### UI and Display
- [ ] Collection class in `lib/models/collection.dart` has final fields: String name, String description, String image, String id.
- [ ] Data source in `lib/data/collections.dart` contains a list of Collection instances, derived from unique collections in the products dataset (e.g., 'Clothing', 'Accessories'), with IDs created as lowercase versions of the collection names (e.g., 'clothing' for 'Clothing').
- [ ] Collections page displays collections as cards or buttons in a ListView or GridView, with name, description, and image (using Image.asset with error fallback).
- [ ] Page uses HeaderWidget and FooterWidget for consistency.

##### Interactive Elements
- [ ] Tapping a collection navigates to '/shop/<collectionId>' (e.g., '/shop/clothing'), filtering products by that collection.
- [ ] For unavailable collections, tapping does nothing or shows a message.

##### Structure and Navigation
- [ ] Rename `lib/product_categories.dart` to `lib/collections.dart`, and `test/product_categories_test.dart` to `test/collections_test.dart`.
- [ ] Update references in `lib/main.dart` and navigation to use "Collections" instead of "product_categories" or "categories".
- [ ] Implement dynamic routing: Rename clothing page to a generic collection page that filters products based on collection ID from URL.
- [ ] Implement dynamic routing for '/shop/<id>' in `lib/main.dart` using `onGenerateRoute`.

##### Styling and Responsiveness
- [ ] All `Text` widgets use `fontFamily: 'WorkSans'`.
- [ ] Colors: black for titles, grey for descriptions, theme color (Color(0xFF4d2963)) for buttons.
- [ ] Layout adjusts columns based on `MediaQuery` (list for <600px, grid for >=600px); padding responsive (16px mobile, 32px desktop).

##### Integration and Testing
- [ ] App builds and runs; `flutter analyze` and `flutter test` succeed.
- [ ] Create unit tests in `test/collections_test.dart` for Collection class and data source.
- [ ] Update tests in `test/collections_test.dart` to cover dynamic rendering and navigation.
- [ ] Modify any affected existing tests to accommodate renaming and dynamic data.

#### 4. Subtasks
- Rename `lib/product_categories.dart` to `lib/collections.dart`, and `test/product_categories_test.dart` to `test/collections_test.dart`, keeping the same format and functionality.
- Update references to "product_categories" or "categories" to "Collections" in `lib/main.dart`, navigation, and other files.
- Create `lib/models/collection.dart` with Collection class definition including id field.
- Create `lib/data/collections.dart` with list of Collection instances derived from products, including IDs as lowercase versions of the collection names.
- Update `lib/collections.dart` to display collections dynamically from `lib/data/collections.dart`.
- Implement dynamic routing for collections, renaming clothing page to dynamic collection page filtering by collection ID.
- Implement dynamic routing for '/shop/<id>' in `lib/main.dart` using `onGenerateRoute` to parse the collection ID from the URL and route to the appropriate page without hardcoding collection IDs.
- Ensure responsive layout and styling as specified.
- Create unit tests for new functionality in `test/collections_test.dart`.

### Feature Requirements Document: Sorting, Filtering, and Pagination Widgets Feature

#### 1. Feature Description and Purpose
The Sorting, Filtering, and Pagination Widgets Feature introduces reusable widgets to enhance user experience on the collections page and individual collection pages in the Union Shop app. Sorting allows ordering by name or price, filtering enables narrowing down products by size or price range on collection pages, and pagination breaks large lists into manageable chunks of 4 items each. The goal is to make browsing more efficient and interactive, integrating seamlessly with existing GridView layouts and maintaining app responsiveness and styling.

#### 2. User Stories
- Sort Collections/Products
	- As a customer, I want to sort collections by name A-Z or products by price (low-high, high-low) so I can find items quickly.

- Filter Products
	- As a customer, I want to filter products on collection pages by size (S, M, L, XL) or price range (under £20, £20-£30, over £40) so I can narrow my search.

- Paginate Items
	- As a customer, I want to view items in pages of 4 so I can browse without overwhelming scrolling.

- Responsive Experience
	- As a customer, I want sorting, filtering, and pagination to adapt to my device (mobile or desktop) for easy interaction.

- Consistent Styling
	- As a customer, I want these widgets to match the app's design (WorkSans font, theme colors) and integrate smoothly with existing pages.

#### 3. Acceptance Criteria

##### UI and Display
- [ ] SortWidget uses DropdownButton with options: Name A-Z, Price Low-High, Price High-Low.
- [ ] FilterWidget uses FilterChips for price ranges (under £20, £20-£50, over £50) on collection pages only.
- [ ] PaginationWidget shows Previous/Next buttons, current page indicator, and handles 4 items per page.
- [ ] Widgets are placed above GridView in collections and collection pages.

##### Interactive Elements
- [ ] Sorting updates the GridView order dynamically.
- [ ] Filtering updates the displayed products dynamically.
- [ ] Pagination updates the GridView to show only current page items; buttons disabled at boundaries.

##### Structure and Navigation
- [ ] Collections page includes sorting and pagination; no filtering.
- [ ] Collection pages include sorting, filtering, and pagination.
- [ ] State managed in StatefulWidgets for rebuilds on changes.

##### Styling and Responsiveness
- [ ] All Text uses 'WorkSans' font; buttons use theme color (Color(0xFF4d2963)).
- [ ] Responsive with MediaQuery: padding 16px mobile, 32px desktop; breakpoint at 600px.
- [ ] Widgets adjust size/layout for mobile vs. desktop.

##### Integration and Testing
- [ ] App builds and runs; `flutter analyze` and `flutter test` succeed.
- [ ] Create unit tests for widgets and integration in relevant test files.
- [ ] Edge cases: Empty filters show all; pagination handles <4 items.

#### 4. Subtasks
- Create `lib/widgets/sort_widget.dart` with DropdownButton for sorting.
- Create `lib/widgets/filter_widget.dart` with FilterChips for filtering.
- Create `lib/widgets/pagination_widget.dart` with Previous/Next buttons.
- Update `lib/collections.dart` to include pagination.
- Update `lib/collection_page.dart` to include sorting, filtering, and pagination.
- Ensure responsive design and styling consistency.
- Create unit tests for new widgets and page integrations.

### Feature Requirements Document: Mobile Navigation Drawer Widget

#### 1. Feature Description and Purpose
The Mobile Navigation Drawer Widget feature extracts the existing drawer code from the HomeScreen in `lib/main.dart` into a reusable StatelessWidget `lib/widgets/mobile_drawer_widget.dart`. This widget contains the exact same Drawer with ListTiles for Home, Shop, The Print Shack, SALE!, About, UPSU.net, using the same styling, colors, and navigation logic. The goal is to eliminate code duplication, ensure consistent navigation across all mobile pages, and integrate seamlessly with existing code by updating the HeaderWidget to conditionally use the new widget on mobile devices, since the HeaderWidget is already present on every page.

#### 2. User Stories
- Consistent Mobile Navigation
	- As a user, I want the same navigation drawer on all mobile pages so I can navigate consistently across the app.

- Responsive Drawer Display
	- As a user, I want the drawer to appear only on mobile devices (width < 800) so it doesn't interfere with desktop navigation.

- Preserve Existing Functionality
	- As a user, I want all existing navigation logic and styling to remain the same so the experience is unchanged.

- Eliminate Duplication
	- As a developer, I want to remove duplicated drawer code from pages so the codebase is more maintainable.

#### 3. Acceptance Criteria

##### UI and Display
- [ ] MobileDrawerWidget is a StatelessWidget that returns the exact Drawer from HomeScreen, including DrawerHeader and ListTiles for navigation items.
- [ ] DrawerHeader uses theme color (Color(0xFF4d2963)) for background and white text.
- [ ] ListTiles include icons and text for Home, Shop, The Print Shack, SALE!, About, UPSU.net, with appropriate styling.

##### Interactive Elements
- [ ] Navigation uses existing logic: Navigator.pushNamed for routes, Navigator.pushNamedAndRemoveUntil for Home.
- [ ] Drawer closes automatically on navigation.

##### Structure and Navigation
- [ ] Extract drawer code from `lib/main.dart` HomeScreen into `lib/widgets/mobile_drawer_widget.dart`.
- [ ] Update HeaderWidget (`lib/widgets/header_widget.dart`) to conditionally return an AppBar on mobile that includes `drawer: const MobileDrawerWidget()`, and the existing Container layout on desktop.
- [ ] Update all pages to use the modified HeaderWidget in their Scaffold appBar instead of body, ensuring the drawer is integrated via the header.

##### Styling and Responsiveness
- [ ] All Text uses 'WorkSans' font family.
- [ ] Colors match existing: theme color for header, white text, black/grey for list items.
- [ ] Drawer only appears on mobile; no changes to desktop layout.

##### Integration and Testing
- [ ] App builds and runs; `flutter analyze` and `flutter test` succeed.
- [ ] Create unit tests for MobileDrawerWidget in `test/widgets/mobile_drawer_widget_test.dart` if possible.
- [ ] Update tests for HeaderWidget and affected pages to cover drawer usage.
- [ ] Ensure no breaking changes to existing navigation.

#### 4. Subtasks
- Extract the Drawer widget from HomeScreen in `lib/main.dart` into `lib/widgets/mobile_drawer_widget.dart` as a StatelessWidget.
- Update `lib/widgets/header_widget.dart` to conditionally return an AppBar on mobile (MediaQuery width < 800) with `drawer: const MobileDrawerWidget()`, and the existing Container on desktop.
- Update all pages (HomeScreen, CollectionPage, etc.) to place HeaderWidget in Scaffold appBar instead of body, removing any inline drawer code.
- Ensure isMobile logic is consistent (MediaQuery width < 800).
- Create unit tests for the new widget and update HeaderWidget and page tests.
- Update existing tests for HeaderWidget and affected pages to accommodate the changes from body to appBar and drawer integration.
- Verify app builds, runs, and navigation works as before.
- Update README to reflect changes

### Feature Requirements Document: Mobile Navbar Widget

#### 1. Feature Description and Purpose
The Mobile Navbar Widget feature introduces a new navigation component for mobile devices to replace the removed drawer, providing easy access to key app sections. The widget is a modal bottom sheet triggered by the menu button in the header, displaying navigation items with icons and text. It ensures mobile users can navigate without the drawer, while the menu button is hidden on desktop where header navigation suffices.

#### 2. User Stories
- Access Navigation on Mobile
	- As a mobile user, I want to tap the menu button to open a navigation sheet so I can access app sections.

- Navigate to Sections
	- As a mobile user, I want to tap navigation items (Home, Shop, etc.) to go to those pages so I can browse the app.

- Responsive Menu Button
	- As a user, I want the menu button visible only on mobile and hidden on desktop so the UI is clean.

- Consistent Styling
	- As a user, I want the navbar to match the app's theme and font so it feels integrated.

#### 3. Acceptance Criteria

##### UI and Display
- [ ] The widget is a Column of ListTile widgets for: Home, Shop, The Print Shack, SALE!, About, UPSU.net.
- [ ] Each ListTile has an appropriate icon and text, styled with white background and theme color (Color(0xFF4d2963)) accents.

##### Interactive Elements
- [ ] Tapping a ListTile navigates to the corresponding route ('/', '/shop', '/sale', '/about') or shows a placeholder for unimplemented routes.
- [ ] The modal bottom sheet closes after navigation.

##### Structure and Navigation
- [ ] The menu button (Icons.menu) in HeaderWidget is only visible on mobile (width < 800).
- [ ] On mobile, tapping the menu button opens the widget in a showModalBottomSheet.
- [ ] On desktop, the menu button is hidden.

##### Styling and Responsiveness
- [ ] Use 'WorkSans' font for text.
- [ ] Theme color for icons or selected states.
- [ ] Responsive: menu button hidden on desktop.

##### Integration and Testing
- [ ] Integrate with existing routes in `lib/main.dart`.
- [ ] Create unit tests in `test/widgets/mobile_navbar_widget_test.dart`.
- [ ] Update tests in `test/widgets/header_test.dart` for menu button behavior.
- [ ] App builds and runs; flutter analyze and flutter test succeed.

#### 4. Subtasks
- Create the MobileNavbarWidget class in `lib/widgets/mobile_navbar_widget.dart` as a StatelessWidget.
- Implement the Column layout with ListTile widgets for each navigation item.
- Add appropriate icons and text labels for Home, Shop, The Print Shack, SALE!, About, and UPSU.net.
- Implement onTap handlers for each ListTile to navigate to routes or show placeholders.
- Modify `lib/widgets/header_widget.dart` to conditionally display the menu button only on mobile (width < 800).
- Implement the onTap callback for the menu button to show the MobileNavbarWidget in a showModalBottomSheet.
- Ensure the modal bottom sheet closes after navigation using Navigator.pop.
- Create unit tests in `test/widgets/mobile_navbar_widget_test.dart` for rendering all navigation items with icons and text.
- Create unit tests in `test/widgets/mobile_navbar_widget_test.dart` for placeholder SnackBar behavior on unimplemented routes.
- Create unit tests in `test/widgets/mobile_navbar_widget_test.dart` for navigation functionality and modal closure.
- Update unit tests in `test/widgets/header_test.dart` to cover menu button visibility and tap behavior.
- Verify styling consistency with 'WorkSans' font and theme color, and responsiveness across devices.

### Requirements Document: Adding Comprehensive Test Coverage for Missing Features

#### 1. Description and Purpose
Adding comprehensive test coverage addresses the gap in test coverage for critical pages and functionality in the Union Shop app. While models and widgets have good test coverage, several user-facing pages (ProductPage, CollectionPage, SalePage, LoginPage, CartPage) lack any tests, and the routing logic remains untested. This update adds comprehensive unit and widget tests to ensure reliability, catch regressions, and validate user interactions across the entire application.

#### 2. User Stories
- Reliable Product Page
	- As a developer, I want comprehensive tests for ProductPage so I can ensure product details display correctly and interactions work as expected.

- Validated Collection Functionality
	- As a developer, I want tests for CollectionPage so I can verify filtering, sorting, and pagination work correctly for all collections.

- Tested Sale Features
	- As a developer, I want tests for SalePage so I can ensure sale prices display correctly and navigation to product details works.

- Login Form Validation
	- As a developer, I want tests for LoginPage so I can verify form validation and user feedback work properly.

- Cart Functionality Assurance
	- As a developer, I want tests for CartPage so I can ensure cart operations (add, remove, update) work correctly.

- Routing Confidence
	- As a developer, I want tests for dynamic routing so I can verify products and collections are correctly resolved from URLs.

- Data Integrity
	- As a developer, I want data source validation tests so I can ensure all products and collections have required fields and valid data.

#### 3. Acceptance Criteria

##### ProductPage Tests
- [ ] Test product details display from route arguments (name, price, description, materials, sizes).
- [ ] Test size selection dropdown functionality and state updates.
- [ ] Test quantity input controls (increment, decrement, manual entry).
- [ ] Test "Add to Cart" button shows SnackBar confirmation.
- [ ] Test image carousel navigation if implemented.
- [ ] Test responsive layout (mobile vs desktop padding and layout).
- [ ] Test fallback when no product data provided in route arguments.
- [ ] Test product information tabs rendering if implemented.

##### CollectionPage Tests
- [ ] Test collection filtering by ID from route parameters.
- [ ] Test product grid display for filtered collection items.
- [ ] Test sorting functionality integration (name A-Z, price low-high, price high-low).
- [ ] Test filtering by price range functionality.
- [ ] Test filtering by size functionality.
- [ ] Test pagination controls (previous, next, page numbers).
- [ ] Test responsive grid layout (mobile vs desktop column counts).
- [ ] Test empty collection state rendering.

##### SalePage Tests
- [ ] Test sale products grid rendering with correct product count.
- [ ] Test sale price display vs original price in each card.
- [ ] Test struck-through original price styling.
- [ ] Test "View Details" button navigation passes product data correctly.
- [ ] Test responsive grid (2 columns mobile, 3 columns desktop).
- [ ] Test empty sale state when no products on sale.

##### LoginPage Tests
- [ ] Test login form rendering (email, password fields visible).
- [ ] Test sign-up form rendering (name, email, password, confirm password fields).
- [ ] Test tab switching between login and sign-up forms.
- [ ] Test email validation (invalid format rejected).
- [ ] Test password validation (minimum length 6 characters).
- [ ] Test confirm password matching validation.
- [ ] Test login button shows SnackBar "Login successful!".
- [ ] Test sign-up button shows SnackBar "Sign up successful!".
- [ ] Test responsive padding (16px mobile, 32px desktop).

##### CartPage Tests
- [ ] Test cart items display with correct product details.
- [ ] Test quantity increment button increases quantity.
- [ ] Test quantity decrement button decreases quantity.
- [ ] Test remove item button removes item from cart.
- [ ] Test cart total calculation display matches sum of items.
- [ ] Test empty cart state shows appropriate message.
- [ ] Test checkout button exists (placeholder functionality).
- [ ] Test responsive layout adapts to screen size.

##### Routing Tests
- [ ] Test onGenerateRoute parses '/product/<id>' correctly and finds product.
- [ ] Test onGenerateRoute parses '/shop/<id>' correctly and passes collection ID.
- [ ] Test route fallbacks return null for invalid paths.
- [ ] Test product lookup by ID returns correct product.
- [ ] Test product lookup by invalid ID returns fallback/first product.
- [ ] Test collection lookup by ID works correctly.
- [ ] Test default route '/' navigates to HomeScreen.

##### Data Source Validation Tests
- [ ] Test all products have required fields: name, image, price, id, description.
- [ ] Test all products have valid image paths (assets exist or proper format).
- [ ] Test all products have at least one collection assigned.
- [ ] Test all collection IDs are unique across the collections list.
- [ ] Test all product IDs are unique across the products list.
- [ ] Test product prices are positive numbers.
- [ ] Test salePrice (if present) is less than regular price.

##### Integration and Testing
- [ ] All test files follow existing patterns (e.g., test/home_test.dart structure).
- [ ] Tests use MediaQuery for responsive breakpoint testing (600px, 800px).
- [ ] Tests mock route arguments using ModalRoute settings where needed.
- [ ] Tests use sample/fixture product and collection data.
- [ ] All tests are isolated and don't depend on execution order.
- [ ] Tests use descriptive names and are organized into logical groups.
- [ ] App builds and runs; `flutter test` succeeds with all new tests passing.

#### 4. Subtasks

**ProductPage Tests (test/product_test.dart - enhance existing):**
- Add tests for responsive layout (mobile vs desktop at 800px breakpoint)
- Add tests for sale price display scenarios (salePrice vs regular price, struck-through styling)
- Add tests for size selection dropdown functionality and edge cases
- Add tests for quantity controls (increment, decrement, manual entry, bounds 1-99)
- Add tests for "Add to Cart" validation (no size selected shows error)
- Add tests for cart integration with Provider and SnackBar confirmations

**CollectionPage Tests (test/collection_page_test.dart - create new):**
- Create basic test structure and helper functions
- Add tests for collection filtering by ID from route parameters
- Add tests for product grid display for filtered collection items
- Add tests for SortWidget integration (name A-Z, price low-high, price high-low)
- Add tests for FilterWidget integration (price range, size filtering)
- Add tests for PaginationWidget integration (4 items per page, previous/next, boundaries)
- Add tests for responsive grid layout (mobile vs desktop column counts at 800px)
- Add tests for empty collection state rendering

**SalePage Tests (test/sale_page_test.dart - enhance existing):**
- Add tests for responsive grid (2 columns mobile, 3 columns desktop at 800px)
- Add tests for sale vs original price display and struck-through styling
- Add tests for empty sale state when no products on sale

**LoginPage Tests (test/login_page_test.dart - enhance existing):**
- Add tests for email validation (format checking, regex patterns)
- Add tests for password validation (minimum length 6, confirm password matching)
- Add tests for responsive padding (16px mobile, 32px desktop)

**Routing Tests (test/routing_test.dart - create new):**
- Create basic test structure for dynamic routing
- Add tests for product routing (onGenerateRoute parses '/product/<id>', finds product, handles invalid IDs)
- Add tests for collection routing (onGenerateRoute parses '/shop/<id>', handles invalid collection IDs)
- Add tests for route fallbacks (invalid paths, default route '/' to HomeScreen)

**Data Validation Tests (test/data/ - create new):**
- Create `test/data/products_test.dart` with tests for required fields (name, image, price, id, description)
- Add tests for unique product IDs
- Add tests for price validation (positive numbers, salePrice < price if present)
- Add tests for valid image paths (assets/images/... format)
- Add tests for collection assignments (at least one collection per product)
- Create `test/data/collections_test.dart` with tests for unique collection IDs and required fields

**Integration Tests:**
- Create integration tests for end-to-end user flows (browse collections -> view product -> add to cart)

**General:**
- Ensure all tests use proper setUp/tearDown and follow existing test conventions
- Verify all tests pass with `flutter test` command