import 'package:dev_post/src/core/dimensions/adaptive_widget.dart';
import 'package:dev_post/src/core/theme/app_theme.dart';
import 'package:dev_post/src/features/homepage/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';

class DevPostApp extends StatelessWidget {
  const DevPostApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdaptiveWidget(
      builder: (context, orientation) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme(),
          home: HomePage(),
        );
      },
    );
  }
}
