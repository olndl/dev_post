import 'package:dev_post/src/core/api/dio_consumer.dart';
import 'package:dev_post/src/core/constants/database.dart';
import 'package:dev_post/src/core/mappers/mapper.dart';
import 'package:dev_post/src/features/data/datasource/local_database/db.dart';
import 'package:dev_post/src/features/data/datasource/post_datasource.dart';
import 'package:dev_post/src/features/data/datasource/remote_database/remote_post_datasource_impl.dart';
import 'package:dev_post/src/features/domain/models/post.dart';
import 'package:sqflite/sqflite.dart';

class LocalPostDatasourceImpl implements PostDataSource {
  var databaseFuture = DB.db.database;
  final RemotePostDataSourceImpl remotePosts =
      RemotePostDataSourceImpl(dioConsumer: DioConsumer());

  @override
  Future<List<Child>> getPosts() async {
    final Database database = await databaseFuture;
    final todoMap = await database.query(DataBase.databaseName);
    final List<Child> postList = List<Child>.from(
      todoMap.map((post) => Mapper().transformToChildModel(post)),
    );
    return postList;
  }

  Future<void> savePost(ChildData post) async {
    final Database database = await databaseFuture;
    await database.transaction(
      (txn) async {
        final id = await txn.insert(
          DataBase.databaseName,
          post.toJson(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
        await txn.query(
          DataBase.databaseName,
          where: '${DB.columnId} = ?',
          whereArgs: [id],
        );
      },
    );
  }

  Future<void> updatePost(ChildData post) async {
    final Database database = await databaseFuture;
    final String id = post.id;
    await database.update(
      DataBase.databaseName,
      post.toJson(),
      where: '${DB.columnId} = ?',
      whereArgs: [id],
    );
  }
}
