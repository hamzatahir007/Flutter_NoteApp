Flutter NoteApp

A clean and intuitive note-taking application built with Flutter. Notes are locally stored using SQLite via sqflite, offering a seamless experience to add, edit, and manage notes right on your device.

Features

CRUD functionality – Create, view, edit, and delete notes.

Color-coded notes – Choose from a palette of customizable colors for visual organization.

Responsive layout – Adaptive for both mobile and tablet form factors.

Local persistence – Notes are stored locally using SQLite (sqflite), ensuring reliability and offline support.

Date formatting – Each note displays the creation date in a human-friendly format via intl.


Demo

Add a screenshot or short animated GIF here to showcase the app’s UI and UX.


Tech Stack
| Layer         | Technology                      |
| ------------- | ------------------------------- |
| UI            | Flutter, Material Design        |
| Database      | SQLite via `sqflite`            |
| Date Handling | `intl` for formatting dates     |
| Architecture  | Clean, modular widget structure |


Getting Started

Ready to try it? Follow these steps:

Prerequisites

Flutter SDK installed

A connected device or emulator ready

Setup
git clone https://github.com/hamzatahir007/Flutter_NoteApp.git
cd Flutter_NoteApp
flutter pub get
flutter run


Project Structure
lib/
├── main.dart           // App entry point
├── screens/
│   └── note_screen.dart
│   └── note_dialog.dart
└── database/
    └── notes_database.dart
main.dart – Sets up MaterialApp and root screen.

note_screen.dart – Displays list of notes and handles navigation.

note_dialog.dart – Dialog widget for adding or editing notes, with color selection.

notes_database.dart – Handles database initialization and CRUD operations with SQLite.


Future Enhancements

Note deletion and editing – Implement full edit/delete flows.

Search & Filtering – Quickly find notes by content or color.

Tagging / Categories – Organize your notes more effectively.

Dark Mode – Support theme switching for a modern look.

Cloud Sync / Backup – Optionally integrate Firebase or other backends later.

Best Practices

This app follows modern Flutter guidelines, including:

Use of const constructors to reduce unnecessary rebuilds.

Compact and reusable widgets for maintainable UI code.

Separation of concerns: UI, dialog logic, and database operations are neatly organized.

Clear naming conventions and directory structure for scalability.

Contribution

Contributions are welcome! If you'd like to contribute:

Fork the repository


<img width="1080" height="2400" alt="Screenshot_1756578182" src="https://github.com/user-attachments/assets/8a3d84b6-0866-4dce-ab78-8383e2d3f962" />
<img width="1080" height="2400" alt="Screenshot_1756578175" src="https://github.com/user-attachments/assets/fe5fed05-0bd7-424e-86a8-d696bf635a84" />
<img width="1080" height="2400" alt="Screenshot_1756578148" src="https://github.com/user-attachments/assets/8b7869b9-38b9-4df8-b087-9ff56c519a77" />
<img width="1080" height="2400" alt="Screenshot_1756578137" src="https://github.com/user-attachments/assets/b5e8753f-d91f-451a-9951-e59fd46f8b80" />

Create a feature branch (git checkout -b feature/my-feature)

Commit your changes (git commit -m "Add feature")

Push to your branch (git push origin feature/my-feature)

Open a pull request
