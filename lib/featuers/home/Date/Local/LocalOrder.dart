import 'package:hive/hive.dart';
import 'package:ican/core/services/hivenServices.dart';
import 'package:ican/featuers/AppBar/Presentation/model/CountersUser.dart';
import 'package:ican/featuers/AppBar/Presentation/model/StateUser.dart';
import 'package:ican/featuers/home/Presentation/models/orderModels.dart';
import 'package:ican/featuers/home/Presentation/widget/Item/order/itemOrderSatus.dart';

class LocaleOrder {
  Box<List<dynamic>> boxOrder;
  LocaleOrder(this.boxOrder);
  Future<void> setOrder(List<OrderModels> order, int idOrderStautes) async {
    if (!boxOrder.isOpen) {
      boxOrder = await Hive.openBox<List<dynamic>>(HivenServices.order);
    }
    // Box boxStautes = await Hive.openBox<dynamic>(HivenServices.stautes);

    boxOrder.delete(idOrderStautes);
    boxOrder.put(idOrderStautes, order);

    //  getCountres();
    //  boxCountres.close();
  }

  Future<void> setOrderByidGroup(List<OrderModels> order, int idGroup) async {
    if (!boxOrder.isOpen) {
      boxOrder = await Hive.openBox<List<dynamic>>(HivenServices.order);
    }
    // Box boxStautes = await Hive.openBox<dynamic>(HivenServices.stautes);

    boxOrder.delete(idGroup);
    boxOrder.put(idGroup, order);

    //  getCountres();
    //  boxCountres.close();
  }

  Future<List<OrderModels>?> getOrder(int idOrderStautes) async {
    final data = boxOrder.get(idOrderStautes);

    if (data != null) {
      try {
        return data
            .map(
              (e) => e as OrderModels,
            )
            .toList();
        // return data.map((e) => e as StateUser).toList();
      } catch (e) {
        // معالجة خطأ التحويل إذا حدث
        print('Error casting data: $e');
        return null;
      }
    }

    return null;
  }

  Future<List<OrderModels>?> getOrderByidGroup(int idGroup) async {
    final data = boxOrder.get(idGroup);

    if (data != null) {
      try {
        return data
            .map(
              (e) => e as OrderModels,
            )
            .toList();
        // return data.map((e) => e as StateUser).toList();
      } catch (e) {
        // معالجة خطأ التحويل إذا حدث
        print('Error casting data: $e');
        return null;
      }
    }

    return null;
  }
}
