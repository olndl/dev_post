import 'package:dev_post/src/core/theme/colors_guide.dart';
import 'package:dev_post/src/core/theme/typography.dart';
import 'package:dev_post/src/core/utils/utils.dart';
import 'package:dev_post/src/core/widgets/gap_w.dart';
import 'package:dev_post/src/core/widgets/nothing.dart';
import 'package:flutter/material.dart';

class PostDetails extends StatelessWidget {
  final String? author;
  final int? ups;
  final int? date;
  const PostDetails({
    Key? key,
    required this.author,
    required this.ups,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            author != null
                ? const Icon(
                    Icons.alternate_email,
                  )
                : const Nothing(),
            const GapW(
              param: .3,
            ),
            author != null
                ? Text(
                    author!,
                    style: TextStyles.body,
                    maxLines: 1,
                  )
                : const Nothing(),
            const GapW(
              param: 2,
            ),
            Icon(Icons.favorite, color: ColorsGuide.ligntColor),
            const GapW(
              param: 1,
            ),
            Text(
              '$ups',
              style:
                  TextStyles.smallBody.copyWith(color: ColorsGuide.titleColor),
            ),
          ],
        ),
        date != null
            ? Text(
                Utils.toDateTime(date!),
                style: TextStyles.smallBody,
              )
            : const Nothing(),
      ],
    );
  }
}
