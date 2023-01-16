import 'package:dev_post/src/core/constants/interface.dart';
import 'package:dev_post/src/core/extensions/extensions.dart';
import 'package:dev_post/src/core/navigation/model.dart';
import 'package:dev_post/src/core/navigation/provider.dart';
import 'package:dev_post/src/core/theme/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailsPanel extends ConsumerWidget {
  const DetailsPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: EdgeInsets.only(right: 3.percentOfWidth),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              ref.read(routerDelegateProvider).navigate([ListPostSegment()]);
            },
            icon: const Icon(
              Icons.arrow_back,
              size: 22,
            ),
          ),
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
        ],
      ),
    );
  }
}
