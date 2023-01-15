import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      heightFactor: 30,
      child: CircularProgressIndicator(
        strokeWidth: 2,
      ),
    );
  }
}
