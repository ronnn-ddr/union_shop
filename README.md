# Union Shop 🛍️

A modern, responsive Flutter e-commerce application for the Students' Union Shop, featuring university-branded merchandise and personalized products.

## 📋 Overview

Union Shop is a cross-platform mobile and web application built with Flutter that showcases and sells Student Union branded products. The app provides an intuitive shopping experience with responsive design, custom typography, and comprehensive product catalog featuring clothing, accessories, and personalized items.

## ✨ Key Features

### 🏪 Core Functionality
- **Product Catalog**: Browse university-branded clothing and merchandise
- **Product Details**: View detailed product information and pricing
- **Shopping Cart**: Add items to cart, manage quantities, and proceed to checkout
  - State management powered by Provider for real-time cart updates
- **Personalization Service**: Custom text personalization starting from £3
- **Responsive Design**: Optimized for both desktop and mobile devices

### 🎨 Design & UX
- **Custom Typography**: WorkSans variable font family for modern, clean aesthetics
- **Responsive Navigation**:
  - Desktop: Horizontal navigation bar with menu buttons
  - Mobile: Modal bottom sheet navbar with Material Design ripple animations
- **Hero Section**: Eye-catching promotional banner for personalization services
- **Grid Layout**: Adaptive product grid (2 columns desktop, 1 column mobile)

### 🧪 Quality Assurance
- **Comprehensive Testing**: Full test coverage for UI components and navigation
- **Cross-Platform**: Runs on iOS, Android, Web, Windows, macOS, and Linux
- **Material Design**: Consistent with Google's Material Design principles

## 📋 Prerequisites

Before running this project, ensure you have the following installed:

- **Flutter SDK**: Version 2.17.0 or higher
  - Download from: https://flutter.dev/docs/get-started/install
- **Dart SDK**: Included with Flutter (version 2.17.0+)
- **Git**: For cloning the repository
- **IDE**: VS Code, Android Studio, or IntelliJ IDEA with Flutter extensions

### System Requirements
- **Operating System**: Windows 10+, macOS 10.14+, Linux (Ubuntu/Debian)
- **RAM**: Minimum 4GB (8GB recommended)
- **Storage**: 2GB free space for Flutter SDK and project

## 🚀 Installation

### 1. Clone the Repository

```bash
git clone https://github.com/ronnn-ddr/union_shop.git
cd union_shop
```

### 2. Install Flutter Dependencies

```bash
flutter pub get
```

This command will download and install all the required packages specified in `pubspec.yaml`.

### 3. Verify Installation

```bash
flutter doctor
```

This will check your Flutter installation and ensure all dependencies are properly configured. Fix any issues reported by `flutter doctor` before proceeding.

### 4. Set Up Development Environment

For **VS Code**:
1. Install the Flutter extension
2. Open the project folder
3. The Flutter SDK should be automatically detected

For **Android Studio**:
1. Install the Flutter plugin
2. Open the project as a Flutter project
3. Configure your Android SDK if prompted

## 🏃‍♂️ Running the Project

### Development Mode

```bash
flutter run
```

This will start the app in development mode. You'll be prompted to select a target device:
- **Chrome**: For web development
- **Android Emulator/Device**: For Android testing
- **iOS Simulator**: For iOS testing (macOS only)

### Web Build

```bash
flutter run -d chrome
```

### Mobile Build

```bash
# For Android
flutter run -d android

# For iOS (macOS only)
flutter run -d ios
```

### Production Build

```bash
# Web production build
flutter build web --release

# Android APK
flutter build apk --release

# iOS (macOS only)
flutter build ios --release
```

## 📱 Using the App

### Navigation

#### Desktop Experience (≥800px width)
- **Header Navigation**: Click navigation buttons (Home, Shop, The Print Shack, SALE!, About, UPSU.net)
- **Logo**: Click the UPSU logo to return to home
- **Shopping Bag**: Click the shopping bag icon to view your cart
- **Search & Account**: Access search and user account icons

