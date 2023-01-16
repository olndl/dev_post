import 'package:dev_post/src/core/constants/interface.dart';
import 'package:dev_post/src/core/extensions/extensions.dart';
import 'package:dev_post/src/core/theme/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavigationPanel extends ConsumerWidget {
  const NavigationPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: EdgeInsets.only(left: 5.percentOfWidth, right: 3.percentOfWidth),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                Interface.title,
                style: TextStyles.title,
              ),
              const Icon(
                Icons.flutter_dash,
                size: 20,
              ),
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
              size: 22,
            ),
          )
        ],
      ),
    );
  }
}
