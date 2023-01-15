import 'dart:math' as math;

import 'package:dev_post/src/features/homepage/presentation/components/navigation_panel.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  final Color _accentColor = const Color(0xFF00FF83);

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
      backgroundColor: const Color(0xFFF3F3F3),
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
                  colors: [_accentColor, Colors.blue],
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
