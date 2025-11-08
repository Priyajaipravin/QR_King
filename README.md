# 👑 QR King

<div align="center">

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-green.svg?style=for-the-badge)

**Your Ultimate QR Code Companion** 📱

*Generate, Scan, and Manage QR Codes with Ease*

[Features](#-features) • [Installation](#-installation) • [Usage](#-usage) • [Screenshots](#-screenshots) • [Contributing](#-contributing)

</div>

---

## 📖 About

**QR King** is a powerful, cross-platform Flutter application that brings comprehensive QR code functionality to your fingertips. Whether you need to generate custom QR codes for your business, scan codes on the go, or manage your QR code history, QR King has you covered.

Built with Flutter, QR King delivers native performance on both iOS and Android while maintaining a beautiful, intuitive user interface that makes QR code management effortless.

## ✨ Features

### 🎨 QR Code Generation
- **Multiple Data Types Support**
  - Plain Text
  - URLs & Web Links
  - Contact Information (vCard)
  - WiFi Credentials
  - Email Addresses
  - Phone Numbers
  - SMS Messages
  - Geographic Locations

- **Customization Options**
  - Custom foreground and background colors
  - Adjustable QR code size
  - Multiple error correction levels (L, M, Q, H)
  - Logo embedding support
  - High-resolution output

### 📸 Advanced Scanner
- Real-time QR code detection
- Fast and accurate scanning
- Auto-focus and flash support
- Works in various lighting conditions
- Intelligent content recognition
- Contextual action suggestions

### 📚 History Management
- Complete history of generated QR codes
- Scan history tracking
- Search and filter functionality
- Easy access to previously created codes
- Delete individual or bulk entries

### 💾 Export & Share
- Save QR codes to gallery
- Share via multiple platforms
- Export in various image formats
- Batch export capabilities

### 🎯 Additional Features
- Clean, Material Design interface
- Dark mode support
- Offline functionality
- No ads or subscriptions
- Privacy-focused (all data stored locally)
- Cross-platform compatibility

## 🚀 Installation

### Prerequisites
- Flutter SDK (>=3.0.0)
- Dart SDK (>=3.0.0)
- Android Studio / VS Code with Flutter extensions
- iOS: Xcode (for iOS development)
- Android: Android SDK

### Setup Instructions

1. **Clone the repository**
   ```bash
   git clone https://github.com/Priyajaipravin/QR_King.git
   cd QR_King
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   # For Android
   flutter run

   # For iOS
   flutter run -d ios

   # For a specific device
   flutter devices
   flutter run -d <device_id>
   ```

4. **Build for release**
   ```bash
   # Android APK
   flutter build apk --release

   # Android App Bundle
   flutter build appbundle --release

   # iOS
   flutter build ios --release
   ```

## 📱 Usage

### Generating QR Codes

1. Open the app and tap on the **Generate** tab
2. Select the type of data you want to encode
3. Enter your data (URL, text, contact info, etc.)
4. Customize colors and settings (optional)
5. Tap **Generate** to create your QR code
6. Save to gallery or share directly

### Scanning QR Codes

1. Tap on the **Scan** tab
2. Point your camera at the QR code
3. The app will automatically detect and decode it
4. Preview the content before taking action
5. Choose from contextual actions (open URL, save contact, etc.)

### Managing History

1. Navigate to the **History** tab
2. View all previously generated and scanned codes
3. Tap any item to view details or take actions
4. Swipe to delete individual entries
5. Use search to find specific codes quickly

## 🛠️ Tech Stack

- **Framework**: Flutter
- **Language**: Dart
- **State Management**: Provider / Riverpod / Bloc (specify your choice)
- **Local Storage**: Sqflite / Hive
- **QR Generation**: qr_flutter
- **QR Scanning**: mobile_scanner / qr_code_scanner
- **File Handling**: path_provider
- **Sharing**: share_plus
- **UI Components**: Material Design

## 📂 Project Structure

```
lib/
├── models/              # Data models and entities
│   ├── qr_code_model.dart
│   └── history_model.dart
├── screens/             # Application screens
│   ├── home_screen.dart
│   ├── generate_screen.dart
│   ├── scan_screen.dart
│   └── history_screen.dart
├── widgets/             # Reusable UI components
│   ├── qr_code_widget.dart
│   ├── custom_button.dart
│   └── history_card.dart
├── services/            # Business logic and services
│   ├── qr_generator_service.dart
│   ├── scanner_service.dart
│   └── database_service.dart
├── utils/               # Helper functions and constants
│   ├── constants.dart
│   └── helpers.dart
├── providers/           # State management
│   └── qr_provider.dart
└── main.dart           # Application entry point
```

## 🎨 Screenshots

<!-- Add your app screenshots here -->
| Home | Generate | Scan | History |
|------|----------|------|---------|
| ![Home](screenshots/home.png) | ![Generate](screenshots/generate.png) | ![Scan](screenshots/scan.png) | ![History](screenshots/history.png) |

## 🔐 Permissions

### Android (`android/app/src/main/AndroidManifest.xml`)
```xml
<uses-permission android:name="android.permission.CAMERA" />
<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" />
<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE" />
<uses-permission android:name="android.permission.INTERNET" />
```

### iOS (`ios/Runner/Info.plist`)
```xml
<key>NSCameraUsageDescription</key>
<string>Camera access is required to scan QR codes</string>
<key>NSPhotoLibraryAddUsageDescription</key>
<string>Photo library access is required to save QR codes</string>
```

## 🧪 Testing

Run the test suite:

```bash
# Run all tests
flutter test

# Run with coverage
flutter test --coverage

# Run integration tests
flutter drive --target=test_driver/app.dart
```

## 🤝 Contributing

Contributions are welcome! Please follow these steps:

1. **Fork the repository**
2. **Create a feature branch**
   ```bash
   git checkout -b feature/AmazingFeature
   ```
3. **Commit your changes**
   ```bash
   git commit -m 'Add some AmazingFeature'
   ```
4. **Push to the branch**
   ```bash
   git push origin feature/AmazingFeature
   ```
5. **Open a Pull Request**

### Contribution Guidelines

- Follow the existing code style
- Write clear commit messages
- Add tests for new features
- Update documentation as needed
- Ensure all tests pass before submitting PR

## 🐛 Bug Reports & Feature Requests

Found a bug or have a feature suggestion? Please [open an issue](https://github.com/Priyajaipravin/QR_King/issues) with:

- Clear description of the issue/feature
- Steps to reproduce (for bugs)
- Expected vs actual behavior
- Screenshots (if applicable)
- Device and OS information

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👥 Author

**Priya Jai Pravin**

- GitHub: [@Priyajaipravin](https://github.com/Priyajaipravin)
- Project Link: [https://github.com/Priyajaipravin/QR_King](https://github.com/Priyajaipravin/QR_King)

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- QR code libraries and their maintainers
- Material Design for UI/UX guidelines
- Open source community for continuous inspiration

## 📊 Project Status

![GitHub stars](https://img.shields.io/github/stars/Priyajaipravin/QR_King?style=social)
![GitHub forks](https://img.shields.io/github/forks/Priyajaipravin/QR_King?style=social)
![GitHub issues](https://img.shields.io/github/issues/Priyajaipravin/QR_King)
![GitHub pull requests](https://img.shields.io/github/issues-pr/Priyajaipravin/QR_King)

## 🔮 Roadmap

- [ ] Cloud sync for history across devices
- [ ] Batch QR code generation from CSV
- [ ] Advanced analytics dashboard
- [ ] Widget support for quick access
- [ ] Multi-language support
- [ ] AR-based scanning mode
- [ ] Dynamic QR code support
- [ ] NFC integration

## 💬 Support

If you like this project, please give it a ⭐️ and share it with others!

For support or questions, please open an issue or contact through GitHub.

---

<div align="center">

**Made with ❤️ using Flutter**

*If this project helped you, consider giving it a star!* ⭐️

</div>
