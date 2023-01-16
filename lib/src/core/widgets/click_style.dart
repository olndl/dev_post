import 'package:flutter/material.dart';

class ClickStyle extends StatelessWidget {
  final VoidCallback? onTap;
  final Widget child;
  final double? indent;
  final Color? splashColor;
  const ClickStyle({
    Key? key,
    this.onTap,
    required this.child,
    this.indent,
    this.splashColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () {},
      splashColor: splashColor ??
          Theme.of(context).colorScheme.onSurface.withOpacity(.12),
      highlightColor: Colors.transparent,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        margin: EdgeInsets.all(indent ?? 0),
        child: child,
      ),
    );
  }
}
