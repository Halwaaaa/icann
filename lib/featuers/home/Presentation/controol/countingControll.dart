import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ican/core/Loction/textApp.dart';
import 'package:ican/core/utlies/enum/eunm.dart';
import 'package:ican/featuers/AppBar/Presentation/controll/AppbarControll.dart';
import 'package:ican/featuers/home/Presentation/controol/OrderControll.dart';
import 'package:ican/featuers/home/Presentation/controol/controolHome.dart';
import 'package:ican/featuers/home/Presentation/widget/Item/order/itemOrderSatus.dart';
import 'package:ican/featuers/home/Presentation/widget/grid/Acounting/gridCounting.dart';

class AcountingControll extends GetxController {
  late int indexCountingMoudels;
  late ControolHome controolHome;
  late int indexGridAcounting;
  late AppBarControll appBarControll;
  static String counting = 'Counting';
  @override
  void onInit() {
    indexCountingMoudels = 0;
    indexGridAcounting = 0;
    appBarControll = Get.find();
    super.onInit();
  }

  @override
  void onReady() {
    controolHome = Get.find();
    controolHome.changedEunms(enumCategory.Accounting);
    controolHome.jumbTo();
    super.onReady();
  }

  void changedIndexGridAcounting(int index) {
    indexGridAcounting = index;
    appBarControll.changedTitelAppBar(moudelsGrid[index]);
  }

  List<Widget> itemMoudlesCounting = [
    const GridCounting(),
    const OrderMain(),
    //const CustmorGridInfomation(),
  ];
  List<String> moudelsGrid = [
    AppText.delegateAccountable.tr,
    AppText.branchReceiverBilled.tr,
    AppText.branchSenderBilled.tr,
    AppText.clientBilled.tr,
  ];

  void changedCountingIndex(int index) {
    controolHome.jumbTo();

    indexCountingMoudels = index;
    update([counting]);
  }

  bool onWillPop() {
    if (indexCountingMoudels == 1) {
      return willPopAcounting();
    }

    if (indexCountingMoudels == 0) {
      controolHome.changedIndexMain(0);
      return false;
    }
    changedCountingIndex(indexCountingMoudels - 1);
    return false;
  }

  bool willPopAcounting() {
    final Ordercontroll ordercontroll = Get.find();
    if (ordercontroll.indexModulesOrder == 0) {
      appBarControll.changedTitelAppBar(AppText.Accounting.tr);
      changedCountingIndex(0);
      return false;
    }
    return willPopOrder(ordercontroll);
    //return false;
  }

  bool willPopOrder(Ordercontroll ordercontroll) {
    if (ordercontroll.indexModulesOrder == 0) {
      controolHome.changedIndexMain(0);
      return false;
    }
    if (ordercontroll.indexModulesOrder == 1) {
      appBarControll.changedTitelAppBar(moudelsGrid[indexGridAcounting]);
    }
    ordercontroll.changedIndexOrder(ordercontroll.indexModulesOrder - 1);

    return false;
  }
}
