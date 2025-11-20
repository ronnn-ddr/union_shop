# Rainbow Hoodie Product Page Requirements

## Feature Description

### Description
The feature involves enhancing the existing product page in the Union Shop Flutter app to display detailed information for the Rainbow Hoodie product. This includes displaying the product image, detailed description, price, and interactive widgets for size selection and adding to cart.

### Purpose
To improve the user experience by providing a comprehensive view of the product, allowing users to make informed purchase decisions and interact with the item before adding it to their cart. This enhances the overall shopping experience and encourages purchases.

## User Stories

### Subtask 1: View Product Image
As a customer, I want to view the Rainbow Hoodie image so that I can see what the product looks like.

### Subtask 2: Read Product Details
As a customer, I want to read the product description and details so that I understand the features and specifications of the hoodie.

### Subtask 3: Select Size
As a customer, I want to select a size from available options so that I can choose the right fit.

### Subtask 4: Add to Cart
As a customer, I want to add the hoodie to my cart so that I can proceed to checkout.

### Subtask 5: Responsive Experience
As a customer, I want the page to be responsive so that it works well on both mobile and desktop devices.

## Acceptance Criteria

### Subtask 1: Product Image Display
- The product page displays the Rainbow Hoodie image using `Image.asset('assets/images/RainbowHoodie.png')` with `BoxFit.cover`, height of 300 pixels, full width.
- Includes error handling with a fallback container showing an icon if the image fails to load.

### Subtask 2: Product Details Display
- Shows the title "Rainbow Hoodie" in bold, large font (e.g., 24px).
- Displays the price "£30.00" prominently.
- Includes the description: "Introducing our new Rainbow Hoodie! With a prominent Rainbow print, this hoodie is a must have!"
- Adds bullet points for features: "Material: 100% Cotton", "Sizes: S, M, L, XL", "Care Instructions: Machine washable".

### Subtask 3: Interactive Widgets
- Includes a `DropdownButton` for size selection with options: S, M, L, XL.
- Includes an `ElevatedButton` for "Add to Cart" with the app's theme color (`Color(0xFF4d2963)`), white text, and a callback that shows a `SnackBar` saying "Added to cart!".
- Optionally, adds quantity selection with a numeric input field (e.g., `TextField` with increment/decrement buttons or a `Stepper` widget).

### Subtask 4: Page Structure and Navigation
- Uses a `Scaffold` with an `AppBar` titled "Rainbow Hoodie".
- Includes a `SingleChildScrollView` for scrollable content.
- Adds a back button in the `AppBar` to navigate to the home screen.
- Uses a `Column` for vertical layout with `Padding` for spacing.

### Subtask 5: Responsiveness and Styling
- Ensures responsiveness using `MediaQuery` for padding adjustments on mobile vs. desktop.
- Applies styling: 'WorkSans' font family, white background, black text for titles, grey for descriptions.
- Integrates seamlessly with existing code and styling.

### Subtask 6: Integration and Testing
- Integrates with existing routes; accessed via '/product'.
- Handles edge cases: proper error handling for images and interactions.
- The app builds and runs without errors after changes.
- Includes unit tests for the new functionality in `test/product_page_test.dart`.
- Adds brief comments explaining changes and integration.