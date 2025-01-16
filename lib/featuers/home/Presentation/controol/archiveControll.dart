import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ican/core/Loction/textApp.dart';
import 'package:ican/core/utlies/enum/eunm.dart';
import 'package:ican/featuers/AppBar/Presentation/controll/AppbarControll.dart';
import 'package:ican/featuers/home/Presentation/controol/OrderControll.dart';
import 'package:ican/featuers/home/Presentation/controol/controolHome.dart';
import 'package:ican/featuers/home/Presentation/widget/Item/order/itemOrderSatus.dart';
import 'package:ican/featuers/home/Presentation/widget/grid/Archive/ArchiveMain.dart';

class ArchiveControll extends GetxController {
  late int indexArchiveMoudels;
  late int indexGridArchive;
  late ControolHome controolHome;
  late AppBarControll appBarControll;
  static String archive = 'archive';
  @override
  void onInit() {
    indexArchiveMoudels = 0;
    indexGridArchive = 0;
    controolHome = Get.find();
    appBarControll = Get.find();
    controolHome.changedEunms(enumCategory.ArchiveStorage);
    super.onInit();
  }

  @override
  void onReady() {
    controolHome.jumbTo();
    super.onReady();
  }

  List<Widget> itemMoudlesArchive = [
    const ArchiveGrid(),
    const OrderMain(),
  ];
  List<String> moudelsGrid = [
    AppText.deliveredArchive.tr,
    AppText.returnedArchive.tr,
  ];
  changedAppBarTitel(int indexGrid) {
    indexGridArchive = indexGrid;
    appBarControll.changedTitelAppBar(moudelsGrid[indexGrid]);
  }

  void changedArchiveIndex(int index) {
    controolHome.jumbTo();

    indexArchiveMoudels = index;
    update([archive]);
  }

  bool onWillPop() {
    print(indexArchiveMoudels);

    if (indexArchiveMoudels == 1) {
      return willPopOnOrder();
    }
    if (indexArchiveMoudels == 0) {
      controolHome.changedIndexMain(0);
      return false;
    }

    changedArchiveIndex(indexArchiveMoudels - 1);
    return false;
  }

  bool willPopOnOrder() {
    final Ordercontroll ordercontroll = Get.find();
    if (ordercontroll.indexModulesOrder == 0) {
      appBarControll.changedTitelAppBar(AppText.ArchiveStorage.tr);
      changedArchiveIndex(0);
      return false;
    }
    return willPopOrder(ordercontroll);
    // return false;
  }

  bool willPopOrder(Ordercontroll ordercontroll) {
    if (ordercontroll.indexModulesOrder == 0) {
      controolHome.changedIndexMain(0);
      return false;
    }
    if (ordercontroll.indexModulesOrder == 1) {
      appBarControll.changedTitelAppBar(moudelsGrid[indexGridArchive]);
    }
    ordercontroll.changedIndexOrder(ordercontroll.indexModulesOrder - 1);

    return false;
  }
}
