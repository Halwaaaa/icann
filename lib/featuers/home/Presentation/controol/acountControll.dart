import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:ican/core/Loction/textApp.dart';
import 'package:ican/core/services/hivenServices.dart';
import 'package:ican/core/services/servicesDio.dart';
import 'package:ican/core/utlies/Modules/ModulesHome.dart';
import 'package:ican/featuers/AppBar/Data/Locale/localState.dart';
import 'package:ican/featuers/AppBar/Data/Remote/RemoteState.dart';
import 'package:ican/featuers/AppBar/Presentation/controll/AppbarControll.dart';
import 'package:ican/featuers/setting/Data/Locle/StatementLocal.dart';
import 'package:ican/featuers/setting/Data/Remote/RemoteStatement.dart';
import 'package:ican/featuers/home/Presentation/models/StatmentModels.dart';
import 'package:ican/featuers/home/Presentation/widget/Item/Acount/AcountInformation.dart';
import 'package:ican/featuers/home/Presentation/widget/Item/Acount/BlanceInformation.dart';
import 'package:ican/core/utlies/enum/eunm.dart';
import 'package:ican/featuers/home/Presentation/controol/OrderControll.dart';
import 'package:ican/featuers/home/Presentation/controol/controolHome.dart';
import 'package:ican/featuers/home/Presentation/widget/Item/Acount/itemStore.dart';
import 'package:ican/featuers/home/Presentation/widget/Item/order/itemOrderSatus.dart';
import 'package:ican/featuers/home/Presentation/widget/grid/Acount/GridAcount.dart';

class AcountControll extends GetxController {
  late int indexAcountMoudels;
  late ControolHome controolHome;
  late int indexGridAcount;
  late AppBarControll appBarControll;
  late int indexSelectedStore;
  late bool isAcount;
  late bool lodingStatements;
  late List<StatementModels> statementData;
  late bool visibaleGrid;
  late TextEditingController textTotelPrice;
  late TextEditingController textTotelPricewithRemove;
  late Box<int> boxPrice;
late int ?id;
  Timer? t;


  static String acount = 'acount';
  static String visibale = 'visibale';
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
  Future<void> onInit() async {
    visibaleGrid = true;
    indexAcountMoudels = 0;
    indexSelectedStore = 0;
    indexGridAcount = 0;
    id=null;

    isAcount = true;
    lodingStatements = false;
    statementData = statementDataDafult;
    controolHome = Get.find();
    appBarControll = Get.find();

    controolHome.changedEunms(enumCategory.Account);
    initText();
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implemen
    //it onClose]
    isAcount = false;
    t?.cancel();
    super.onClose();
  }

  @override
  void onReady() {
    controolHome.jumbTo();
    super.onReady();
  }

  void setVisibale(bool value) {
    visibaleGrid = value;
    
    update([store]);
  }
  void setId(int id){
    id = id;

  }

  void changedIndexGridAcount(int index) {
    indexGridAcount = index;
    appBarControll.changedTitelAppBar(moudelsAcount2[index]);
  }

  void changedSelectedStoe(int index) {
    appBarControll.changedTitelAppBar(moudlesStore[index]);
    indexSelectedStore = index;
    update([store]);
  }

  List<Widget> itemMoudlesAcount = [
    const GridAcount(),
    const BlanceInformation(),
    const OrderMain(),
    const StoreList(),
    const BlanceInformation(),
    const StoreList(),
    const AcountInformation(),
    const AcountInformation(),
    const BlanceInformation(),
  ];
  List<String> moudelsGrid = [];
  void changedAcountIndex(int index) {
    controolHome.jumbTo();

    indexAcountMoudels = index;
    // if (index == 1) getLocalStatements(true);
    // if (index == 4) getLocalStatements(false);
    update([acount]);
  }

  bool onWillPop() {
    if (!visibaleGrid) {
      setVisibale(true);
      return false;
    }
    if (indexAcountMoudels == 2) {
      return willPopOrder();
    }
    if (indexAcountMoudels == 0) {
      controolHome.changedIndexMain(0);
      return false;
    }
    appBarControll.changedTitelAppBar(AppText.Account.tr);
    changedAcountIndex(0);
    return false;
  }

  bool willPopOrder() {
    final Ordercontroll ordercontroll = Get.find();
    if (ordercontroll.indexModulesOrder == 0) {
      appBarControll.changedTitelAppBar(AppText.Account.tr);
      changedAcountIndex(0);
      return false;
    }
    return willPopOrder2(ordercontroll);
  }

  bool willPopOrder2(Ordercontroll ordercontroll) {
    if (ordercontroll.indexModulesOrder == 0) {
      controolHome.changedIndexMain(0);
      return false;
    }
    if (ordercontroll.indexModulesOrder == 1) {
      appBarControll.changedTitelAppBar(moudelsAcount[indexGridAcount]);
    }
    ordercontroll.changedIndexOrder(ordercontroll.indexModulesOrder - 1);

    return false;
  }

  static String store = 'store';
  static String statements = 'Statements';

  Future<void> initText() async {
    boxPrice = await Hive.openBox(HivenServices.price);
    int? priceTotel = await boxPrice.get(HivenServices.priceTotle);
    int? priceRemov = await boxPrice.get(HivenServices.pricewithRemove);
    textTotelPrice = TextEditingController(text: "${priceTotel ?? 1500}");
    textTotelPricewithRemove =
        TextEditingController(text: "${priceRemov ?? 5}");
  }
}
