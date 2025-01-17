import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:ican/core/Models/UserModels.dart';
import 'package:ican/core/services/hivenServices.dart';
import 'package:ican/core/utlies/route.dart';

class ServicesDio extends GetxService {
  late Dio _dio;
  late Dio _dioWithToken;

  @override
  Future<void> onInit() async {
    print("object");
    final HivenServices hivenServices = Get.find();

    init(hivenServices);
    super.onInit();
  }

  Future<void> init(HivenServices hivenServices) async {
    // if (!hivenServices.userbox.isOpen) {
    //   await Hive.openBox(HivenServices.user);
    // }
    Box<User> user = await hivenServices.getUser();
    _dio = Dio(
      BaseOptions(
        baseUrl:
            'https://logic.icanaleppo.com/api/v1/', // ضع رابط API الخاص بك هنا
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {
          'Content-Type': 'application/json',
          // 'Accept': 'application/json',
          'Applanguage': 'en',
        },
      ),
    );

    _dioWithToken = Dio(
      BaseOptions(
        baseUrl:
            'https://logic.icanaleppo.com/api/v1/', // ضع رابط API الخاص بك هنا
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {
          ///'Content-Type': 'application/json',
          'Applanguage': 'en',
          'Authorization': 'Bearer ${user.get(HivenServices.user)?.token}'
        },
      ),
    );

    _dioWithToken.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        // يمكن إضافة توكن أو إعدادات هنا إذا لزم الأمر
        return handler.next(options);
      },
      onResponse: (response, handler) {
        return handler.next(response);
      },
      onError: (DioException error, handler) {
        print(error.error.toString());

        return handler.next(error);
      },
    ));
  }

  Future<Response?> getRequest(String endpoint,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.get(
        endpoint,
        queryParameters: queryParameters,
      );
      if (response.statusCode == 200) {
        return response.data;
      }
    } catch (error) {
      _handleError(error);
      rethrow;
    }
    return null;
  }

  Future<Map<String, dynamic>?>? getRequestWithToken(String endpoint,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dioWithToken.get(
        endpoint,
        queryParameters: queryParameters,
      );
      if (response.statusCode == 200) {
        return response.data;
      }
    } catch (error) {
      _handleError(error);
      rethrow;
    }
    return null;
  }

  Future<dynamic>? postRequest(String endpoint,
      {Map<String, dynamic>? data}) async {
    try {
      final response = await _dioWithToken.post(
        endpoint,
        data: data,
      );
      if (response.statusCode == 200) {
        return response.data;
      }
    } catch (error) {
      _handleError(error);
      rethrow;
    }
  }

  Future<Map<String, dynamic>?>? postRequestLog(String endpoint,
      {Map<String, dynamic>? data}) async {
    try {
      final response = await _dio.post(
        endpoint,
        data: data,
      );
      if (response.statusCode == 200) {
        return response.data;
      } else if (response.statusCode == 401 || response.data == 403) {
        Hive.deleteFromDisk();

        Get.offAllNamed(Routers.rLogin);
      } else if (response.statusCode == 401 || response.data == 403) {
        Hive.deleteFromDisk();

        Get.offAllNamed(Routers.rLogin);
      }
    } catch (error) {
      _handleError(error);
      _handleError(error);
      rethrow;
    }
    return null;
  }

  void _handleError(dynamic error) {
    if (error is DioException) {
      print(error.toString());
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          throw ('Connection timeout occurred.');
        case DioExceptionType.sendTimeout:
          throw ('Send timeout occurred.');
        case DioExceptionType.receiveTimeout:
          throw ('Receive timeout occurred.');
        case DioExceptionType.badResponse:
          final responseData = error.response?.data;
          if (responseData is Map<String, dynamic> &&
              responseData['errors'] != null) {
            final errorMessages =
                responseData['errors'] as Map<String, dynamic>;

            // تجميع جميع الأخطاء من الحقول المختلفة
            final allErrors = errorMessages.entries.map((entry) {
              //    final field = entry.key; // اسم الحقل (مثل username)
              final messages =
                  (entry.value as List<dynamic>).join(', '); // رسائل الأخطاء
              return ' $messages';
            }).join('\n');
            //  re// فصل الأخطاء بسطر جديد
            print(allErrors);

            throw Exception(allErrors);
            // عرض جميع الأخطاء
          }

          throw Exception(error.response?.data);

        case DioExceptionType.cancel:
          throw ('Request was cancelled.');
        case DioExceptionType.unknown:
          throw ('An unknown error occurred: ${error.message}');
        default:
          throw ('Unhandled error: ${error.message}');
      }
    } else {
      print('Non-Dio error: $error');
    }
  }
}
