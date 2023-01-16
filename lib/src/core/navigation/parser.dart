import 'dart:convert';

import 'package:dev_post/src/core/errors/logger.dart';
import 'package:dev_post/src/core/navigation/model.dart';
import 'package:flutter/cupertino.dart';

class RouteInformationParserImpl implements RouteInformationParser<TypedPath> {
  @override
  Future<TypedPath> parseRouteInformation(RouteInformation routeInformation) =>
      Future.value(path2TypedPath(routeInformation.location));

  @override
  RouteInformation restoreRouteInformation(TypedPath configuration) =>
      RouteInformation(location: typedPath2Path(configuration));

  static String typedPath2Path(TypedPath typedPath) {
    logger.info(
      typedPath.map((s) => jsonEncode(s.toJson())).join('/'),
    );
    return typedPath
        .map((s) => Uri.encodeComponent(jsonEncode(s.toJson())))
        .join('/');
  }

  static TypedPath path2TypedPath(String? path) {
    logger.info(path);
    if (path == null || path.isEmpty) return [];
    logger.info([
      for (final s in path.split('/'))
        if (s.isNotEmpty) TypedSegment.fromJson(jsonDecode(Uri.decodeFull(s)))
    ]);
    return [
      for (final s in path.split('/'))
        if (s.isNotEmpty) TypedSegment.fromJson(jsonDecode(Uri.decodeFull(s)))
    ];
  }

  @override
  Future<TypedPath> parseRouteInformationWithDependencies(
    RouteInformation routeInformation,
    BuildContext context,
  ) {
    return parseRouteInformation(routeInformation);
  }
}
