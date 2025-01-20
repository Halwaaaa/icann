import 'package:hive/hive.dart';
import 'package:ican/core/services/hivenServices.dart';
import 'package:ican/featuers/AppBar/Presentation/model/CountersUser.dart';
import 'package:ican/featuers/AppBar/Presentation/model/StateUser.dart';
import 'package:ican/featuers/home/Presentation/models/orderModels.dart';
import 'package:ican/featuers/home/Presentation/models/wareList.dart';
import 'package:ican/featuers/home/Presentation/models/warehousesModels.dart';
import 'package:ican/featuers/home/Presentation/widget/Item/order/itemOrderSatus.dart';

class Localwarelist {
  Box<List<dynamic>> boxWare;
  Localwarelist(this.boxWare);
  Future<void> setwarelist(List<WareList> warehouse, bool isWithdraw) async {
    if (!boxWare.isOpen) {
      boxWare = await Hive.openBox<List<dynamic>>(
          isWithdraw ? HivenServices.WithdrawList : HivenServices.wareList);
    }
    // Box boxStautes = await Hive.openBox<dynamic>(HivenServices.stautes);

    boxWare.delete(
        isWithdraw ? HivenServices.WithdrawList : HivenServices.wareList);
    boxWare.put(
        isWithdraw ? HivenServices.WithdrawList : HivenServices.wareList,
        warehouse);

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

  Future<List<WareList>?> getwareList(bool isWithdraw) async {
    final data = boxWare
        .get(isWithdraw ? HivenServices.WithdrawList : HivenServices.wareList);

    if (data != null) {
      try {
        return data
            .map(
              (e) => e as WareList,
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
