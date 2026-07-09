# Safety Kit SA

A Flutter app that puts South African emergency numbers (Police, Ambulance, Fire Brigade, Emergency, Lifeline, and more) one tap away, plus a place to store your own personal emergency contacts.

## Features

- One-tap dialing to national emergency services via `flutter_phone_direct_caller`
- Add and manage personal emergency contacts
- Search for a contact or service quickly
- Local persistence with `get_storage`

## Tech stack

- **Flutter** with **GetX** for state management, routing, and dependency injection
- `flutter_svg` for icons, `curved_navigation_bar` for navigation

## Project layout

```
lib/
  controllers/    # GetX controllers
  data/model/     # Contact and user models
  views/          # Home, profile, and search screens
  widgets/         # Emergency numbers and contacts widgets
```

## Getting started

```bash
flutter pub get
flutter run
```
