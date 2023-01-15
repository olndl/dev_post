import 'package:dev_post/src/core/usecases/usecase.dart';
import 'package:dev_post/src/features/homepage/domain/models/post.dart';
import 'package:dev_post/src/features/homepage/domain/repositories/post_repository.dart';

class GetPostsUseCaseImpl implements UseCase {
  final PostRepository _postRepository;

  GetPostsUseCaseImpl(this._postRepository);

  @override
  Future<Post> execute() {
    return _postRepository.getPosts();
  }
}
