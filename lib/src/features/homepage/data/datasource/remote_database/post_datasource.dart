import 'package:dev_post/src/features/homepage/domain/models/post.dart';

abstract class PostDataSource {
  Future<Post> getPosts();
}
