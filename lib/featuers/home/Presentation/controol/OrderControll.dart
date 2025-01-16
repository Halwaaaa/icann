import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ican/core/Loction/textApp.dart';
import 'package:ican/core/utlies/Modules/MoudulesOrder.dart';
import 'package:ican/core/utlies/enum/eunm.dart';
import 'package:ican/featuers/AppBar/Presentation/controll/AppbarControll.dart';
import 'package:ican/featuers/home/Presentation/controol/controolHome.dart';
import 'package:ican/featuers/home/Presentation/widget/Item/Group/ListOrderMain.dart';
import 'package:ican/featuers/home/Presentation/widget/Item/order/orderInformation.dart';
import 'package:ican/featuers/home/Presentation/widget/grid/order/Girdmain.dart';

class Ordercontroll extends GetxController {
  late int indexModulesOrder;
  late ControolHome controolHome;
  late AppBarControll appBarControll;

  String titel = "0";
  late int indexGridOrder;
  @override
  void onInit() {
    indexModulesOrder = 0;
    indexGridOrder = 0;

    controolHome = Get.find();
    appBarControll = Get.find();
    controolHome.changedEunms(enumCategory.OrderStatus);
    super.onInit();
  }

  @override
  void onReady() {
    controolHome.jumbTo();
    // TODO: implement onReady
    super.onReady();
  }

  List<Widget> itemMoudlesOrderSatuts = [
    const GirdMain(),
    const ListOrderMain(),
    const OrderInformation()
  ];
  changedIndexGrid(index) {
    appBarControll.changedTitelAppBar(moudlesLabelOrderStauts[index]);
    indexGridOrder = index;

    changedTite(index);
  }

  changedIndexOrder(int index) {
    if (index == 0) {
      appBarControll.changedTitelAppBar(AppText.OrderStatus.tr);
    }
    if (index == 1) {
      appBarControll
          .changedTitelAppBar(moudlesLabelOrderStauts[indexGridOrder]);
    }

    controolHome.jumbTo();

    indexModulesOrder = index;

    update([order]);
  }

  bool willPopOrder() {
    if (indexModulesOrder == 0) {
      controolHome.changedIndexMain(0);
      return false;
    }

    changedIndexOrder(indexModulesOrder - 1);

    return false;
  }

  static String order = 'order';

  void changedTite(index) {
    switch (index) {
      case 0:
        titel = "0";
      case 1:
        titel = "1";
      case 2:
        titel = "2";
      case 3:
        titel = "3";
      case 4:
        titel = "4";
      case 5:
        titel = "5";
      case 6:
        titel = "6";
      case 7:
        titel = "4";
    }
  }
}
