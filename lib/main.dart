import 'package:dev_post/src/app/dev_post_app.dart';
import 'package:dev_post/src/core/errors/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: DevPostApp()));
  initLogger();
  logger.info('start main...');
}
