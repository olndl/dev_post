import 'package:dev_post/src/core/usecases/usecase.dart';
import 'package:dev_post/src/features/data/data_module.dart';
import 'package:dev_post/src/features/domain/usecases/get_posts_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getPostsUseCaseProvider = Provider<UseCase>(
  (ref) => GetPostsUseCaseImpl(ref.watch(postsRepositoryProvider)),
);
