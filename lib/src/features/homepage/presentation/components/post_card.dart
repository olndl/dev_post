import 'package:dev_post/src/core/extensions/extensions.dart';
import 'package:dev_post/src/core/theme/colors_guide.dart';
import 'package:dev_post/src/core/widgets/nothing.dart';
import 'package:dev_post/src/features/homepage/presentation/components/post_card_content.dart';
import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  const PostCard({
    Key? key,
    this.width,
    this.height,
    this.heightImage,
    this.borderRadius = 30,
    this.contentPadding,
    this.image,
    this.title,
    this.description,
    this.color = Colors.white,
  }) : super(key: key);

  final double? width;
  final double? height;
  final double? heightImage;
  final double borderRadius;
  final EdgeInsetsGeometry? contentPadding;
  final ImageProvider? image;
  final Color color;
  final Widget? title;
  final Widget? description;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 1.percentOfHeight,
        horizontal: 5.percentOfWidth,
      ),
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: ColorsGuide.cardColor,
        boxShadow: [
          BoxShadow(
            color: ColorsGuide.labelColor.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          image != null
              ? ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(borderRadius),
                    topRight: Radius.circular(borderRadius),
                  ),
                  child: Image(
                    image: image!,
                    width: width,
                    height: heightImage,
                    fit: BoxFit.cover,
                  ),
                )
              : const Nothing(),
          PostCardContent(
            contentPadding: contentPadding,
            title: title,
            description: description,
          ),
        ],
      ),
    );
  }
}
