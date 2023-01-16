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

## Screenshots
<img src="https://github.com/olndl/dev_post/blob/dev/screenshots/first_screen.png" width="350"/>
<img src="https://github.com/olndl/dev_post/blob/dev/screenshots/second_screen.png" width="350/>


## Video
<h1><img src="https://github.com/olndl/dev_post/blob/dev/screenshots/screen.gif"/></h1>

## Packages Used

- `flutter_riverpod` for state management.
- `dio` to work with Http client.
- `freezed` - code generator for data-classes
- `sqflite` and `path_provider` to support local storage.
- `linter` - for code rules.
- more at `pubspec.yaml`
