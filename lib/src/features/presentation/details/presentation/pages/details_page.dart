import 'package:dev_post/src/core/extensions/extensions.dart';
import 'package:dev_post/src/core/theme/colors_guide.dart';
import 'package:dev_post/src/features/domain/models/post.dart';
import 'package:dev_post/src/features/presentation/details/presentation/components/details_panel.dart';
import 'package:dev_post/src/features/presentation/details/presentation/components/post_info_card.dart';
import 'package:dev_post/src/features/presentation/details/presentation/components/post_scores_card.dart';
import 'package:dev_post/src/features/presentation/details/presentation/components/post_text_card.dart';
import 'package:dev_post/src/features/presentation/homepage/presentation/components/custom_app_bar.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final ChildData tappedPost;
  const DetailsPage({Key? key, required this.tappedPost}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsGuide.backgroundColor,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const CustomAppBar(bar: DetailsPanel()),
          SliverPadding(
            padding: EdgeInsets.only(top: 1.percentOfHeight),
          ),
          PostInfoCard(
            postData: tappedPost,
          ),
          PostScoresCard(
            author: tappedPost.author,
            ups: tappedPost.ups,
            date: tappedPost.createdUtc.round(),
          ),
          if (tappedPost.selftext != null && tappedPost.selftext != '')
            PostTextCard(
              selfText: tappedPost.selftext,
            ),
        ],
      ),
    );
  }
}
