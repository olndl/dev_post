import 'package:dev_post/src/core/usecases/usecase.dart';
import 'package:dev_post/src/features/homepage/data/data_module.dart';
import 'package:dev_post/src/features/homepage/domain/usecases/get_post_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getPostsUseCaseProvider = Provider<UseCase>(
  (ref) => GetPostsUseCaseImpl(ref.watch(postsRepositoryProvider)),
);
