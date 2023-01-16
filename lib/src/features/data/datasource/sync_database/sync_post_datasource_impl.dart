import 'dart:io';

import 'package:dev_post/src/core/api/dio_consumer.dart';
import 'package:dev_post/src/core/constants/endpoints.dart';
import 'package:dev_post/src/core/errors/logger.dart';
import 'package:dev_post/src/features/data/datasource/local_database/local_post_datasource_impl.dart';
import 'package:dev_post/src/features/data/datasource/post_datasource.dart';
import 'package:dev_post/src/features/data/datasource/remote_database/remote_post_datasource_impl.dart';
import 'package:dev_post/src/features/domain/models/post.dart';

class SyncPostDatabaseImpl extends PostDataSource {
  final LocalPostDatasourceImpl localPosts = LocalPostDatasourceImpl();
  final RemotePostDataSourceImpl remotePosts =
      RemotePostDataSourceImpl(dioConsumer: DioConsumer());

  @override
  Future<List<Child>> getPosts() async {
    late List<Child> currantLocalPosts;
    late List<Child> currantRemotePosts;
    currantLocalPosts = await localPosts.getPosts();
    bool isOnline = await hasNetwork();
    if (isOnline && currantLocalPosts.isEmpty) {
      currantRemotePosts = await remotePosts.getPosts();
      for (int i = 0; i < currantRemotePosts.length; i++) {
        await localPosts.savePost(currantRemotePosts[i].data);
      }
      return currantLocalPosts;
    } else if (isOnline) {
      currantRemotePosts = await remotePosts.getPosts();
      await mergeLists(currantLocalPosts, currantRemotePosts);
      List<Child> posts = await localPosts.getPosts();
      return posts;
    } else {
      return currantLocalPosts;
    }
  }

  Future<bool> hasNetwork() async {
    try {
      final result = await InternetAddress.lookup(Endpoints.host);
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }

  Future<void> mergeLists(List<Child> local, List<Child> remote) async {
    final localInd = List<String>.from(local.map((e) => e.data.id));
    final remoteInd = List<String>.from(remote.map((e) => e.data.id));

    if (local.isEmpty) {
      List<Child> mergedPosts = remote;
      logger.info(mergedPosts);
    } else {
      Set setInd = remoteInd.toSet();
      List<String> newPosts =
          localInd.where((element) => setInd.contains(element)).toList();

      setInd = localInd.toSet();
      List<String> oldPosts =
          remoteInd.where((element) => !setInd.contains(element)).toList();
      if (oldPosts.isEmpty) {
        try {
          for (int i = 0; i < newPosts.length; i++) {
            final newPost = remote
                .firstWhere(
                  (element) => element.data.id.compareTo(newPosts[i]) == 0,
                )
                .data;
            localPosts.savePost(newPost);
          }
        } catch (e) {
          logger.info(e);
        }
      } else {
        try {
          for (int i = 0; i < newPosts.length; i++) {
            final newPost = remote
                .firstWhere(
                  (element) => element.data.id.compareTo(newPosts[i]) == 0,
                )
                .data;
            localPosts.savePost(newPost);
          }
          for (int i = 0; i < oldPosts.length; i++) {
            final oldPost = remote
                .firstWhere(
                  (element) => element.data.id.compareTo(oldPosts[i]) == 0,
                )
                .data;
            localPosts.updatePost(oldPost);
          }
        } catch (e) {
          logger.info(e);
        }
      }
      List<Child> mergedPosts = await localPosts.getPosts();
      logger.info(mergedPosts);
    }
  }
}
