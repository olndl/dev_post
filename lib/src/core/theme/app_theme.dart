import 'package:dev_post/gen/fonts.gen.dart';
import 'package:dev_post/src/core/theme/colors_guide.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static const _defaultFontFamily = FontFamily.ubuntuRegular;

  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      fontFamily: _defaultFontFamily,
      colorScheme: ColorScheme.fromSwatch()
          .copyWith(secondary: ColorsGuide.backgroundColor),
    );
  }
}
