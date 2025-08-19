import 'package:dio/dio.dart';
import 'package:inovola_task/core/errors/failure.dart';
import 'package:inovola_task/core/networking/dio_factory.dart';

class ApiService {
  Future<Response> get({
    required final String endpoint,
    final Map<String, dynamic>? queryParameters,
  }) async {
    try {
      // Determine if this is an external URL (starts with http/https)
      final isExternal =
          endpoint.startsWith('http://') || endpoint.startsWith('https://');
      final dio = DioFactory.getDio(isExternal: isExternal);

      final response = await dio.get(
        endpoint,
        queryParameters: queryParameters,
      );
      return response;
    } on DioException catch (e) {
      throw ServerFailure.fromDiorError(e);
    } catch (error) {
      throw CustomFailure(error.toString());
    }
  }

  Future<Response> post({
    required final String endpoint,
    required final Map<String, dynamic> body,
    final List? listBody,
    final Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final isExternal =
          endpoint.startsWith('http://') || endpoint.startsWith('https://');
      final dio = DioFactory.getDio(isExternal: isExternal);

      final response = await dio.post(
        endpoint,
        data: listBody ?? body,
        queryParameters: queryParameters,
      );
      return response;
    } on DioException catch (e) {
      throw ServerFailure.fromDiorError(e);
    } catch (error) {
      throw CustomFailure(error.toString());
    }
  }

  Future<Response> put({
    required final String endpoint,
    required final Map<String, dynamic> body,
    final Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final isExternal =
          endpoint.startsWith('http://') || endpoint.startsWith('https://');
      final dio = DioFactory.getDio(isExternal: isExternal);

      final response = await dio.put(
        endpoint,
        data: body,
        queryParameters: queryParameters,
      );
      return response;
    } on DioException catch (e) {
      throw ServerFailure.fromDiorError(e);
    } catch (error) {
      throw CustomFailure(error.toString());
    }
  }

  Future<Response> delete({
    required final String endpoint,
    final Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final isExternal =
          endpoint.startsWith('http://') || endpoint.startsWith('https://');
      final dio = DioFactory.getDio(isExternal: isExternal);

      final response = await dio.delete(
        endpoint,
        queryParameters: queryParameters,
      );
      return response;
    } on DioException catch (e) {
      throw ServerFailure.fromDiorError(e);
    } catch (error) {
      throw CustomFailure(error.toString());
    }
  }
}
