import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ican/core/Loction/textApp.dart';
import 'package:ican/core/utlies/Modules/ModulesHome.dart';
import 'package:ican/core/utlies/enum/eunm.dart';
import 'package:ican/featuers/AppBar/Presentation/controll/AppbarControll.dart';
import 'package:ican/featuers/home/Presentation/controol/OrderControll.dart';
import 'package:ican/featuers/home/Presentation/controol/acountControll.dart';
import 'package:ican/featuers/home/Presentation/controol/archiveControll.dart';
import 'package:ican/featuers/home/Presentation/controol/countingControll.dart';
import 'package:ican/featuers/home/Presentation/controol/custmorGrid.dart';
import 'package:ican/featuers/home/Presentation/controol/groupControll.dart';
import 'package:ican/featuers/home/Presentation/widget/Item/Acount/AcountMain.dart';
import 'package:ican/featuers/home/Presentation/widget/Item/Archive/ArchiveMain.dart';
import 'package:ican/featuers/home/Presentation/widget/Item/custmor/CustomerMain.dart';
import 'package:ican/featuers/home/Presentation/widget/Item/Group/groupMain.dart';
import 'package:ican/featuers/home/Presentation/widget/Item/Acounting/CountingMain.dart';
import 'package:ican/featuers/home/Presentation/widget/Item/order/itemOrderSatus.dart';
import 'package:ican/featuers/home/Presentation/widget/grid/mainGrid.dart';
import 'package:ican/featuers/mainLayout/Presentation/Controll/mainLayoutcontroll.dart';

// ignore: deprecated_member_use
class ControolHome extends GetxController with SingleGetTickerProviderMixin {
  late int indexModulesMain;
  late enumCategory enumControll;
  late AppBarControll appBarControll;
  late Mainlayoutcontroll mainlayoutcontroll;

  @override
  void onInit() {
    // TODO: implement onInit
    indexModulesMain = 0;
    enumControll = enumCategory.Mian;

    super.onInit();
  }

  @override
  onReady() {
    mainlayoutcontroll = Get.find();
    appBarControll = Get.find();

    super.onReady();
  }

  changedEunms(enumCategory e) {
    print(e);
    enumControll = e;
  }

  @override
  void onClose() {
    // scrollController?.dispose();
    super.onClose();
  }

  List<Widget> ietmofModules = [
    const MainGrid(),
    const CustomerMain(),
    const GroupMain(),
    const CountingMain(),
    const OrderMain(),
    const ArchiveMain(),
    const CustomerMain(),
    const AcountMain(),
    const CustomerMain(),
    const CustomerMain(),
    const CustomerMain(),
    const CustomerMain(),
    const CustomerMain(),
    const CustomerMain(),
    const CustomerMain(),
  ];
  Future<bool> onWillpop() async {
    if (indexModulesMain == 1) {
      final CustmorGridControll custmorGridControll = Get.find();
      return custmorGridControll.willPopCustmor();
    }
    if (indexModulesMain == 2) {
      final GroupControll groupControll = Get.find();
      return groupControll.willPopGroup();
    }
    if (indexModulesMain == 3) {
      final AcountingControll countingControll = Get.find();
      return countingControll.onWillPop();
    }
    if (indexModulesMain == 4) {
      final Ordercontroll ordercontroll = Get.find();
      return ordercontroll.willPopOrder();
    }
    if (indexModulesMain == 5) {
      final ArchiveControll archiveControll = Get.find();
      return archiveControll.onWillPop();
    }
    if (indexModulesMain == 7) {
      final AcountControll acountControll = Get.find();
      return acountControll.onWillPop();
    }

    return true;
  }
  // enumCategory.CustomerManagement.label,
  // enumCategory.Gruop.label,
  // enumCategory.Accounting.label,
  // enumCategory.OrderStatus.label,
  //   enumCategory.ArchiveStorage.label,

  // enumCategory.Review.label,
  //   enumCategory.Account.label,
  void changedIndexMain(int index) {
    indexModulesMain = index;
    print(indexModulesMain);

    update([home]);
    appBarControll.changedTitelAppBar(modulesCategoryAppbar[index]);
  }

  void jumbTo() {
    mainlayoutcontroll.scrollcontroller?.jumpTo(0);
  }

  static String home = 'home';
  static String custmor = 'custmor';
  static String group = 'custmor';
  static String order = 'order';
}