#### Mobile Experience (<800px width)
- **Modal Navbar**: Tap the menu icon (☰) to open bottom sheet navigation
- **Navigation Items**: Tap any item to navigate with Material Design ripple feedback
- **Auto-close**: Modal automatically closes after navigation
- **Placeholders**: "Coming soon!" notifications for unimplemented routes
- **Shopping Bag**: Click the shopping bag icon to view your cart
- **Search & Account**: Access search and user account icons

### Main Features

#### 🏠 Home Page
- **Sale Banner**: Prominent display of current promotions with click-to-navigate
- **Hero Carousel**: Rotating promotional slides featuring:
  - The Print Shack personalization service
  - Sale promotions
  - Graduation collection
  - Student accommodation offers
  - Pagination controls for manual slide navigation
- **Product Grid**: Browse featured products (Rainbow Hoodies, Graduation Hoodies, Classic Cap, Heavyweight Shorts)
- **Product Cards**: Tap any product to view details with dynamic routing

#### 🛍️ Shop / Collections Page
- **Collections Grid**: Browse product categories (Clothing, Accessories, etc.)
- **Dynamic Routing**: Navigate to individual collection pages
- **Responsive Layout**: 4 columns desktop / 2 columns mobile
- **Pagination**: Navigate through collections with Previous/Next buttons

#### 📦 Individual Collection Pages
- **Filtered Products**: View products within specific collections
- **Sorting Options**: Sort by name A-Z, price low-high, or price high-low
- **Filtering**: Filter products by size and price range
- **Pagination**: 4 items per page with page navigation

#### 💰 Sale Page
- **Discounted Products**: Browse all products on sale
- **Price Display**: Original price (struck-through) and sale price shown
- **Product Grid**: 3 columns desktop / 2 columns mobile
- **Direct Navigation**: Tap to view full product details

#### 🛒 Product Page
- **Dynamic Product Data**: Product info passed via route arguments
- **Product Details**: View images, descriptions, pricing, materials, and sizes
- **Add to Cart**: Select size and quantity, add items to shopping cart
- **Size Selection**: Dropdown for available sizes (S, M, L, XL)
- **Quantity Control**: Numeric input for quantity selection

#### 🛍️ Cart Page
- **Shopping Cart**: View all items added to cart with images, titles, sizes, and prices
- **Empty State**: Friendly message with "Continue Shopping" button when cart is empty
- **Quantity Management**: 
  - Increase/decrease item quantities with +/- buttons
  - Minus button disabled when quantity is 1
  - Real-time subtotal updates per item
- **Item Removal**: Delete items with confirmation dialog to prevent accidental removal
- **Cart Summary**:
  - Item count display (e.g., "2 items")
  - Total amount calculation
  - Checkout button (disabled when cart is empty)
- **Checkout Process**: Clear cart and show success notification
- **Responsive Layout**:
  - Desktop: Horizontal item cards with side-by-side layout
  - Mobile: Vertical item cards with stacked layout
- **Navigation**: Access cart via shopping bag icon in header

#### 📄 About Page
- **Company Information**: Learn about the Union Shop mission and values
- **Contact Details**: Find contact information (hello@upsu.net)
- **Service Overview**: Understand personalization, and delivery
- **Consistent Layout**: Header and footer for seamless navigation

#### 🔐 Login/Sign-Up Page
- **Tabbed Interface**: Switch between Login and Sign-Up forms
- **Form Validation**: Email format, password length, and confirmation checks
- **User Feedback**: SnackBar notifications on form submission
- **Responsive Forms**: Adaptive padding for mobile and desktop

### Responsive Breakpoints
- **Desktop**: ≥800px width - Full navigation bar visible, multi-column grids
- **Mobile**: <800px width - Navigation via modal bottom sheet, single/double column grids
- **Consistent Breakpoint**: 800px used throughout app for mobile/desktop differentiation

## 🧪 Running Tests

The project includes comprehensive widget tests covering UI components, navigation, and responsive behavior.

### Run All Tests

```bash
flutter test
```

### Run Specific Test Files

```bash
# Home page tests
flutter test test/home_test.dart

# About page tests
flutter test test/about_test.dart

# Product page tests
flutter test test/product_test.dart

# Cart page tests
flutter test test/cart_page_test.dart
```

### Test Coverage

The test suite includes:
- **Home Page Tests**:
  - Basic UI elements display
  - Product card rendering
  - Header icons functionality
  - Navigation bar behavior
  - Mobile responsiveness

