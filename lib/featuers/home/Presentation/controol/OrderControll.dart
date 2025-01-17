import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:ican/core/Loction/textApp.dart';
import 'package:ican/core/services/hivenServices.dart';
import 'package:ican/core/services/servicesDio.dart';
import 'package:ican/core/utlies/Modules/MoudulesOrder.dart';
import 'package:ican/core/utlies/enum/eunm.dart';
import 'package:ican/featuers/AppBar/Data/Remote/RemtoeSarch.dart';
import 'package:ican/featuers/AppBar/Presentation/controll/AppbarControll.dart';
import 'package:ican/featuers/AppBar/Presentation/controll/SearchControll.dart';
import 'package:ican/featuers/Responses/Presentation/View/ResponsesView.dart';
import 'package:ican/featuers/home/Date/Local/LocalOrder.dart';
import 'package:ican/featuers/home/Date/Local/LocalOrderDetiles.dart';
import 'package:ican/featuers/home/Date/Local/LocalOrderStautes.dart';
import 'package:ican/featuers/home/Date/Remote/RemoteDatiles.dart';
import 'package:ican/featuers/home/Date/Remote/RemoteOrder.dart';
import 'package:ican/featuers/home/Date/Remote/RemoteOrderStautes.dart';
import 'package:ican/featuers/home/Presentation/controol/controolHome.dart';
import 'package:ican/featuers/home/Presentation/models/OrderDatiles.dart';
import 'package:ican/featuers/home/Presentation/models/OrderSatutes.dart';
import 'package:ican/featuers/home/Presentation/models/orderModels.dart';
import 'package:ican/featuers/home/Presentation/widget/Item/Group/ListOrderMain.dart';
import 'package:ican/featuers/home/Presentation/widget/Item/order/itemOrderSatus.dart';
import 'package:ican/featuers/home/Presentation/widget/Item/order/orderInformation.dart';
import 'package:ican/featuers/home/Presentation/widget/grid/order/Girdmain.dart';
import 'package:ican/featuers/mainLayout/Presentation/Controll/mainLayoutcontroll.dart';
import 'package:ican/featuers/setting/Presentation/Controller/RepoteControol.dart';

class Ordercontroll extends GetxController {
  static String orderStautes = 'OrderStautes';
  static String orderList = 'orderList';
  static String orderListsarch = 'orderListsarch';
  static String orderDatiles = 'orderDatiles';
  late int indexModulesOrder;
  late Mainlayoutcontroll mainlayoutcontroll;
  late AppBarControll appBarControll;
  late String titleOrder;
  late bool lodingOrderStautes;
  late bool lodingOrder;
  late bool lodingOrderSarch;
  late bool lodingOrderDatiles;
  late List<OrderSatutes> orderStautesData;
  late List<OrderModels> orderData;
  late List<OrderModels> orderDataSearch;

  late int idOrder;
  late OrderDatiles? orderDatilesData;
  Timer? t;
  Timer? tOrder;
  Timer? tDatiles;

  String titel = "0";
  late int indexGridOrder;
  @override
  void onInit() {
    lodingOrderStautes = true;
    lodingOrder = true;
    idOrder = -1;
    lodingOrderDatiles = true;
    orderStautesData = moudlesOrderStautsDafult;
    orderData = moudlesOrderDafult;
    orderDataSearch = moudlesOrderDafult;
    orderDatilesData = null;
    getLocalOrderStautes();
    indexModulesOrder = 0;
    indexGridOrder = 0;

    // controolHome.changedEunms(enumCategory.OrderStatus);
    super.onInit();
  }

  void setIdOrder(int id) {
    idOrder = id;
  }

  void titelChose() {
    if (mainlayoutcontroll.indexSelected == 0)
      titleOrder = AppText.OrderStatus.tr;
    else if (mainlayoutcontroll.indexSelected == 1) {
      RepoteControol repoteControol = Get.find();
      if (repoteControol.indexRepoteSelected == 0) {
        titleOrder = AppText.deliveredReports.tr;
      } else {
        titleOrder = AppText.returnedReports.tr;
      }
    }
  }

  @override
  void onReady() {
    mainlayoutcontroll = Get.find();
    appBarControll = Get.find();
    mainlayoutcontroll.scrollcontroller?.jumpTo(0);
    titelChose();
    appBarControll.changedTitelAppBar(titleOrder);
    // TODO: implement onReady
    super.onReady();
  }

  @override
  onClose() {
    t?.cancel();
    tOrder?.cancel();
    tDatiles?.cancel();
    super.onClose();
  }

