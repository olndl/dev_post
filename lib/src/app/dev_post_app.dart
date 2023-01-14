import 'package:dev_post/src/core/dimensions/adaptive_widget.dart';
import 'package:flutter/material.dart';

class DevPostApp extends StatelessWidget {
  const DevPostApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdaptiveWidget(
      builder: (context, orientation) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Container(),
        );
      },
    );
  }
}
