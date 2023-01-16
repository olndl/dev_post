import 'package:dev_post/src/core/navigation/delegate.dart';
import 'package:dev_post/src/core/navigation/model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final routerDelegateProvider = Provider<PostRouterDelegate>(
  (ref) => PostRouterDelegate(ref, [ListPostSegment()]),
);

final navigationStackProvider =
    StateProvider<TypedPath>((_) => [ListPostSegment()]);
