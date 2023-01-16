import 'package:dev_post/src/core/errors/logger.dart';
import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  final String message;
  const ErrorScreen({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    logger.info(message);
    return Center(
      heightFactor: 30,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(message),
          const CircularProgressIndicator(
            color: Colors.red,
            strokeWidth: 2,
          ),
        ],
      ),
    );
  }
}
