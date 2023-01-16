import 'package:dev_post/src/core/extensions/extensions.dart';
import 'package:dev_post/src/core/navigation/model.dart';
import 'package:dev_post/src/core/navigation/provider.dart';
import 'package:dev_post/src/core/theme/typography.dart';
import 'package:dev_post/src/core/widgets/click_style.dart';
import 'package:dev_post/src/core/widgets/nothing.dart';
import 'package:dev_post/src/features/domain/models/post.dart';
import 'package:dev_post/src/features/presentation/homepage/presentation/components/post_card.dart';
import 'package:dev_post/src/features/presentation/homepage/presentation/components/post_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostList extends ConsumerWidget {
  final Post post;

  const PostList({super.key, required this.post});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          final imageContent = post.data?.children?[index]?.data?.thumbnail;
          final titleContent = post.data?.children?[index]?.data?.title;
          final authorName = post.data?.children?[index]?.data?.author;
          final upsContent = post.data?.children?[index]?.data?.ups;
          final createdDate =
              post.data?.children?[index]?.data?.createdUtc.round();
          return ClickStyle(
            onTap: () => {
              ref.read(routerDelegateProvider).navigate([
                ListPostSegment(),
                PostDetailsSegment(post: post.data?.children?[index]?.data),
              ]),
            },
            child: PostCard(
              width: 90.percentOfWidth,
              heightImage: 140,
              image: (imageContent) != null && (imageContent) != 'self'
                  ? NetworkImage(
                      imageContent,
                    )
                  : null,
              title: titleContent != null
                  ? Text(
                      titleContent,
                      style: TextStyles.body,
                    )
                  : const Nothing(),
              description: PostDetails(
                author: authorName,
                ups: upsContent,
                date: createdDate,
              ),
            ),
          );
        },
        childCount: post.data?.children?.length,
      ),
    );
  }
}
