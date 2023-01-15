import 'package:dev_post/src/core/constants/interface.dart';
import 'package:dev_post/src/core/extensions/extensions.dart';
import 'package:flutter/material.dart';

class NavigationPanel extends StatelessWidget {
  const NavigationPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 5.percentOfWidth, right: 3.percentOfWidth),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: const [
              Text(
                Interface.title,
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              Icon(
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
