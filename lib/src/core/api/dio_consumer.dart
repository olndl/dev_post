import 'package:dev_post/src/core/api/api_comsumer.dart';
import 'package:dev_post/src/core/api/dio_error.dart';
import 'package:dev_post/src/core/constants/endpoints.dart';
import 'package:dev_post/src/core/errors/logger.dart';
import 'package:dio/dio.dart';

class DioConsumer implements ApiConsumer {
  final Dio _dio;

  DioConsumer()
      : _dio = Dio(
          BaseOptions(
            baseUrl: Endpoints.baseUrl,
            connectTimeout: 3000,
            receiveTimeout: 3000,
            contentType: Endpoints.contentType,
            responseType: ResponseType.json,
          ),
        );

  // Get:-----------------------------------------------------------------------
  @override
  Future get(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.get(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      logger.info(response.statusCode);
      return response.data;
    } on DioError catch (err) {
      final errorMessage = DioException.fromDioError(err).toString();
      throw errorMessage;
    } catch (e) {
      logger.info(e);
      throw e.toString();
    }
  }
}
