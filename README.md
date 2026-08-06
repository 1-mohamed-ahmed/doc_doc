#  DocDoc - Medical Appointment Booking App

DocDoc is a modern medical services and appointment booking application built with Flutter. The app follows **Clean Architecture** principles and uses **BLoC/Cubit** for state management.

---

##  Features

-  **Authentication**: Sign Up, Login, and secure session management.
-  **Doctors & Services**: Browse medical categories, top doctors, and book appointments.
-  **Multi-language Support**: Seamless localization (English) with stored user language preferences.
-  **Modern UI/UX**: Designed using `flutter_screenutil` for fully responsive screens across various device sizes.


---

##  Tech Stack & Architecture

- **Framework**: [Flutter](https://flutter.dev/) (Dart)
- **Architecture**: Clean Architecture (Data, Domain, Presentation layers)
- **State Management**: Flutter BLoC / Cubit
- **Dependency Injection**: GetIt
- **Networking**: Dio + Retrofit
- **Local Storage**: SharedPreferences 
- **Code Generation**: Freezed, JsonSerializable




---

##  Getting Started

### Prerequisites
- **Flutter SDK**: 3.44.2
- **IDE**: VS Code 
- **Version Control**: Git

---

##  Author

**Eng/ Mohamed Ahmed**
- GitHub: [1-mohamed-ahmed](https://github.com/1-mohamed-ahmed/doc_doc)

---

##  Project Structure

```text
lib/
├── core/
│   ├── api/            # Base API client & endpoints
│   ├── cache/          # Local storage & SharedPreferences helpers
│   ├── di/             # Dependency injection setup (GetIt)
│   ├── errors/         # Custom failure handling & error models
│   ├── networking/     # Dio instance & API result wrappers
│   ├── routing/        # App Router & Navigation routes
│   └── theming/        # App colors, styles, and language models
└── features/
    ├── auth/           # Login, Signup logic & widgets
    ├── home/           # Dashboard, Doctors list & categories
    ├── profileScreens/ # User profile settings
    └── settingScreens/ # App settings & Language selector







