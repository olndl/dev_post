import 'package:dev_post/src/core/api/dio_consumer.dart';
import 'package:dev_post/src/features/homepage/data/datasource/remote_database/post_datasource.dart';
import 'package:dev_post/src/features/homepage/data/datasource/remote_database/post_datasource_impl.dart';
import 'package:dev_post/src/features/homepage/data/repositories/post_repository_impl.dart';
import 'package:dev_post/src/features/homepage/domain/repositories/post_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final postsDatabaseProvider = Provider<PostDataSource>(
  (_) => PostDataSourceImpl(dioConsumer: DioConsumer()),
);
final postsRepositoryProvider = Provider<PostRepository>(
  (ref) => PostRepositoryImpl(ref.watch(postsDatabaseProvider)),
);
