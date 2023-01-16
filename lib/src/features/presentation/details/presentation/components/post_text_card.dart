import 'package:dev_post/src/core/extensions/extensions.dart';
import 'package:dev_post/src/core/theme/typography.dart';
import 'package:dev_post/src/core/widgets/custom_card.dart';
import 'package:flutter/cupertino.dart';

class PostTextCard extends StatelessWidget {
  final String? selfText;
  const PostTextCard({Key? key, this.selfText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: CustomCard(
        width: 90.percentOfWidth,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 3.percentOfWidth,
            vertical: 2.percentOfHeight,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                selfText!,
                style: TextStyles.body,
              )
            ],
          ),
        ),
      ),
    );
  }
}
