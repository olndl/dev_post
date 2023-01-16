import 'package:dev_post/src/core/api/dio_consumer.dart';
import 'package:dev_post/src/core/constants/endpoints.dart';
import 'package:dev_post/src/features/data/datasource/post_datasource.dart';
import 'package:dev_post/src/features/domain/models/post.dart';

class RemotePostDataSourceImpl implements PostDataSource {
  DioConsumer dioConsumer;

  RemotePostDataSourceImpl({
    required this.dioConsumer,
  });

  @override
  Future<List<Child>> getPosts() async {
    final posts = await dioConsumer.get(Endpoints.allPosts);
    return Post.fromJson(posts).data.children;
  }
}
