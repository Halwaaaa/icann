import 'package:collection/collection.dart';
import 'package:ican/core/services/servicesDio.dart';
import 'package:ican/featuers/home/Presentation/models/OrderDatiles.dart';
import 'package:ican/featuers/home/Presentation/models/StatmentModels.dart';

class Remotestatement {
  Remotestatement({required this.servicesDio});
  final ServicesDio servicesDio;

  Future<List<StatementModels>?> getStatement(bool continued) async {
    try {
      String path = continued ? 'statements/continued' : 'statements/recovered';
      // إرسال طلب HTTP لاسترجاع الطلبات بناءً على حالة الطلب
      Map<String, dynamic>? response =
          await servicesDio.getRequestWithToken(path);

      // استخراج البيانات من الاستجابة
      List<dynamic>? responseData = response?['data'];
      List<StatementModels> statement = [];

      if (responseData != null) {
        for (var element in responseData) {
          statement.add(StatementModels.fromJson(element));
        }
      }
      print(responseData);

      // تحويل البيانات إلى كائنات OrderDatiles

      return statement;
    } catch (error) {
      print('Error fetching orders: ${error.toString()}');
      // إعادة الخطأ إذا كان مطلوبًا
      // rethrow;
    }

    return null;
  }
}
