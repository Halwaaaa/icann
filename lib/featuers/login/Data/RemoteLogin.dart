import 'package:dio/dio.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/state_manager.dart';
import 'package:ican/core/services/servicesDio.dart';

class RemoteLogin {
  ServicesDio servicesDio = Get.put(ServicesDio());

  Future<Map<String, dynamic>?> loginWithUser(
    String endpoint, {
    Map<String, dynamic>? data,
    Map<String, String>? headers,
  }) async {
    try {
      Map<String, dynamic>? response = await servicesDio.postRequestLog(
        endpoint,
        data: data,
      );

      return response;
    } catch (error) {
      if (error is DioException) {
        print('DioError: ${error.response?.data}');
      } else {
        print('Error: $error');
      }
      rethrow;
    }
  }
}
