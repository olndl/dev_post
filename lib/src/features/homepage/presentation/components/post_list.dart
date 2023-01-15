import 'package:dev_post/src/core/extensions/extensions.dart';
import 'package:dev_post/src/core/theme/colors_guide.dart';
import 'package:dev_post/src/core/theme/typography.dart';
import 'package:dev_post/src/core/utils/utils.dart';
import 'package:dev_post/src/core/widgets/gap_w.dart';
import 'package:dev_post/src/core/widgets/nothing.dart';
import 'package:dev_post/src/features/homepage/domain/models/post.dart';
import 'package:dev_post/src/features/homepage/presentation/components/post_card.dart';
import 'package:flutter/material.dart';

class PostList extends StatelessWidget {
  final Post post;
  const PostList({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          final imageContent = post.data?.children?[index]?.data?.thumbnail;
          final titleContent = post.data?.children?[index]?.data?.title;
          final authorName = post.data?.children?[index]?.data?.author;
          final upsContent = post.data?.children?[index]?.data?.ups;
          final createdDate =
              post.data?.children?[index]?.data?.createdUtc.round();
          return PostCard(
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
            description: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    authorName != null
                        ? const Icon(
                            Icons.person,
                          )
                        : const Nothing(),
                    authorName != null
                        ? Text(
                            authorName,
                            style: TextStyles.body,
                            maxLines: 1,
                          )
                        : const Nothing(),
                    const GapW(
                      param: 2,
                    ),
                    Icon(Icons.favorite, color: ColorsGuide.ligntColor),
                    const GapW(
                      param: 1,
                    ),
                    Text(
                      '$upsContent',
                      style: TextStyles.smallBody,
                    ),
                  ],
                ),
                createdDate != null
                    ? Text(
                        Utils.toDateTime(createdDate),
                        style: TextStyles.smallBody,
                      )
                    : const Nothing()
              ],
            ),
          );
        },
        childCount: post.data?.children?.length,
      ),
    );
  }
}
