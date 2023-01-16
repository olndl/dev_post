import 'package:cached_network_image/cached_network_image.dart';
import 'package:dev_post/src/core/constants/endpoints.dart';
import 'package:dev_post/src/core/extensions/extensions.dart';
import 'package:dev_post/src/core/theme/colors_guide.dart';
import 'package:dev_post/src/core/theme/typography.dart';
import 'package:dev_post/src/core/widgets/custom_card.dart';
import 'package:dev_post/src/features/domain/models/post.dart';
import 'package:flutter/material.dart';

class PostInfoCard extends StatelessWidget {
  final ChildData postData;

  const PostInfoCard({Key? key, required this.postData}) : super(key: key);

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
              height: 25.percentOfHeight,
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
                      postData.title,
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
              top: 1.percentOfHeight,
              child: FractionalTranslation(
                translation: const Offset(0.0, -0.4),
                child: Align(
                  alignment: const FractionalOffset(0.5, 0.0),
                  child: Center(
                    child: CircleAvatar(
                      radius: 20.percentOfWidth,
                      backgroundColor: ColorsGuide.appBarColor,
                      child: CachedNetworkImage(
                        imageUrl: (postData.thumbnail) != null &&
                                postData.thumbnail!.isCorrectUrl()
                            ? postData.thumbnail ?? Endpoints.noImageUrl
                            : Endpoints.noImageUrl,
                        imageBuilder: (context, imageProvider) => Container(
                          width: 39.percentOfWidth,
                          height: 39.percentOfWidth,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
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
