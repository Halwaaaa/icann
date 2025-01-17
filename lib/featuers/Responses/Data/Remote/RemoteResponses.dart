import 'package:ican/core/services/servicesDio.dart';
import 'package:ican/featuers/Responses/Presentation/Modles/ResponsesModels.dart';

class RemoteResponses {
  final ServicesDio servicesDio;
  RemoteResponses(this.servicesDio);
  Future<List<ResponsesModels>?> getResponsesAll() async {
    try {
      // إرسال طلب HTTP لاسترجاع الطلبات بناءً على حالة الطلب
      Map<String, dynamic>? response =
          await servicesDio.getRequestWithToken('order-responses');
      // استخراج البيانات من الاستجابة
      List<dynamic>? responseData = response?['data'];
      print(responseData);
      List<ResponsesModels> result = [];
      if (responseData != null) {
        for (var element in responseData) {
          result.add(ResponsesModels.fromJson(element));
        }
      }

      // تحويل البيانات إلى كائنات OrderDatiles

      return result;
    } catch (error) {
      print('Error fetching orders: ${error.toString()}');
      // إعادة الخطأ إذا كان مطلوبًا
      // rethrow;
    }

    return null;
  }

  Future<List<ResponsesModels>?> getResponsesById(int idOrder) async {
    try {
      // إرسال طلب HTTP لاسترجاع الطلبات بناءً على حالة الطلب
      Map<String, dynamic>? response =
          await servicesDio.getRequestWithToken('orders/responses/$idOrder');

      // استخراج البيانات من الاستجابة
      List<dynamic> responseData = response?['data'];

      List<ResponsesModels> result = [];
      for (var element in responseData) {
        result.add(ResponsesModels.fromJson(element));
      }

      return result;
    } catch (error) {
      print("");
    }

    return null;
  }
}
