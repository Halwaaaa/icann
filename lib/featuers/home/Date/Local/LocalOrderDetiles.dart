import 'package:hive/hive.dart';
import 'package:ican/core/services/hivenServices.dart';
import 'package:ican/featuers/home/Presentation/models/OrderDatiles.dart';

class LocaleOrderDatiles {
  Box<dynamic> boxOrderDatiles;

  LocaleOrderDatiles(this.boxOrderDatiles);

  /// تخزين الطلبات بناءً على حالة الطلب
  Future<void> setOrderDatiles(OrderDatiles ordersDatiles, int idOrder) async {
    if (!boxOrderDatiles.isOpen) {
      boxOrderDatiles =
          await Hive.openBox<List<dynamic>>(HivenServices.orderDaties);
    }

    // حذف الطلبات القديمة الخاصة بحالة الطلب
    boxOrderDatiles.delete(idOrder);

    // تخزين الطلبات الجديدة
    boxOrderDatiles.put(idOrder, ordersDatiles);
  }

  /// استرجاع الطلبات بناءً على حالة الطلب
  Future<OrderDatiles?> getOrderDatiles(int idOrder) async {
    final data = boxOrderDatiles.get(idOrder);

    if (data != null) {
      try {
        return data as OrderDatiles;
      } catch (e) {
        // معالجة خطأ التحويل إذا حدث
        print('Error casting data: $e');
        return null;
      }
    }

    return null;
  }
}
