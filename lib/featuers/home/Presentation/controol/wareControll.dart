import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:ican/core/services/hivenServices.dart';
import 'package:ican/core/services/servicesDio.dart';
import 'package:ican/core/utlies/mathed.dart';
import 'package:ican/featuers/home/Date/Local/LocalWareHouses.dart';
import 'package:ican/featuers/home/Date/Local/LocalWareList.dart';
import 'package:ican/featuers/home/Date/Remote/RemoteStore.dart';
import 'package:ican/featuers/home/Presentation/models/wareList.dart';
import 'package:ican/featuers/home/Presentation/models/warehousesModels.dart';

class WareControll extends GetxController {
  late bool loding;
  late bool lodingwareList;
  late List<Warehousesmodels> WareHouseData;
  late List<WareList> WareListData;
  late List<Warehousesmodels> dafultWareHouseData;
  late List<WareList> dafulWareList;
  Timer? t;
  Timer? t1;
  static String WareHouseAll = 'WareAll';
  @override
  void onInit() {
    loding = true;
    lodingwareList = true;
    t = null;
    t1 = null;
    dafulWareList = [
      WareList(
          id: 0,
          listNo: 0,
          customerName: "ffffffffffff",
          note: "jjjjjjjjjjjj",
          createdAt: "ffffffffff",
          createdBy: "fffffffff"),
      WareList(
          id: 0,
          listNo: 0,
          customerName: "ffffffffffff",
          note: "jjjjjjjjjjjj",
          createdAt: "ffffffffff",
          createdBy: "fffffffff"),
    ];
    WareListData = dafulWareList;
    dafultWareHouseData = [
      Warehousesmodels(
          name: "0",
          qty: 11,
          points: 2,
          price: 10,
          totalPrice: 0,
          totalPoints: 0),
      Warehousesmodels(
          name: "0",
          qty: 11,
          points: 2,
          price: 10,
          totalPrice: 0,
          totalPoints: 0),
    ];
    getAllWare();

    super.onInit();
  }

  double getTextHeight(String text, TextStyle style, BuildContext context) {
    double maxWidth =
        Mathed.ResponcvMax(MediaQuery.sizeOf(context).width * 0.9, 400);
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      // maxLines: null, // السماح بعدة أسطر
      textDirection: TextDirection.rtl,
    )..layout(maxWidth: maxWidth);
    print(textPainter.size.height);
    return textPainter.size.height; // ارتفاع النص
  }

  Future<void> getAllWare() async {
    // Future<void> getLocalStatements(bool continued) async {
    loding = true;
    WareHouseData = dafultWareHouseData;
    update([WareHouseAll]);
    bool isNullLocal = false;
    Box<List<dynamic>> boxWare =
        await Hive.openBox<List<dynamic>>(HivenServices.warehouseAll);

    Localwarehouses localwarehouses = Localwarehouses(boxWare);
    // StatementLocal localeStaute = StatementLocal(boxStatements);
    List<Warehousesmodels>? local = await localwarehouses.getWareHouseAll();
    if (local != null) {
      loding = false;
      WareHouseData = local;
      update([WareHouseAll]);
    } else {
      isNullLocal = true;
      loding = true;
      WareHouseData = dafultWareHouseData;
      update([WareHouseAll]);
    }
    getRemte(isNullLocal, localwarehouses);
  }

  Future<void> getRemte(
      bool isNullLocal, Localwarehouses localwarehouses) async {
    final ServicesDio servicesDio = Get.find();
    RemoteStore remoteStore = RemoteStore(servicesDio);

    List<Warehousesmodels>? result = await remoteStore.getWarehouse();
    if (result != null) {
      loding = false;
      WareHouseData = result;
      localwarehouses.setAllwarehouse(result);
      update([WareHouseAll]);
    } else {
      if (isNullLocal) {
        Get.snackbar(
          "خطا",
          "الرجاء التحقق من الاتصال",
          //backgroundColor: Colors.black,
          colorText: Colors.black,
          duration: const Duration(seconds: 5),
        );
        t = Timer.periodic(const Duration(seconds: 10), (time) async {
          List<Warehousesmodels>? result = await remoteStore.getWarehouse();
          print(time.tick);
          if (result != null) {
            Get.snackbar(
              " ",
              "تم اعادة الاتصال",
              colorText: Colors.black,
              duration: const Duration(seconds: 5),
            );
            loding = false;
            WareHouseData = result;
            update([WareHouseAll]);
            time.cancel();
          }
        });
      }
    }
  }

  Future<void> getWareList(bool isWithdraw) async {
    // Future<void> getLocalStatements(bool continued) async {
    lodingwareList = true;
    WareListData = dafulWareList;
    update([WareHouseAll]);
    bool isNullLocal = false;
    Box<List<dynamic>> boxWare =
        await Hive.openBox<List<dynamic>>(HivenServices.wareList);

    Localwarelist localwareList = Localwarelist(boxWare);
    // StatementLocal localeStaute = StatementLocal(boxStatements);
    List<WareList>? local = await localwareList.getwareList(isWithdraw);
    if (local != null) {
      lodingwareList = false;
      WareListData = local;
      update([WareHouseAll]);
    } else {
      isNullLocal = true;
      lodingwareList = true;
      WareListData = dafulWareList;
      update([WareHouseAll]);
    }
    getRemteWareList(isNullLocal, localwareList, isWithdraw);
  }

  Future<void> getRemteWareList(
      bool isNullLocal, Localwarelist localwareList, bool isWithdraw) async {
    final ServicesDio servicesDio = Get.find();
    RemoteStore remoteStore = RemoteStore(servicesDio);

    List<WareList>? result = await remoteStore.getList(isWithdraw);
    if (result != null) {
      lodingwareList = false;
      WareListData = result;
      localwareList.setwarelist(result, isWithdraw);
      update([WareHouseAll]);
    } else {
      if (isNullLocal) {
        Get.snackbar(
          "خطا",
          "الرجاء التحقق من الاتصال",
          //backgroundColor: Colors.black,
          colorText: Colors.black,
          duration: const Duration(seconds: 5),
        );
        t1 = Timer.periodic(const Duration(seconds: 10), (time) async {
          List<WareList>? result = await remoteStore.getList(isWithdraw);
          print(time.tick);
          if (result != null) {
            Get.snackbar(
              " ",
              "تم اعادة الاتصال",
              colorText: Colors.black,
              duration: const Duration(seconds: 5),
            );
            lodingwareList = false;
            WareListData = result;
            update([WareHouseAll]);
            time.cancel();
          }
        });
      }
    }
  }
}
 // }


  //}
//}
