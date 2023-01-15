import 'package:dev_post/src/core/extensions/extensions.dart';
import 'package:flutter/cupertino.dart';

class GapH extends StatelessWidget {
  final double param;
  const GapH({Key? key, required this.param}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: param.percentOfHeight,
    );
  }
}
