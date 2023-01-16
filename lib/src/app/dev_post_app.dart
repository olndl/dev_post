import 'package:dev_post/src/core/dimensions/adaptive_widget.dart';
import 'package:dev_post/src/core/navigation/parser.dart';
import 'package:dev_post/src/core/navigation/provider.dart';
import 'package:dev_post/src/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DevPostApp extends ConsumerWidget {
  const DevPostApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AdaptiveWidget(
      builder: (context, orientation) {
        return MaterialApp.router(
          routerDelegate: ref.read(routerDelegateProvider),
          routeInformationParser: RouteInformationParserImpl(),
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme.copyWith(
            pageTransitionsTheme: const PageTransitionsTheme(
              builders: {
                TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
                TargetPlatform.iOS: OpenUpwardsPageTransitionsBuilder(),
              },
            ),
          ),
        );
      },
    );
  }
}
