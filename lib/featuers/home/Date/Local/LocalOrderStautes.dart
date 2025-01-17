import 'package:hive/hive.dart';
import 'package:ican/core/services/hivenServices.dart';
import 'package:ican/featuers/AppBar/Presentation/model/CountersUser.dart';
import 'package:ican/featuers/AppBar/Presentation/model/StateUser.dart';
import 'package:ican/featuers/home/Presentation/models/OrderSatutes.dart';

class LocaleOrderStautes {
  LocaleOrderStautes();
  Future<void> setOrderStautes(List<OrderSatutes> orderSatutes,
      Box<List<dynamic>> boxOrderStautes) async {
    if (!boxOrderStautes.isOpen) {
      boxOrderStautes =
          await Hive.openBox<List<dynamic>>(HivenServices.orderSatutes);
    }

    boxOrderStautes.delete(HivenServices.stautes);
    boxOrderStautes.put(HivenServices.orderSatutes, orderSatutes);

    //  getCountres();
    //  boxCountres.close();
  }

  Future<List<OrderSatutes>?> getOrderStautes(
      Box<List<dynamic>> boxOrderStautes) async {
    if (!boxOrderStautes.isOpen) {
      boxOrderStautes =
          await Hive.openBox<List<dynamic>>(HivenServices.orderSatutes);
    }

    final data = boxOrderStautes.get(HivenServices.orderSatutes);

    if (data != null) {
      try {
        //  return data as StateUser;
        return data.map((e) => e as OrderSatutes).toList();
      } catch (e) {
        // معالجة خطأ التحويل إذا حدث
        print('Error casting data: $e');
        return null;
      }
    }

    return null;
  }

  Future<void> setOrderStautesByGroup(List<OrderSatutes> orderSatutesByGroup,
      int id, Box<List<dynamic>> boxOrderStautes) async {
    if (!boxOrderStautes.isOpen) {
      boxOrderStautes =
          await Hive.openBox<List<dynamic>>(HivenServices.orderSatutesGroup);
    }

    boxOrderStautes.delete(id);
    boxOrderStautes.put(id, orderSatutesByGroup);

    //  getCountres();
    //  boxCountres.clo,se();
  }

  Future<List<OrderSatutes>?> getOrderStautesByGroup(
      int id, Box<List<dynamic>> boxOrderStautes) async {
    if (!boxOrderStautes.isOpen) {
      boxOrderStautes =
          await Hive.openBox<List<dynamic>>(HivenServices.orderSatutesGroup);
    }

    final data = boxOrderStautes.get(id);

    if (data != null) {
      try {
        //  return data as StateUser;
        return data.map((e) => e as OrderSatutes).toList();
      } catch (e) {
        // معالجة خطأ التحويل إذا حدث
        print('Error casting data: $e');
        return null;
      }
    }

    return null;
  }
}
