import 'package:dev_post/src/core/extensions/extensions.dart';
import 'package:dev_post/src/core/theme/colors_guide.dart';
import 'package:dev_post/src/features/domain/models/post.dart';
import 'package:dev_post/src/features/presentation/homepage/presentation/components/custom_app_bar.dart';
import 'package:dev_post/src/features/presentation/homepage/presentation/components/navigation_panel.dart';
import 'package:dev_post/src/features/presentation/homepage/presentation/components/post_list.dart';
import 'package:dev_post/src/features/presentation/homepage/presentation/providers/post_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePageBody extends ConsumerWidget {
  final Post post;
  const HomePageBody({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postListState = ref.watch(postListStateNotifierProvider.notifier);
    return RefreshIndicator(
      strokeWidth: 2,
      color: ColorsGuide.appBarColor,
      onRefresh: () {
        return postListState.getPostList();
      },
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          //const CupertinoSliverRefreshControl(),
          const CustomAppBar(
            bar: NavigationPanel(),
          ),
          SliverPadding(
            padding: EdgeInsets.only(top: 1.percentOfHeight),
          ),
          PostList(
            post: post,
          )
        ],
      ),
    );
  }
}
