import 'package:dev_post/src/features/homepage/domain/models/post.dart';

abstract class PostRepository {
  Future<Post> getPosts();
}
