//отдельный маппер нужен для работы c sqflite

import 'package:dev_post/src/features/domain/models/post.dart';

class Mapper {
  ChildData transformToModel(Map<String, dynamic> entity) {
    return ChildData(
      id: entity['id'],
      selftext: entity['selftext'],
      title: entity['title'],
      ups: entity['ups'],
      thumbnail: entity['thumbnail'],
      author: entity['author'],
      createdUtc: double.parse(entity['created_utc']),
    );
  }

  Child transformToChildModel(Map<String, dynamic> entity) {
    return Child(
      data: ChildData(
        id: entity['id'],
        selftext: entity['selftext'],
        title: entity['title'],
        ups: entity['ups'],
        thumbnail: entity['thumbnail'],
        author: entity['author'],
        createdUtc: entity['created_utc'].toDouble(),
      ),
    );
  }
}
