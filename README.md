# FlutterDevPost App
Flutter app that fetches posts about flutter development from reddit
api link ->  [https://www.reddit.com/r/flutterdev/new.json](https://www.reddit.com/r/flutterdev/new.json).
## Features
#### Basic
- [x] Screens: post list, post detals screen
- [x] Work with backend is implemented, data is received from the server
- [X] State-management and DI implemented using `flutter_riverpod`
- [x] App icon added
- [X] Implemented Navigation
- [x] Organized saving data to disk using a SQFLite
- [X] Offline-first mood


## Video
<img src="https://github.com/olndl/dev_post/blob/dev/screenshots/screen.gif" width="200" height="400"/>

## Screenshots
<p float="left">
<img src="https://github.com/olndl/dev_post/blob/dev/screenshots/first_screen.png" width="200" height="400"/>
<img src="https://github.com/olndl/dev_post/blob/dev/screenshots/second_screen.png" width="200" height="400"/>
</p>

## Get Started
Generate file *.g.dart and *.freezed.dart, you can use this command on terminal :

`flutter pub run build_runner build --delete-conflicting-outputs`

## Packages Used

- `flutter_riverpod` for state management.
- `dio` to work with Http client.
- `freezed` - code generator for data-classes
- `sqflite` and `path_provider` to support local storage.
- `linter` - for code rules.
- more at `pubspec.yaml`
