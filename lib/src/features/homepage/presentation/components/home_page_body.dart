import 'package:dev_post/src/core/extensions/extensions.dart';
import 'package:dev_post/src/features/homepage/domain/models/post.dart';
import 'package:dev_post/src/features/homepage/presentation/components/custom_app_bar.dart';
import 'package:dev_post/src/features/homepage/presentation/components/post_list.dart';
import 'package:flutter/cupertino.dart';

class HomePageBody extends StatelessWidget {
  final Post post;
  const HomePageBody({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        const CupertinoSliverRefreshControl(),
        const CustomAppBar(),
        SliverPadding(
          padding: EdgeInsets.only(top: 1.percentOfHeight),
        ),
        PostList(
          post: post,
        )
      ],
    );
  }
}
