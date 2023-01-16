import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'post.freezed.dart';
part 'post.g.dart';

String postToJson(Post? data) => json.encode(data!.toJson());

@freezed
class Post with _$Post {
  const factory Post({
    required PostData data,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}

@freezed
class PostData with _$PostData {
  const factory PostData({
    required int? dist,
    required List<Child> children,
  }) = _PostData;

  factory PostData.fromJson(Map<String, dynamic> json) =>
      _$PostDataFromJson(json);
}

@freezed
class Child with _$Child {
  const factory Child({
    required ChildData data,
  }) = _Child;

  factory Child.fromJson(Map<String, dynamic> json) => _$ChildFromJson(json);
}

@freezed
class ChildData with _$ChildData {
  const factory ChildData({
    required String id,
    required String? selftext,
    required String title,
    required int ups,
    required String? thumbnail,
    required String author,
    @JsonKey(name: 'created_utc') required double createdUtc,
  }) = _ChildData;

  factory ChildData.fromJson(Map<String, dynamic> json) =>
      _$ChildDataFromJson(json);
}
