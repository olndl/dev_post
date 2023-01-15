import 'package:dev_post/src/features/homepage/domain/models/post.dart';

abstract class UseCase {
  Future<Post> execute();
}
