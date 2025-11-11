# Union Shop 🛍️

A modern, responsive Flutter e-commerce application for the University of Portsmouth Students' Union Shop, featuring university-branded merchandise and personalized products.

## 📋 Overview

Union Shop is a cross-platform mobile and web application built with Flutter that showcases and sells University of Portsmouth branded products. The app provides an intuitive shopping experience with responsive design, custom typography, and comprehensive product catalog featuring clothing, accessories, and personalized items.

## ✨ Key Features

### 🏪 Core Functionality
- **Product Catalog**: Browse university-branded clothing and merchandise
- **Product Details**: View detailed product information and pricing
- **Personalization Service**: Custom text personalization starting from £3
- **Responsive Design**: Optimized for both desktop and mobile devices

### 🎨 Design & UX
- **Custom Typography**: WorkSans variable font family for modern, clean aesthetics
- **Responsive Navigation**:
  - Desktop: Horizontal navigation bar with menu buttons
  - Mobile: Collapsible drawer navigation for space efficiency
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

#### Desktop Experience (>800px width)
- **Header Navigation**: Click navigation buttons (Home, Shop, The Print Shack, SALE!, About, UPSU.net)
- **Logo**: Click the UPSU logo to return to home
- **Search & Account**: Access search, user account, and shopping bag icons

#### Mobile Experience (<800px width)
- **Drawer Menu**: Tap the menu icon (☰) to open navigation drawer
- **Drawer Items**: Tap any menu item to navigate
- **Auto-close**: Drawer automatically closes after navigation

### Main Features

#### 🏠 Home Page
- **Sale Banner**: Prominent display of current promotions
- **Hero Section**: "The Print Shack" personalization service promotion
- **Product Grid**: Browse featured products (Rainbow Hoodies, Graduation Hoodies, Classic Cap, Heavyweight Shorts)
- **Product Cards**: Tap any product to view details

#### 📄 About Page
- **Company Information**: Learn about the Union Shop mission
- **Contact Details**: Find contact information (hello@upsu.net)
- **Service Overview**: Understand personalization and delivery options

#### 🛒 Product Page
- **Product Details**: View product images, descriptions, and pricing
- **Navigation**: Consistent header and responsive design
- **Future Features**: Placeholder for size/color selection, cart, and checkout

### Responsive Breakpoints
- **Desktop**: >800px width - Full navigation bar visible
- **Mobile**: <800px width - Navigation collapses to drawer
- **Tablet**: 600-800px width - Single column product grid

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
```

### Test Coverage

The test suite includes:
- **Home Page Tests** (7 tests):
  - Basic UI elements display
  - Product card rendering
  - Header icons functionality
  - Navigation bar behavior
  - Mobile responsiveness (buttons hidden, drawer functionality)

- **About Page Tests** (8 tests):
  - Page navigation
  - Content display
  - Header functionality
  - Mobile responsiveness

- **Product Page Tests** (3 tests):
  - Basic product information display
  - UI component verification

### Test Results
- ✅ **Home Tests**: 7/7 passing
- ✅ **About Tests**: 8/8 passing
- ⚠️ **Product Tests**: 3/3 failing (expected content differs from implementation)

## 🏗️ Project Structure

```
union_shop/
├── lib/
│   ├── main.dart              # App entry point and home screen
│   ├── about_page.dart        # About page implementation
│   ├── product_page.dart      # Product details page
│   └── widgets/
│       └── product_card.dart  # Reusable product card component
├── test/
│   ├── home_test.dart         # Home page widget tests
│   ├── about_test.dart        # About page widget tests
│   └── product_test.dart      # Product page widget tests
├── assets/
│   ├── fonts/                 # WorkSans font files
│   └── images/                # Product images
├── android/                   # Android platform code
├── ios/                       # iOS platform code
├── web/                       # Web platform code
├── pubspec.yaml               # Flutter dependencies and configuration
└── README.md                  # This file
```

## 🎨 Customization

### Fonts
The app uses the WorkSans variable font family. Font files are located in `assets/fonts/`:
- `WorkSans-VariableFont_wght.ttf` (regular)
- `WorkSans-Italic-VariableFont_wght.ttf` (italic)

### Colors
- **Primary**: `#4d2963` (University purple)
- **Accent**: Red for sale items
- **Background**: White and light gray

### Responsive Design
- **Breakpoint**: 800px (desktop vs mobile navigation)
- **Grid**: 600px (1 vs 2 column product layout)

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request


---

**Built with ❤️ using Flutter**