  List<Widget> itemMoudlesOrderSatuts = [
    const GirdMain(),
    const ListOrderMain(),
    const ResponsesView(),
    const OrderInformation(),
  ];
  changedIndexGrid(index) {
    appBarControll.changedTitelAppBar(orderStautesData[index].name);
    getLocalOrder(orderStautesData[index].id);

    indexGridOrder = index;
  }

  changedIndexOrder(int index) {
    if (index == 0) {
      appBarControll.changedTitelAppBar(titleOrder);
    } else if (index == 1) {
      appBarControll.changedTitelAppBar(orderStautesData[indexGridOrder].name);
    }

    mainlayoutcontroll.scrollcontroller?.jumpTo(0);

    indexModulesOrder = index;

    update([order]);
  }

  bool willPopOrder() {
    if (indexModulesOrder == 0) {
      if (mainlayoutcontroll.indexSelected == 0) {
        ControolHome controolHome = Get.find();
        appBarControll.changedTitelAppBar(AppText.AppBarHome.tr);
        controolHome.changedIndexMain(0);
        return false;
      }
    }
    if (indexModulesOrder == 1) {
      changedIndexOrder(0);
      return false;
    }

    changedIndexOrder(1);

    return false;
  }

  static String order = 'order';
  final ControolHome controolHome = Get.find();

  Future<void> getLocalOrderStautes() async {
    final bool isGroup = controolHome.indexModulesMain == 2;
    bool isNullLocal = false;
    Box<List<dynamic>> boxorder = await Hive.openBox<List<dynamic>>(
        isGroup ? HivenServices.orderSatutesGroup : HivenServices.orderSatutes);
    LocaleOrderStautes localeOrderStautes = LocaleOrderStautes();
    List<OrderSatutes>? local = isGroup
        ? await localeOrderStautes.getOrderStautesByGroup(
            controolHome.idGroupSelected!, boxorder)
        : await localeOrderStautes.getOrderStautes(boxorder);
    if (local != null) {
      lodingOrderStautes = false;
      orderStautesData = local;
      update([orderStautes]);
    } else {
      isNullLocal = true;
      lodingOrderStautes = true;
      orderStautesData = moudlesOrderStautsDafult;
      update([orderStautes]);
    }
    getRemte(isNullLocal, localeOrderStautes, boxorder, isGroup);
  }

  Future<void> getRemte(bool isNullLoacl, LocaleOrderStautes localeOrderStautes,
      Box<List<dynamic>> boxorder, bool isGroup) async {
    final ServicesDio servicesDio = Get.find();
    final ControolHome controolHome = Get.find();
    RemoteOrderStautes remoteOrderStautes = RemoteOrderStautes(servicesDio);

    List<OrderSatutes>? result = isGroup
        ? await remoteOrderStautes
            .getOrderStautesByGroup(controolHome.idGroupSelected!)
        : await remoteOrderStautes.getOrderStautes();
    if (result != null) {
      lodingOrderStautes = false;
      orderStautesData = result;
      isGroup
          ? localeOrderStautes.setOrderStautesByGroup(
              result, controolHome.idGroupSelected!, boxorder)
          : localeOrderStautes.setOrderStautes(result, boxorder);
      update([orderStautes]);
    } else {
      if (isNullLoacl) {
        Get.snackbar(
          "خطا",
          "الرجاء التحقق من الاتصال",
          //backgroundColor: Colors.black,
          colorText: Colors.black,
          duration: const Duration(seconds: 5),
        );
        t = Timer.periodic(const Duration(seconds: 10), (time) async {
          List<OrderSatutes>? result =
              await remoteOrderStautes.getOrderStautes();
          print(time.tick);
          if (result != null) {
            Get.snackbar(
              " ",
              "تم اعادة الاتصال",
              colorText: Colors.black,
              duration: const Duration(seconds: 5),
            );
            lodingOrderStautes = false;
            orderStautesData = result;
            isGroup
                ? localeOrderStautes.setOrderStautesByGroup(
                    result, controolHome.idGroupSelected!, boxorder)
                : localeOrderStautes.setOrderStautes(result, boxorder);
            update([orderStautes]);
            time.cancel();
          }
        });
      }
    }
  }

  Future<void> getLocalOrder(int idOrderStautes) async {
    print(idOrderStautes);
    bool isNullLocal = false;
    final bool isGroup = controolHome.indexModulesMain == 2;

    Box<List<dynamic>> boxorder = await Hive.openBox<List<dynamic>>(
        isGroup ? HivenServices.orderGroup : HivenServices.order);

    LocaleOrder localeOrder = LocaleOrder(boxorder);
    List<OrderModels>? local = isGroup
        ? await localeOrder.getOrder(controolHome.idGroupSelected!)
        : await localeOrder.getOrder(idOrderStautes);
    if (local != null) {
      lodingOrder = false;
      orderData = local;
      update([orderList]);
    } else {
      print("object");

      isNullLocal = true;
      lodingOrder = true;
      orderData = moudlesOrderDafult;
      update([orderList]);
    }
    getRemteOrder(isNullLocal, localeOrder, idOrderStautes);
  }

