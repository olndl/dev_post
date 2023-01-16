import 'package:dev_post/src/core/widgets/custom_card.dart';
import 'package:dev_post/src/core/widgets/nothing.dart';
import 'package:dev_post/src/features/presentation/homepage/presentation/components/post_card_content.dart';
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
    return CustomCard(
      width: width,
      height: height,
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
