import 'dart:math' as math;

import 'package:dev_post/src/core/theme/colors_guide.dart';
import 'package:dev_post/src/features/homepage/presentation/components/navigation_panel.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      stretch: true,
      elevation: 2,
      onStretchTrigger: () {
        return Future<void>.value();
      },
      expandedHeight: 200.0,
      backgroundColor: ColorsGuide.backgroundColor,
      flexibleSpace: FlexibleSpaceBar(
        stretchModes: const <StretchMode>[
          StretchMode.zoomBackground,
          StretchMode.blurBackground,
          StretchMode.fadeTitle,
        ],
        centerTitle: true,
        title: const NavigationPanel(),
        background: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(50.0),
                ),
                gradient: LinearGradient(
                  colors: [ColorsGuide.appBarColor, ColorsGuide.primaryColor],
                  begin: const Alignment(-1.0, 0.0),
                  end: const Alignment(1.0, 0.0),
                  transform: const GradientRotation(math.pi / 4),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
