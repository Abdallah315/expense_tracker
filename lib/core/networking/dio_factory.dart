import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:inovola_task/core/networking/api_constants.dart';

class DioFactory {
  /// private constructor as I don't want to allow creating an instance of this class
  DioFactory._();

  static Dio? _mainDio;
  static Dio? _externalDio;

  static Dio getDio({bool isExternal = false}) {
    Duration timeOut = const Duration(seconds: 30);

    if (isExternal) {
      if (_externalDio == null) {
        _externalDio = Dio();
        _externalDio!
          ..options.connectTimeout = timeOut
          ..options.receiveTimeout = timeOut;
        _addDioHeaders(_externalDio!);
        _addDioInterceptor(_externalDio!);
        return _externalDio!;
      } else {
        return _externalDio!;
      }
    } else {
      if (_mainDio == null) {
        _mainDio = Dio();
        _mainDio!
          ..options.connectTimeout = timeOut
          ..options.receiveTimeout = timeOut
          ..options.baseUrl = ApiConstants.apiBaseUrl;
        _addDioHeaders(_mainDio!);
        _addDioInterceptor(_mainDio!);
        return _mainDio!;
      } else {
        return _mainDio!;
      }
    }
  }

  static void _addDioHeaders(Dio dioInstance) async {
    dioInstance.options.headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
  }

  static void setTokenIntoHeaderAfterLogin(String token) {
    _mainDio?.options.headers = {'Authorization': 'Bearer $token'};
    _externalDio?.options.headers = {'Authorization': 'Bearer $token'};
  }

  static void _addDioInterceptor(Dio dioInstance) {
    dioInstance.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
  }

  // Backward compatibility methods
  static void addDioHeaders() => _addDioHeaders(_mainDio!);
  static void addDioInterceptor() => _addDioInterceptor(_mainDio!);
}
