import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:ican/core/Loction/textApp.dart';
import 'package:ican/core/services/hivenServices.dart';
import 'package:ican/core/services/servicesDio.dart';
import 'package:ican/featuers/AppBar/Presentation/controll/AppbarControll.dart';
import 'package:ican/featuers/home/Presentation/models/StatmentModels.dart';
import 'package:ican/featuers/home/Presentation/widget/Item/order/itemOrderSatus.dart';
import 'package:ican/featuers/setting/Data/Locle/StatementLocal.dart';
import 'package:ican/featuers/setting/Data/Remote/RemoteStatement.dart';
import 'package:ican/featuers/setting/Presentation/widget/item/Repote/itemRepoteList.dart';

class RepoteControol extends GetxController
    with GetSingleTickerProviderStateMixin {
  static String repote = 'repote';
  static String repoteSelected = 'repoteSelected';
  late int indexModulesRepote;
  late AnimationController animationController;
  late Animation<double> animation;
  late Animation<Offset> postion;
  late Animation<double> opctiy;
  late int indexRepoteSelected;
  late AppBarControll appBarControll;
  late List<StatementModels> statementData;
  late bool lodingStatements;
  Timer? t;
  List<StatementModels> statementDataDafult = [
    StatementModels(
        id: 0,
        statementNo: 2156,
        userName: "ddd",
        createdAt: "dddccvdds",
        totalAmount: 21,
        deliveryFee: 4555,
        netAmount: 2555,
        ordersCount: 44441),
    StatementModels(
        id: 0,
        statementNo: 2156,
        userName: "ddd",
        createdAt: "dddccvdds",
        totalAmount: 21,
        deliveryFee: 4555,
        netAmount: 2555,
        ordersCount: 44441),
  ];

  @override
  void onInit() {
    indexModulesRepote = 0;
    indexRepoteSelected = 0;
    lodingStatements = true;
    statementData = statementDataDafult;
    getLocalStatements(true);
    // TODO: implement onInit
    super.onInit();
  }

  void changedSelectedReptoe(int index) {
    indexRepoteSelected = index;
    if (index == 0) {
      appBarControll.changedTitelAppBar('كشف واصل');
      getLocalStatements(true);
    }
    if (index == 1) {
      appBarControll.changedTitelAppBar('كشف راجع');
      getLocalStatements(false);
    }
    update([repoteSelected]);
  }

  @override
  void onReady() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));

    animation =
        CurvedAnimation(curve: Curves.linear, parent: animationController);
    postion =
        Tween<Offset>(begin: const Offset(0, 0.5), end: const Offset(0, 0))
            .animate(animation);
    opctiy = Tween<double>(begin: 0, end: 1).animate(animation);
    appBarControll = Get.find();
    super.onReady();
  }

  @override
  onClose() {
    animationController.dispose();
    t?.cancel();
    super.onClose();
  }

  List<Widget> itemModulesReppote = [
    const ItemRpotelist(),
    // const OrderMain(),
  ];

  void changedIndexModulesRepot(int index) {
    if (index == 0) {
      appBarControll.changedTitelAppBar(AppText.reports.tr);
    }
    indexModulesRepote = index;
    update([repote]);
  }

  static String statements = 'Statements';
  Future<void> getLocalStatements(bool continued) async {
    lodingStatements = true;
    statementData = statementDataDafult;
    update([repoteSelected]);
    bool isNullLocal = false;
    Box<List<dynamic>> boxStatements =
        await Hive.openBox<List<dynamic>>(HivenServices.statement);
    StatementLocal localeStaute = StatementLocal(boxStatements);
    List<StatementModels>? local = await localeStaute.getStatement(continued);
    if (local != null) {
      lodingStatements = false;
      statementData = local;
      update([repoteSelected]);
    } else {
      isNullLocal = true;
      lodingStatements = true;
      statementData = statementDataDafult;
      update([repoteSelected]);
    }
    getRemte(isNullLocal, continued, localeStaute);
  }

  Future<void> getRemte(
      bool isNullLoacl, bool continued, StatementLocal localeStaute) async {
    final ServicesDio servicesDio = Get.find();
    Remotestatement remotestatement = Remotestatement(servicesDio: servicesDio);

    List<StatementModels>? result =
        await remotestatement.getStatement(continued);
    if (result != null) {
      lodingStatements = false;
      statementData = result;
      localeStaute.setStatement(result, continued);
      update([repoteSelected]);
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
          List<StatementModels>? result =
              await remotestatement.getStatement(continued);
          print(time.tick);
          if (result != null) {
            Get.snackbar(
              " ",
              "تم اعادة الاتصال",
              colorText: Colors.black,
              duration: const Duration(seconds: 5),
            );
            lodingStatements = false;
            statementData = result;
            update([repoteSelected]);
            time.cancel();
          }
        });
      }
    }
  }
}
