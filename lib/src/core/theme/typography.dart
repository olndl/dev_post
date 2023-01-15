import 'package:dev_post/gen/fonts.gen.dart';
import 'package:dev_post/src/core/theme/colors_guide.dart';
import 'package:flutter/material.dart';

abstract class TextStyles {
  static TextStyle title = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: ColorsGuide.titleColor,
    fontFamily: FontFamily.ubuntuRegular,
  );
  static TextStyle body = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: ColorsGuide.titleColor,
    fontFamily: FontFamily.ubuntuRegular,
  );
  static TextStyle smallBody = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: ColorsGuide.labelColor,
    fontFamily: FontFamily.ubuntuRegular,
  );
}
