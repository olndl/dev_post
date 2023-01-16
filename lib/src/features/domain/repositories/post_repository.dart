import 'package:dev_post/src/features/domain/models/post.dart';

abstract class PostRepository {
  Future<List<Child>> getPosts();
}
