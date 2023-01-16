import 'package:dev_post/src/core/extensions/extensions.dart';
import 'package:dev_post/src/core/navigation/model.dart';
import 'package:dev_post/src/core/navigation/provider.dart';
import 'package:dev_post/src/core/theme/typography.dart';
import 'package:dev_post/src/core/widgets/click_style.dart';
import 'package:dev_post/src/features/domain/models/post.dart';
import 'package:dev_post/src/features/presentation/homepage/presentation/components/post_card.dart';
import 'package:dev_post/src/features/presentation/homepage/presentation/components/post_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostList extends ConsumerWidget {
  final List<Child> postList;

  const PostList({
    required this.postList,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          final imageContent = postList[index].data.thumbnail;
          final titleContent = postList[index].data.title;
          final authorName = postList[index].data.author;
          final upsContent = postList[index].data.ups;
          final createdDate = postList[index].data.createdUtc.round();
          return ClickStyle(
            onTap: () => {
              ref.read(routerDelegateProvider).navigate([
                ListPostSegment(),
                PostDetailsSegment(
                  post: postList[index].data,
                ),
              ]),
            },
            child: PostCard(
              width: 90.percentOfWidth,
              heightImage: 140,
              image: imageContent!.isCorrectUrl() ? imageContent : null,
              title: Text(
                titleContent,
                style: TextStyles.body,
              ),
              description: PostDetails(
                author: authorName,
                ups: upsContent,
                date: createdDate,
              ),
            ),
          );
        },
        childCount: postList.length,
        //post.data?.children?.length,
      ),
    );
  }
}
