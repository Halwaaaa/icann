import 'package:collection/collection.dart';
import 'package:ican/core/services/servicesDio.dart';
import 'package:ican/featuers/home/Presentation/models/OrderDatiles.dart';

class RemoteOrderDatiles {
  RemoteOrderDatiles({required this.servicesDio});
  final ServicesDio servicesDio;

  Future<OrderDatiles?> getOrderDatiles(int idOrdre) async {
    try {
      // إرسال طلب HTTP لاسترجاع الطلبات بناءً على حالة الطلب
      Map<String, dynamic>? response =
          await servicesDio.getRequestWithToken('orders/show/$idOrdre');

      // استخراج البيانات من الاستجابة
      dynamic responseData = response?['data'];
      print(responseData);
      OrderDatiles orders = OrderDatiles.fromJson(responseData);

      // تحويل البيانات إلى كائنات OrderDatiles

      return orders;
    } catch (error) {
      print('Error fetching orders: ${error.toString()}');
      // إعادة الخطأ إذا كان مطلوبًا
      // rethrow;
    }

    return null;
  }
}
