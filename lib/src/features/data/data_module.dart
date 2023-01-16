import 'package:dev_post/src/features/data/datasource/post_datasource.dart';
import 'package:dev_post/src/features/data/datasource/sync_database/sync_post_datasource_impl.dart';
import 'package:dev_post/src/features/data/repositories/post_repository_impl.dart';
import 'package:dev_post/src/features/domain/repositories/post_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final postsDatabaseProvider = Provider<PostDataSource>(
  (_) => SyncPostDatabaseImpl(),
);
final postsRepositoryProvider = Provider<PostRepository>(
  (ref) => PostRepositoryImpl(ref.watch(postsDatabaseProvider)),
);
