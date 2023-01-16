import 'package:dev_post/src/core/state/state.dart';
import 'package:dev_post/src/core/usecases/usecase.dart';
import 'package:dev_post/src/features/domain/domain_module.dart';
import 'package:dev_post/src/features/domain/models/post.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final postListStateNotifierProvider =
    StateNotifierProvider.autoDispose<PostListModel, State<List<Child>>>((ref) {
  return PostListModel(
    ref.watch(getPostsUseCaseProvider),
  );
});

class PostListModel extends StateNotifier<State<List<Child>>> {
  final UseCase _useCase;

  PostListModel(
    this._useCase,
  ) : super(const State.init()) {
    getPostList();
  }

  getPostList() async {
    try {
      state = const State.loading();
      final postList = await _useCase.execute();
      state = State.success(
        postList,
      );
    } on Exception catch (e) {
      state = State.error(e);
    }
  }
}
