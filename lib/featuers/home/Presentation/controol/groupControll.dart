import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ican/core/Loction/textApp.dart';
import 'package:ican/core/utlies/Modules/ModulesHome.dart';
import 'package:ican/core/utlies/enum/eunm.dart';
import 'package:ican/featuers/AppBar/Presentation/controll/AppbarControll.dart';
import 'package:ican/featuers/AppBar/Presentation/controll/custmorControll.dart';
import 'package:ican/featuers/home/Presentation/controol/OrderControll.dart';
import 'package:ican/featuers/home/Presentation/controol/acountControll.dart';
import 'package:ican/featuers/home/Presentation/controol/archiveControll.dart';
import 'package:ican/featuers/home/Presentation/controol/controolHome.dart';
import 'package:ican/featuers/home/Presentation/controol/countingControll.dart';
import 'package:ican/featuers/home/Presentation/controol/custmorGrid.dart';
import 'package:ican/featuers/home/Presentation/widget/Item/Acount/AcountMain.dart';
import 'package:ican/featuers/home/Presentation/widget/Item/Acounting/CountingMain.dart';
import 'package:ican/featuers/home/Presentation/widget/Item/Archive/ArchiveMain.dart';
import 'package:ican/featuers/home/Presentation/widget/Item/Group/ListGruop.dart';
import 'package:ican/featuers/home/Presentation/widget/Item/custmor/CustomerMain.dart';
import 'package:ican/featuers/home/Presentation/widget/Item/order/itemOrderSatus.dart';
import 'package:ican/featuers/home/Presentation/widget/grid/Group/groupGridInfomation.dart';

class GroupControll extends GetxController {
  late int indexModulesGroup;
  late ControolHome controolHome;
  late AppBarControll appBarControll;
  late int indexGridGroup;

  @override
  void onInit() {
    indexModulesGroup = 0;
    indexGridGroup = 0;
    controolHome = Get.find();
    appBarControll = Get.find();
    super.onInit();
  }

  @override
  void onReady() {
    controolHome.jumbTo();
    // TODO: implement onReady
    super.onReady();
  }

  List<Widget> itemMoudlesGroup = [
    const ListGruop(),
    const GroupGridInfomation(),
    const CustomerMain(),
    const CountingMain(),
    const OrderMain(),
    const ArchiveMain(),
    const ArchiveMain(),
    const AcountMain(),

    //   Acount()
  ];

  changedIndexGridGroup(int index) {
    indexGridGroup = index;
    appBarControll.changedTitelAppBar(modulesCategoryGroup[index]);
  }

  changedIndexGroup(int index) {
    if (index == 0 || index == 1) {
      appBarControll.changedTitelAppBar(AppText.group.tr);
    }
    controolHome.jumbTo();

    indexModulesGroup = index;

    update([group]);
  }

  bool willPopOrderOnGrup(Ordercontroll ordercontroll) {
    if (ordercontroll.indexModulesOrder == 0) {
      changedIndexGroup(1);
      return false;
    }

    ordercontroll.changedIndexOrder(ordercontroll.indexModulesOrder - 1);

    return false;
  }

  bool willPopGroup() {
    if (indexModulesGroup == 2) {
      final CustmorGridControll custmorControll = Get.find();
      return willPopCustmor(custmorControll);
    }
    if (indexModulesGroup == 3) {
      final AcountingControll acountingControll = Get.find();
      return willPopAcounting(acountingControll);
    }
    if (indexModulesGroup == 4) {
      final Ordercontroll ordercontroll = Get.find();
      return willPopOrderOnGrup(ordercontroll);
    }
    if (indexModulesGroup == 5 || indexGridGroup == 6) {
      final ArchiveControll archiveControll = Get.find();
      return willPopArchive(archiveControll);
    }
    if (indexModulesGroup == 7) {
      final AcountControll acountControll = Get.find();
      return willPopAcount(acountControll);
    }
    if (indexModulesGroup == 0) {
      controolHome.changedIndexMain(0);
      return false;
    }
    changedIndexGroup(indexModulesGroup - 1);

    return false;
  }

  static String group = 'group';

  bool willPopCustmor(CustmorGridControll custmorControll) {
    if (custmorControll.indexModulesCustmor == 0) {
      changedIndexGroup(1);
      return false;
    }
    return custmorControll.willPopCustmor();
  }

  bool willPopAcounting(AcountingControll acountingControll) {
    if (acountingControll.indexCountingMoudels == 0) {
      changedIndexGroup(1);
      return false;
    }
    return acountingControll.willPopAcounting();
  }

  bool willPopArchive(ArchiveControll archiveControll) {
    if (archiveControll.indexArchiveMoudels == 0) {
      changedIndexGroup(1);
      return false;
    }
    return archiveControll.onWillPop();
  }

  bool willPopAcount(AcountControll acountControll) {
    if (acountControll.indexAcountMoudels == 0) {
      changedIndexGroup(1);
      return false;
    }
    return acountControll.onWillPop();
  }
}
