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
- Replace the custom top header with an `AppBar` using `navigateToHome(context)` for the back action.
- Add responsive padding and layout adjustments using `MediaQuery` or `LayoutBuilder`.
- Update `Text` widgets to use `fontFamily: 'WorkSans'` and appropriate colors.
- Add unit/widget tests in `test/product_page_test.dart` covering render and interactions.
- Run `flutter analyze` and `flutter test`, and perform a manual visual verification on an emulator/device.