- **About Page Tests**:
  - Page navigation
  - Content display
  - Header functionality
  - Mobile responsiveness

- **Cart Page Tests**:
  - Empty cart state display and navigation
  - Cart with items display (titles, sizes, prices, images)
  - Quantity controls (increase/decrease, button states)
  - Item removal with confirmation dialog
  - Cart summary and checkout functionality
  - Responsive layout (desktop/mobile)

- **Header Widget Tests**:
  - Banner and logo display
  - Navigation buttons visibility (desktop/mobile)
  - Menu button conditional rendering
  - Cart icon navigation
  - Modal bottom sheet functionality
  - Icon buttons and styling

- **Mobile Navbar Widget Tests**:
  - Navigation items rendering with icons
  - Placeholder SnackBar behavior
  - Navigation functionality and modal closure
  - WorkSans font styling verification

- **Product, Sale, Login Page Tests**:
  - Dynamic product data rendering
  - Form validation
  - Responsive layouts

## 🏗️ Project Structure

```
union_shop/
├── lib/
│   ├── main.dart              # App entry point and home screen
│   ├── about_page.dart        # About page implementation
│   ├── product_page.dart      # Product details page
│   ├── cart_page.dart         # Shopping cart page
│   ├── collections.dart       # Collections/categories page
│   ├── collection_page.dart   # Individual collection view
│   ├── sale_page.dart         # Sale products page
│   ├── login_page.dart        # Login/sign-up page
│   ├── models/
│   │   ├── product.dart       # Product data model
│   │   ├── collection.dart    # Collection data model
│   │   ├── cart.dart          # Shopping cart state management
│   │   └── cart_item.dart     # Cart item data model
│   ├── data/
│   │   ├── products.dart      # Product data source
│   │   └── collections.dart   # Collections data source
│   └── widgets/
│       ├── header_widget.dart        # Reusable header component
│       ├── footer_widget.dart        # Reusable footer component
│       └── mobile_navbar_widget.dart # Mobile navigation modal
├── test/
│   ├── home_test.dart         # Home page widget tests
│   ├── about_test.dart        # About page widget tests
│   ├── product_test.dart      # Product page widget tests
│   ├── cart_page_test.dart    # Cart page widget tests
│   ├── sale_page_test.dart    # Sale page widget tests
│   ├── login_page_test.dart   # Login page widget tests
│   ├── models/                # Model tests
│   └── widgets/
│       ├── header_test.dart           # Header widget tests
│       └── mobile_navbar_widget_test.dart # Mobile navbar tests
├── assets/
│   ├── fonts/                 # WorkSans font files
│   └── images/                # Product images
├── android/                   # Android platform code
├── ios/                       # iOS platform code
├── web/                       # Web platform code
├── pubspec.yaml               # Flutter dependencies and configuration
├── prompt.md                  # Development prompts and specifications
├── requirements.md            # Feature requirements documents
└── README.md                  # This file
```

## 🎨 Customization

### Assets
The app uses local asset images for products and hero sections. Assets are configured in `pubspec.yaml`:
```yaml
flutter:
  assets:
    - assets/images/
```


### Fonts
The app uses the WorkSans variable font family. Font files are located in `assets/fonts/`:
- `WorkSans-VariableFont_wght.ttf` (regular)
- `WorkSans-Italic-VariableFont_wght.ttf` (italic)

### Colors
- **Primary**: `#4d2963` (University purple)
- **Accent**: Red for sale items
- **Background**: White and light gray

### Responsive Design
- **Consistent Breakpoint**: 800px throughout entire app
  - Navigation: Desktop navbar vs mobile modal
  - Grids: Multi-column desktop vs reduced columns mobile
  - Layouts: Desktop padding (32px) vs mobile padding (16px)
- **Grid Configurations**:
  - Home: 2 columns (desktop) / 1 column (mobile)
  - Collections: 4 columns (desktop) / 2 columns (mobile)
  - Collection Pages: 3 columns (desktop) / 2 columns (mobile)
  - Sale: 3 columns (desktop) / 2 columns (mobile)

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request


---

**Built with ❤️ using Flutter**