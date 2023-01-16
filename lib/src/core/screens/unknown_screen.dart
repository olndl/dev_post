import 'package:flutter/material.dart';

class UnknownScreen extends StatelessWidget {
  const UnknownScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      heightFactor: 30,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          Icon(
            Icons.device_unknown,
            size: 30,
          ),
          CircularProgressIndicator(
            strokeWidth: 2,
          ),
        ],
      ),
    );
  }
}
