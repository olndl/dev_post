import 'package:dev_post/src/core/navigation/model.dart';
import 'package:dev_post/src/core/navigation/provider.dart';
import 'package:dev_post/src/features/presentation/details/presentation/pages/details_page.dart';
import 'package:dev_post/src/features/presentation/homepage/presentation/pages/home_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostRouterDelegate extends RouterDelegate<TypedPath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<TypedPath> {
  PostRouterDelegate(this.ref, this.homePath) {
    final unListen =
        ref.listen(navigationStackProvider, (_, __) => notifyListeners());
    ref.onDispose(unListen);
  }

  final Ref ref;
  final TypedPath homePath;

  @override
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  TypedPath get currentConfiguration => ref.read(navigationStackProvider);

  @override
  Widget build(BuildContext context) {
    final navigationStack = currentConfiguration;
    if (navigationStack.isEmpty) return const SizedBox();

    Widget screenBuilder(TypedSegment segment) {
      if (segment is ListPostSegment) return HomePage();
      if (segment is PostDetailsSegment) {
        return DetailsPage(
          tappedPost: segment.post,
        );
      }
      throw UnimplementedError();
    }

    return Navigator(
      key: navigatorKey,
      pages: navigationStack
          .map(
            (segment) => MaterialPage(
              key: ValueKey(segment.toString()),
              child: screenBuilder(segment),
            ),
          )
          .toList(),
      onPopPage: (route, result) {
        if (!route.didPop(result)) return false;
        final notifier = ref.read(navigationStackProvider.notifier);
        if (notifier.state.length <= 1) return false;
        notifier.state = [
          for (var i = 0; i < notifier.state.length - 1; i++) notifier.state[i]
        ];
        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(TypedPath configuration) {
    if (configuration.isEmpty) configuration = homePath;
    navigate(configuration);
    return SynchronousFuture(null);
  }

  void navigate(TypedPath newPath) =>
      ref.read(navigationStackProvider.notifier).state = newPath;

  void pop([Object? result]) => navigatorKey.currentState?.pop(result);
}
