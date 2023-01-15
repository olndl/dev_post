import 'package:dev_post/src/features/homepage/data/datasource/remote_database/post_datasource.dart';
import 'package:dev_post/src/features/homepage/domain/models/post.dart';
import 'package:dev_post/src/features/homepage/domain/repositories/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  final PostDataSource postDataSource;

  const PostRepositoryImpl(this.postDataSource);

  @override
  Future<Post> getPosts() async {
    final postList = await postDataSource.getPosts();
    return postList;
  }
}
