import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ican/core/Loction/textApp.dart';
import 'package:ican/core/utlies/Modules/ModulesHome.dart';
import 'package:ican/core/utlies/enum/eunm.dart';
import 'package:ican/featuers/AppBar/Presentation/controll/AppbarControll.dart';
import 'package:ican/featuers/home/Presentation/controol/OrderControll.dart';
import 'package:ican/featuers/home/Presentation/controol/acountControll.dart';
import 'package:ican/featuers/home/Presentation/controol/archiveControll.dart';
import 'package:ican/featuers/home/Presentation/controol/controolHome.dart';
import 'package:ican/featuers/home/Presentation/controol/countingControll.dart';
import 'package:ican/featuers/home/Presentation/widget/Item/Acount/AcountMain.dart';
import 'package:ican/featuers/home/Presentation/widget/Item/Acounting/CountingMain.dart';
import 'package:ican/featuers/home/Presentation/widget/Item/Archive/ArchiveMain.dart';
import 'package:ican/featuers/home/Presentation/widget/Item/custmor/CousmtorList.dart';
import 'package:ican/featuers/home/Presentation/widget/Item/order/itemOrderSatus.dart';
import 'package:ican/featuers/home/Presentation/widget/grid/custmor/custmorGrid.dart';

class CustmorGridControll extends GetxController {
  late int indexModulesCustmor;

  late ControolHome controolHome;
  late int indexGridCustmor;
  late AppBarControll appBarControll;
  @override
  void onInit() {
    indexModulesCustmor = 0;
    indexGridCustmor = 0;
    appBarControll = Get.find();
    controolHome = Get.find();
    controolHome.changedEunms(enumCategory.CustomerManagement);
    super.onInit();
  }

  @override
  void onReady() {
    controolHome.jumbTo();
    super.onReady();
  }

  void changedIndexGridCustmor(int index) {
    appBarControll.changedTitelAppBar(modulesCategoryCustmor[index]);
  }

  List<Widget> itemMoudlesCustmor = [
    const CousmtorList(),
    const CustmorGrid(),
    const CountingMain(),
    const OrderMain(),
    const ArchiveMain(),
    const ArchiveMain(),
    const AcountMain()
  ];

  changedIndexCustmor(int index) {
    if (index == 1) {
      appBarControll.changedTitelAppBar(AppText.customers.tr);
    }
    controolHome.jumbTo();
    indexModulesCustmor = index;

    update([cusmtor]);
  }

  willPopCustmor() {
    if (indexModulesCustmor == 2) {
      AcountingControll acountingControll = Get.find();
      return willPopAcounting(acountingControll);
    }
    if (indexModulesCustmor == 3) {
      final Ordercontroll ordercontroll = Get.find();
      return willPopOnOrder(ordercontroll);
    }
    if (indexModulesCustmor == 4 || indexModulesCustmor == 5) {
      return willPopArchive();
    }
    if (indexModulesCustmor == 6) {
      AcountControll acountControll = Get.find();
      return willPopAcount(acountControll);
    }

    if (indexModulesCustmor == 0) {
      controolHome.changedIndexMain(0);
      return false;
    }

    //}

    changedIndexCustmor(indexModulesCustmor - 1);
    return false;
  }

  bool willPopArchive() {
    final ArchiveControll archiveControll = Get.find();
    if (archiveControll.indexArchiveMoudels == 0) {
      changedIndexCustmor(1);
      return false;
    }
    archiveControll.onWillPop();
    return false;
  }

  static String cusmtor = 'custmor';

  bool willPopOnOrder(Ordercontroll ordercontroll) {
    if (ordercontroll.indexModulesOrder == 0) {
      changedIndexCustmor(1);
      return false;
    }
    ordercontroll.changedIndexOrder(ordercontroll.indexModulesOrder - 1);
    return false;
  }

  bool willPopAcounting(AcountingControll acountingControll) {
    if (acountingControll.indexCountingMoudels == 0) {
      changedIndexCustmor(1);
      return false;
    }
    acountingControll.onWillPop();
    // acountControll.onWillPop();
    return false;
  }

  willPopAcount(AcountControll acountControll) {
    if (acountControll.indexAcountMoudels == 0) {
      changedIndexCustmor(1);
      return false;
    }
    acountControll.onWillPop();
    // acountControll.onWillPop();
    return false;
  }
}
