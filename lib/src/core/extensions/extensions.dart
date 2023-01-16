import 'package:dev_post/src/core/dimensions/dimension.dart';

extension Dim on num {
  double get percentOfHeight => this * Dimension.height / 100;
  double get percentOfWidth => this * Dimension.width / 100;
}

extension UrlValidator on String {
  bool isCorrectUrl() {
    return RegExp(
      r'(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w\.-]*)*\/?',
    ).hasMatch(this);
  }
}
