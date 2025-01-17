import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:ican/core/Loction/textApp.dart';
import 'package:ican/core/services/hivenServices.dart';
import 'package:ican/core/services/servicesDio.dart';
import 'package:ican/core/utlies/Modules/ModulesHome.dart';
import 'package:ican/core/utlies/enum/eunm.dart';
import 'package:ican/featuers/AppBar/Presentation/controll/AppbarControll.dart';
import 'package:ican/featuers/AppBar/Presentation/controll/custmorControll.dart';
import 'package:ican/featuers/home/Date/Local/LocalGroup.dart';
import 'package:ican/featuers/home/Date/Remote/RemoteGroup.dart';
import 'package:ican/featuers/home/Presentation/controol/OrderControll.dart';
import 'package:ican/featuers/home/Presentation/controol/acountControll.dart';
import 'package:ican/featuers/home/Presentation/controol/archiveControll.dart';
import 'package:ican/featuers/home/Presentation/controol/controolHome.dart';
import 'package:ican/featuers/home/Presentation/controol/countingControll.dart';
import 'package:ican/featuers/home/Presentation/controol/custmorGrid.dart';
import 'package:ican/featuers/home/Presentation/models/GroupUser.dart';
import 'package:ican/featuers/home/Presentation/widget/Item/Acount/AcountMain.dart';
import 'package:ican/featuers/home/Presentation/widget/Item/Acounting/CountingMain.dart';
import 'package:ican/featuers/home/Presentation/widget/Item/Archive/ArchiveMain.dart';
import 'package:ican/featuers/home/Presentation/widget/Item/Group/ListGruop.dart';
import 'package:ican/featuers/home/Presentation/widget/Item/custmor/CustomerMain.dart';
import 'package:ican/featuers/home/Presentation/widget/Item/order/itemOrderSatus.dart';
import 'package:ican/featuers/home/Presentation/widget/grid/Group/groupGridInfomation.dart';
import 'package:ican/featuers/mainLayout/Presentation/Controll/mainLayoutcontroll.dart';
import 'package:ican/featuers/mainLayout/Presentation/View/mainLayout.dart';

class GroupControll extends GetxController {
  static String groupList = 'groupList';
  late int indexModulesGroup;
  late ControolHome controolHome;
  late AppBarControll appBarControll;
  late int indexGridGroup;
  // ignore: prefer_typing_uninitialized_variables
  late Box<List<dynamic>> boxGroup;
  late LocalGroup localGroup;
  late bool loding;
  late bool isNullLocale;
  late List<GroupUser> groupData;
  Timer? t;

  //<List<dy>>

  @override
  Future<void> onInit() async {
    indexModulesGroup = 0;
    indexGridGroup = 0;
    loding = true;
    groupData = groupDataDafult;
    isNullLocale = true;
    getLocalGroup();

    super.onInit();
  }

  @override
  void onReady() {
    controolHome = Get.find();
    appBarControll = Get.find();
    // TODO: implement onReady
    super.onReady();
  }

  @override
  onClose() {
    t?.cancel();
    super.onClose();
  }

  List<Widget> itemMoudlesGroup = [
    const ListGruop(),
    const GroupGridInfomation(),
    // const CustomerMain(),
    //const CountingMain(),
    const OrderMain(),
    // const ArchiveMain(),
    // const ArchiveMain(),
    //const AcountMain(),

    //   Acount()
  ];

  changedIndexGridGroup(int index) {
    indexGridGroup = index;
    appBarControll.changedTitelAppBar(modulesCategoryGroup[index]);
    update([group]);
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
    print("ff");
    print(indexModulesGroup);
    // if (indexModulesGroup == 2) {
    //   final CustmorGridControll custmorControll = Get.find();
    //   return willPopCustmor(custmorControll);
    // }
    // if (indexModulesGroup == 3) {
    //   final AcountingControll acountingControll = Get.find();
    //   return willPopAcounting(acountingControll);
    // }
    if (indexModulesGroup == 2) {
      final Ordercontroll ordercontroll = Get.find();
      return willPopOrderOnGrup(ordercontroll);
    }
    // if (indexModulesGroup == 5 || indexGridGroup == 6) {
    //   final ArchiveControll archiveControll = Get.find();
    //   return willPopArchive(archiveControll);
    // }
    // if (indexModulesGroup == 7) {
    //   final AcountControll acountControll = Get.find();
    //   return willPopAcount(acountControll);
    // }
    if (indexModulesGroup == 0) {
      print("object");
      final Mainlayoutcontroll mainlayoutcontroll = Get.find();
      // mainlayoutcontroll.selectedNewScrean(0);
      controolHome.changedIndexMain(0);
      return false;
    }
    changedIndexGroup(indexModulesGroup - 1);

    return false;
  }

  static String group = 'group';

  bool willPopCustmor(CustmorAndStaffControll custmorControll) {
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

  Future<void> getLocalGroup() async {
    bool isNullLocal = false;
    boxGroup = await Hive.openBox<List<dynamic>>(HivenServices.custmorAll);
    localGroup = LocalGroup(boxGroup);
    List<GroupUser>? local = await localGroup.getGroup();
    // if (local != null) {
    //   loding = false;
    //   groupData = local;
    //   update([groupList]);
    // } else {
    //   isNullLocal = true;
    //   loding = true;
    //   groupData = groupDataDafult;
    //   update([groupList]);
    // }
    getRemte(isNullLocal);
  }

  Future<void> getRemte(bool isNullLoacl) async {
    final ServicesDio servicesDio = Get.find();
    RemoteGroup remoteGroup = RemoteGroup(servicesDio);

    List<GroupUser>? result = await remoteGroup.getGroup();
    if (result != null) {
      loding = false;
      groupData = result;
      localGroup.setGroup(result);
      update([groupList]);
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
          List<GroupUser>? result = await remoteGroup.getGroup();
          print(time.tick);
          if (result != null) {
            Get.snackbar(
              " ",
              "تم اعادة الاتصال",
              colorText: Colors.black,
              duration: const Duration(seconds: 5),
            );
            loding = false;
            groupData = result;
            localGroup.setGroup(result);

            update([groupList]);
            time.cancel();
          }
        });
      }
    }
  }
}
