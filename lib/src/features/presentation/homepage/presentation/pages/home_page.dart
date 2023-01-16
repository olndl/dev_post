import 'package:dev_post/src/core/screens/error_screen.dart';
import 'package:dev_post/src/core/screens/loading_screen.dart';
import 'package:dev_post/src/core/screens/unknown_screen.dart';
import 'package:dev_post/src/core/theme/colors_guide.dart';
import 'package:dev_post/src/features/presentation/homepage/presentation/components/home_page_body.dart';
import 'package:dev_post/src/features/presentation/homepage/presentation/providers/post_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  HomePage({Key? key}) : super(key: key);

  final _postsListProvider = postListStateNotifierProvider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: ColorsGuide.backgroundColor,
      body: ref.watch(_postsListProvider).maybeWhen(
            success: (content) {
              return HomePageBody(
                postList: content,
              );
            },
            error: (e) => ErrorScreen(
              message: '$e',
            ),
            loading: () => const LoadingScreen(),
            orElse: () => const UnknownScreen(),
          ),
    );
  }
}
