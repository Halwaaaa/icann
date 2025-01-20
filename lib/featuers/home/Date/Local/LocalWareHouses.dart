import 'package:hive/hive.dart';
import 'package:ican/core/services/hivenServices.dart';
import 'package:ican/featuers/AppBar/Presentation/model/CountersUser.dart';
import 'package:ican/featuers/AppBar/Presentation/model/StateUser.dart';
import 'package:ican/featuers/home/Presentation/models/orderModels.dart';
import 'package:ican/featuers/home/Presentation/models/warehousesModels.dart';
import 'package:ican/featuers/home/Presentation/widget/Item/order/itemOrderSatus.dart';

class Localwarehouses {
  Box<List<dynamic>> boxWare;
  Localwarehouses(this.boxWare);
  Future<void> setAllwarehouse(
    List<Warehousesmodels> warehouse,
  ) async {
    if (!boxWare.isOpen) {
      boxWare = await Hive.openBox<List<dynamic>>(HivenServices.warehouseAll);
    }
    // Box boxStautes = await Hive.openBox<dynamic>(HivenServices.stautes);

    boxWare.delete(HivenServices.warehouseAll);
    boxWare.put(HivenServices.warehouseAll, warehouse);

    //  getCountres();
    //  boxCountres.close();
  }

  // Future<void> setOrderByidGroup(List<OrderModels> order, int idGroup) async {
  //   if (!boxWare.isOpen) {
  //     boxWare = await Hive.openBox<List<dynamic>>(HivenServices.order);
  //   }
  //   // Box boxStautes = await Hive.openBox<dynamic>(HivenServices.stautes);

  //   boxWare.delete(idGroup);
  //   boxWare.put(idGroup, order);

  //   //  getCountres();
  //   //  boxCountres.close();
  // }

  Future<List<Warehousesmodels>?> getWareHouseAll() async {
    final data = boxWare.get(HivenServices.warehouseAll);

    if (data != null) {
      try {
        return data
            .map(
              (e) => e as Warehousesmodels,
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

  // Future<List<OrderModels>?> getOrderByidGroup(int idGroup) async {
  //   final data = boxWare.get(idGroup);

  //   if (data != null) {
  //     try {
  //       return data
  //           .map(
  //             (e) => e as OrderModels,
  //           )
  //           .toList();
  //       // return data.map((e) => e as StateUser).toList();
  //     } catch (e) {
  //       // معالجة خطأ التحويل إذا حدث
  //       print('Error casting data: $e');
  //       return null;
  //     }
  //   }

  //   return null;
  // }
}
