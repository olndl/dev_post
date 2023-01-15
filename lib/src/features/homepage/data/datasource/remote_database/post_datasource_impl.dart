import 'package:dev_post/src/core/api/dio_consumer.dart';
import 'package:dev_post/src/core/constants/endpoints.dart';
import 'package:dev_post/src/features/homepage/data/datasource/remote_database/post_datasource.dart';
import 'package:dev_post/src/features/homepage/domain/models/post.dart';

class PostDataSourceImpl implements PostDataSource {
  DioConsumer dioConsumer;

  PostDataSourceImpl({
    required this.dioConsumer,
  });

  @override
  Future<Post> getPosts() async {
    final posts = await dioConsumer.get(Endpoints.allPosts);
    return Post.fromJson(posts);
  }
}
