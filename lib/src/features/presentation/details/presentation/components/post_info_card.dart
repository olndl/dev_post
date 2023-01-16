import 'package:dev_post/src/core/constants/endpoints.dart';
import 'package:dev_post/src/core/extensions/extensions.dart';
import 'package:dev_post/src/core/theme/colors_guide.dart';
import 'package:dev_post/src/core/theme/typography.dart';
import 'package:dev_post/src/core/widgets/custom_card.dart';
import 'package:dev_post/src/features/domain/models/post.dart';
import 'package:flutter/material.dart';

class PostInfoCard extends StatelessWidget {
  final ChildData? postData;

  const PostInfoCard({Key? key, this.postData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(top: 7.percentOfHeight),
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            CustomCard(
              width: 90.percentOfWidth,
              height: 20.percentOfHeight,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 3.percentOfWidth,
                  vertical: 2.percentOfHeight,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      postData?.title ?? 'FlutterPost',
                      style: TextStyles.body
                          .copyWith(fontSize: 18, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 10,
              child: FractionalTranslation(
                translation: const Offset(0.0, -0.4),
                child: Align(
                  alignment: const FractionalOffset(0.5, 0.0),
                  child: Center(
                    child: CircleAvatar(
                      radius: 20.percentOfWidth,
                      backgroundColor: ColorsGuide.appBarColor,
                      child: CircleAvatar(
                        radius: 19.5.percentOfWidth,
                        backgroundImage: (postData?.thumbnail) != null &&
                                (postData?.thumbnail) != 'self'
                            ? NetworkImage(
                                postData!.thumbnail!,
                              )
                            : const NetworkImage(
                                Endpoints.noImageUrl,
                              ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
