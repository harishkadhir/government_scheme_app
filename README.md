
# Government Scheme App

The Government Scheme App is a Flutter-based mobile application designed to help administrators manage and display various government schemes. The app provides a user-friendly interface that allows secure admin login, scheme management, and real-time data display using Firebase Firestore. It’s optimized for both Android and iOS devices.

## Features

- **Admin Login**: Secure login access for administrators to manage and update schemes.
- **Add Scheme**: Admins can add new schemes with details, including:
  - **Scheme Name**
  - **Published Date**
  - **Start and End Dates**
  - **Registration Link**
  - **Description**
  - **Requirements**
- **Scheme List**: A dynamic list that updates in real-time with all added schemes.
- **Scheme Details**: Detailed view of each scheme, including an option to open the registration link in the default browser.
- **Responsive Design**: Ensures seamless user experience across Android and iOS devices.

## Technologies Used

- **Flutter**: A framework for building cross-platform mobile applications from a single codebase.
- **Firebase Firestore**: A NoSQL cloud database used for storing and managing scheme data.
- **URL Launcher**: Flutter package to open URLs in the default browser.
- **Flutter Toast**: For brief feedback and notifications to users.

## Getting Started

### Prerequisites

- **Flutter**: Make sure Flutter is installed on your machine. [Installation Guide](https://flutter.dev/docs/get-started/install).
- **Firebase Project**: Set up Firebase and configure Firestore for this project.

### Setup Instructions

1. **Clone this repository**:
   ```bash
   git clone https://github.com/harishkadhir/government_scheme_app.git
   cd government_scheme_app
   ```

2. **Install dependencies**:
   ```bash
   flutter pub get
   ```

3. **Configure Firebase**:
   - Go to the Firebase Console, create a new project, and add an Android/iOS app.
   - Download the `google-services.json` file for Android and place it in the `android/app` directory.
   - Use the `flutterfire configure` command to generate the `firebase_options.dart` file with your project configurations.

4. **Run the app**:
   ```bash
   flutter run
   ```

## Folder Structure

The project is organized as follows:

```plaintext
government_scheme_app/
├── android/
├── assets/
│   └── icon/
│       └── hkkk.jpg          # Placeholder for app icon or logo
├── ios/
├── lib/
│   ├── add_scheme.dart       # Page for adding new schemes
│   ├── admin_login.dart      # Admin login page
│   ├── main.dart             # Main entry point of the app
│   ├── scheme_detail.dart    # Detailed view of each scheme
│   └── scheme_list.dart      # List of all available schemes
├── pubspec.yaml              # Project dependencies
└── README.md                 # Project documentation
```

## Usage

1. Launch the app on your device or emulator.
2. **Admin Login**: Use the "Admin Login" feature to log in as an admin (e.g., with the code "batmanhk").
3. Once logged in, you can:
   - Add new schemes by filling out the details in the **Add Scheme** form.
   - View all schemes in the **Scheme List** page.
4. Tap on any scheme to view detailed information and access the registration link.

## Firebase Firestore Security Rules

For secure access, configure Firestore security rules to limit write access to authenticated admin users:

```javascript
service cloud.firestore {
  match /databases/{database}/documents {
    match /schemes/{schemeId} {
      allow read: if true; // Public read access
      allow write: if request.auth != null && request.auth.uid == 'adminUID';
    }
  }
}
```

Replace `'adminUID'` with the UID of your admin user if using Firebase Authentication.

## Dependencies

In `pubspec.yaml`, include the following dependencies:

```yaml
dependencies:
  flutter:
    sdk: flutter
  firebase_core: latest_version
  cloud_firestore: latest_version
  url_launcher: latest_version
  fluttertoast: latest_version
```

Run `flutter pub get` to install these dependencies.


## Screenshort 
![5](https://github.com/user-attachments/assets/7eb76fcf-ad28-49b6-a5fa-ba395693fd1e) ![1](https://github.com/user-attachments/assets/c3347ca6-1ed6-4ac0-8a13-022877bf7bd0)
![4](https://github.com/user-attachments/assets/a412a6f5-beac-439a-81b9-f208e8e3a499) ![3](https://github.com/user-attachments/assets/c26b4835-6ebb-4732-b7a7-182577f0f9fb)
![2](https://github.com/user-attachments/assets/089c1f64-77a2-4222-b32b-3534dd11859b)










