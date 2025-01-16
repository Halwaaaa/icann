import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ican/core/Loction/textApp.dart';
import 'package:ican/core/utlies/Modules/ModulesHome.dart';
import 'package:ican/featuers/AppBar/Presentation/controll/AppbarControll.dart';
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

  static String acount = 'acount';
  @override
  void onInit() {
    indexAcountMoudels = 0;
    indexSelectedStore = 0;
    indexGridAcount = 0;
    isAcount = true;
    controolHome = Get.find();
    appBarControll = Get.find();

    controolHome.changedEunms(enumCategory.Account);
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implemen
    //it onClose]
    isAcount = false;
    super.onClose();
  }

  @override
  void onReady() {
    controolHome.jumbTo();
    super.onReady();
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
    update([acount]);
  }

  bool onWillPop() {
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
}
