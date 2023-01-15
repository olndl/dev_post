import 'package:dev_post/src/core/extensions/extensions.dart';
import 'package:flutter/cupertino.dart';

class GapW extends StatelessWidget {
  final double param;
  const GapW({Key? key, required this.param}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: param.percentOfWidth,
    );
  }
}
