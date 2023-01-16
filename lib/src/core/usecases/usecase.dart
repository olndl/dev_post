import 'package:dev_post/src/features/domain/models/post.dart';

abstract class UseCase {
  Future<List<Child>> execute();
}
