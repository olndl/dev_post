import 'package:dev_post/src/app/dev_post_app.dart';
import 'package:dev_post/src/core/errors/logger.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const DevPostApp());
  initLogger();
  logger.info('start main...');
}
