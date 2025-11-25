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
- [ ] Add unit/widget tests in `test/sale_page_test.dart` for rendering grid, navigation, and interactions.
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
