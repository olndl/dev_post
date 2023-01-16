import 'package:dev_post/src/core/extensions/extensions.dart';
import 'package:dev_post/src/core/widgets/gap_h.dart';
import 'package:flutter/cupertino.dart';

class PostCardContent extends StatelessWidget {
  const PostCardContent({
    Key? key,
    this.contentPadding,
    this.title,
    this.description,
  }) : super(key: key);

  final EdgeInsetsGeometry? contentPadding;

  final Widget? title;
  final Widget? description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: contentPadding ??
          EdgeInsets.only(
            top: 1.percentOfHeight,
            bottom: 1.5.percentOfHeight,
            left: 4.percentOfWidth,
            right: 4.percentOfWidth,
          ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (title != null || description != null)
            Padding(
              padding: EdgeInsets.only(top: 1.percentOfHeight),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (title != null) title!,
                  if (title != null && description != null)
                    const GapH(param: 2),
                  if (description != null) description!,
                ],
              ),
            ),
        ],
      ),
    );
  }
}
