import 'package:dev_post/src/core/extensions/extensions.dart';
import 'package:dev_post/src/core/widgets/custom_card.dart';
import 'package:dev_post/src/features/presentation/homepage/presentation/components/post_details.dart';
import 'package:flutter/cupertino.dart';

class PostScoresCard extends StatelessWidget {
  final String? author;
  final int? ups;
  final int? date;
  const PostScoresCard({Key? key, this.author, this.ups, this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: CustomCard(
        width: 90.percentOfWidth,
        height: 10.percentOfHeight,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.percentOfWidth),
          child: PostDetails(
            author: author,
            ups: ups,
            date: date,
          ),
        ),
      ),
    );
  }
}
