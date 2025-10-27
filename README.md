# Department App (Flutter)

**Contributors:**  
- Bahar Demirkan 29150082018 
- Emine Nur Güçlü 15925515430
- Emirhan Temiz 

---

## Setup Instructions

### 1. Clone the repository
```bash
git clone https://github.com/bahardemirkan/department_app.git
cd department_app_flutter_v2
```

### 2. Install dependencies
```bash
flutter pub get
```

### 3. Run the app
```bash
flutter run
```

---

## Overview

This Flutter project is a cross-platform mobile and desktop application designed to showcase the structure and functionality of a university department.  
It includes pages for login, faculty members, classrooms, courses, and about the department, following the requirements of a mobile programming assignment.

The app allows users to:
- Log in or sign up with basic credential validation.
- View academic staff and call them directly.
- Explore classrooms with zoomable photos loaded from the internet.
- Learn about department infrastructure, courses, and general information.

It’s developed entirely using Flutter and Dart, leveraging Material Design, local storage, and device capabilities such as the phone dialer.

---

## Features

### Login & Registration
- Simple authentication interface.
- Success and failure dialogs for feedback.
- Local data persistence for saved credentials (using `shared_preferences`).

### People (Instructors)
- Displays a list of instructors with:
  - Name, title, phone number, and photo.
- Includes a Call button that:
  - Opens a confirmation dialog.
  - Launches the phone’s dialer if the user agrees.
  - Works on Android/iOS via `url_launcher`.

### Infrastructure
- Lists classrooms (Classroom-B1 to Classroom-B7).
- Each classroom is shown as a card with its name.
- When double-tapped, a new page opens showing the full-sized classroom image from the internet.

### Courses & About
- Separate sections for:
  - Department’s offered courses.
  - General information about the department.
- Clean navigation between pages via bottom navigation bar.

### Design
- Uses Google Fonts (`Poppins`, `Roboto`) for a polished, modern UI.
- Responsive layouts for mobile and desktop.
- Subtle card shadows, rounded corners, and consistent color palette.

---

## Project Structure

```
lib/
├── main.dart                      # App entry and navigation
├── pages/
│   ├── login_page.dart            # Login & registration
│   ├── people_page.dart           # Instructor list + dialer integration
│   ├── infrastructure_page.dart   # Classroom gallery
│   ├── about_page.dart            # Department info
│   ├── courses_page.dart          # Courses list
│   └── image_viewer_page.dart     # Full-screen classroom image view
```

---

## Dependencies

Listed in `pubspec.yaml`:

```yaml
dependencies:
  flutter:
    sdk: flutter
  shared_preferences: ^2.3.2
  url_launcher: ^6.3.0
  google_fonts: ^6.2.1
```

---

## Permissions

For Android, make sure the following permission is added in:

**`android/app/src/main/AndroidManifest.xml`**
```xml
<uses-permission android:name="android.permission.CALL_PHONE" />
```

---

## Authors

- Bahar Demirkan — 29150082018  
- Emine Nur Güçlü  

---

## License

This project is open source and available under the MIT License.