  Future<void> getRemteOrder(
    bool isNullLoacl,
    LocaleOrder localeOrder,
    int idOrderStautes,
  ) async {
    final ServicesDio servicesDio = Get.find();
    RemoteOrder remteOrder = RemoteOrder(servicesDio: servicesDio);
    final bool isGroup = controolHome.indexModulesMain == 2;
    List<OrderModels>? result = isGroup
        ? await remteOrder.getOrderByidGroup(
            idOrderStautes, controolHome.idGroupSelected!)
        : await remteOrder.getOrder(idOrderStautes);
    if (result != null) {
      //  print(result.first.client_phone);
      lodingOrder = false;
      orderData = result;
      isGroup
          ? localeOrder.setOrderByidGroup(result, controolHome.idGroupSelected!)
          : localeOrder.setOrder(result, idOrderStautes);
      update([orderList]);
    } else {
      if (isNullLoacl) {
        Get.snackbar(
          "خطا",
          "الرجاء التحقق من الاتصال",
          //backgroundColor: Colors.black,
          colorText: Colors.black,
          duration: const Duration(seconds: 5),
        );
        tOrder = Timer.periodic(const Duration(seconds: 10), (time) async {
          List<OrderModels>? result = isGroup
              ? await remteOrder.getOrderByidGroup(
                  idOrderStautes, controolHome.idGroupSelected!)
              : await remteOrder.getOrder(idOrderStautes);
          print(time.tick);
          if (result != null) {
            isGroup
                ? localeOrder.setOrderByidGroup(result, idOrderStautes)
                : localeOrder.setOrder(result, controolHome.idGroupSelected!);
            Get.snackbar(
              " ",
              "تم اعادة الاتصال",
              colorText: Colors.black,
              duration: const Duration(seconds: 5),
            );

            lodingOrder = false;
            orderData = result;
            update([orderList]);
            time.cancel();
          }
        });
      }
    }
  }

  Future<void> getLocalOrderDatiles(int idOrder) async {
    bool isNullLocal = false;

    Box<dynamic> boxOrderDatiles =
        await Hive.openBox<dynamic>(HivenServices.orderDaties);
    LocaleOrderDatiles localeOrderDatiles = LocaleOrderDatiles(boxOrderDatiles);

    // // الحصول على البيانات المحلية
    OrderDatiles? local = await localeOrderDatiles.getOrderDatiles(idOrder);
    if (local != null) {
      lodingOrderDatiles = false;
      orderDatilesData = local;
      update([orderDatiles]);
    } else {
      isNullLocal = true;
      lodingOrderDatiles = true;
      orderDatilesData = null;
      update([orderDatiles]);
    }

    // جلب البيانات من API
    getRemoteOrderDatiles(isNullLocal, localeOrderDatiles, idOrder);
  }

  Future<void> getRemoteOrderDatiles(bool isNullLocal,
      LocaleOrderDatiles localeOrderDatiles, int idOrder) async {
    final ServicesDio servicesDio = Get.find();
    RemoteOrderDatiles remoteOrderDatiles =
        RemoteOrderDatiles(servicesDio: servicesDio);

    // الحصول على البيانات من API
    OrderDatiles? result = await remoteOrderDatiles.getOrderDatiles(idOrder);
    if (result != null) {
      lodingOrderDatiles = false;
      orderDatilesData = result;

      // حفظ البيانات في التخزين المحلي
      localeOrderDatiles.setOrderDatiles(result, idOrder);
      update([orderDatiles]);
    } else {
      if (isNullLocal) {
        // عرض رسالة خطأ إذا لم تكن هناك بيانات محلية
        Get.snackbar(
          "خطأ",
          "الرجاء التحقق من الاتصال",
          colorText: Colors.black,
          duration: const Duration(seconds: 5),
        );

        // إعادة المحاولة بعد فترة زمنية
        tDatiles = Timer.periodic(const Duration(seconds: 10), (time) async {
          OrderDatiles? result =
              await remoteOrderDatiles.getOrderDatiles(idOrder);
          if (result != null) {
            Get.snackbar(
              " ",
              "تم إعادة الاتصال",
              colorText: Colors.black,
              duration: const Duration(seconds: 5),
            );
            lodingOrderDatiles = false;
            orderDatilesData = result;
            update([orderDatiles]);
            time.cancel();
          }
        });
      }
    }
  }
}
