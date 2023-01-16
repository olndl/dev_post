import 'package:dev_post/src/core/extensions/extensions.dart';
import 'package:dev_post/src/core/theme/colors_guide.dart';
import 'package:flutter/cupertino.dart';

class CustomCard extends StatelessWidget {
  final double? width;
  final double? height;
  final Widget child;
  const CustomCard({Key? key, required this.child, this.width, this.height})
      : super(key: key);

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
        borderRadius: BorderRadius.circular(30),
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
      child: child,
    );
  }
}
