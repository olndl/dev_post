import 'package:dev_post/src/features/domain/models/post.dart';

abstract class PostDataSource {
  Future<Post> getPosts();
}
