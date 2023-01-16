import 'dart:convert';

import 'package:dev_post/src/features/domain/models/post.dart';

typedef JsonMap = Map<String, dynamic>;

abstract class TypedSegment {
  factory TypedSegment.fromJson(JsonMap json) {
    if (json['path'] == 'ListPostSegment') {
      return ListPostSegment();
    }
    if (json['path'] == 'PostDetailsSegment') {
      return PostDetailsSegment(post: json['post']);
    }
    return ListPostSegment();
  }

  JsonMap toJson() => <String, dynamic>{'path': runtimeType.toString()};

  @override
  String toString() => jsonEncode(toJson());
}

typedef TypedPath = List<TypedSegment>;

class ListPostSegment with TypedSegment {}

class PostDetailsSegment with TypedSegment {
  PostDetailsSegment({required this.post});

  final ChildData post;
}
