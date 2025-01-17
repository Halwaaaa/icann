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
import 'package:ican/featuers/home/Date/Local/LocalCustmor.dart';
import 'package:ican/featuers/home/Date/Remote/RemoteAllCustmor.dart';
import 'package:ican/featuers/home/Presentation/controol/OrderControll.dart';
import 'package:ican/featuers/home/Presentation/controol/acountControll.dart';
import 'package:ican/featuers/home/Presentation/controol/archiveControll.dart';
import 'package:ican/featuers/home/Presentation/controol/controolHome.dart';
import 'package:ican/featuers/home/Presentation/controol/countingControll.dart';
import 'package:ican/featuers/home/Presentation/models/CustmorAllUser.dart';
import 'package:ican/featuers/home/Presentation/widget/Item/Acount/AcountMain.dart';
import 'package:ican/featuers/home/Presentation/widget/Item/Acounting/CountingMain.dart';
import 'package:ican/featuers/home/Presentation/widget/Item/Archive/ArchiveMain.dart';
import 'package:ican/featuers/home/Presentation/widget/Item/custmor/CousmtorList.dart';
import 'package:ican/featuers/home/Presentation/widget/Item/order/itemOrderSatus.dart';
import 'package:ican/featuers/home/Presentation/widget/grid/custmor/custmorGrid.dart';

class CustmorAndStaffControll extends GetxController {
  late int indexModulesCustmor;
  static String custmorListA = 'custmorListA';

  late ControolHome controolHome;
  late LocalAllCustmor localAllCustmor;
  late Box<List<dynamic>> boxAllCustmor;
  late int indexGridCustmor;
  late AppBarControll appBarControll;
  late List<CustmorAlluser> custmorList;
  late bool loding;
  late int? idGroupSelected;

  Timer? t;

  List<CustmorAlluser> dfultCustmorList = [
    CustmorAlluser(
        id: 1, name: "ssssz", mobile_no: "0322", created_at: "sssx   dd"),
    CustmorAlluser(
        id: 1, name: "sssz", mobile_no: "0322", created_at: "sssssssx  dd"),
    CustmorAlluser(
        id: 1, name: "sssssssz", mobile_no: "0322", created_at: "sssx  dd"),
    CustmorAlluser(
        id: 1, name: "sssssz", mobile_no: "0322", created_at: "sssx  c"),
  ];

  @override
  Future<void> onInit() async {
    indexModulesCustmor = 0;
    indexGridCustmor = 0;
    loding = true;
    idGroupSelected = null;
    custmorList = dfultCustmorList;
    //await getLocalCustmor();
    super.onInit();
  }

  @override
  void onReady() {
    appBarControll = Get.find();
    controolHome = Get.find();
    controolHome.jumbTo();
    super.onReady();
  }

  void changedIndexGridCustmor(int index) {
    appBarControll.changedTitelAppBar(modulesCategoryCustmor[index]);
  }

  @override
  onClose() {
    t?.cancel();
    super.onClose();
  }

  List<Widget> itemMoudlesCustmor = [
    const CousmtorList(),
    // const CustmorGrid(),
    //  const CountingMain(),
    //  const OrderMain(),
    //  const ArchiveMain(),
    //  const ArchiveMain(),
    //  const AcountMain()
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
    // if (indexModulesCustmor == 2) {
    //   AcountingControll acountingControll = Get.find();
    //   return willPopAcounting(acountingControll);
    // }
    // if (indexModulesCustmor == 3) {
    //   final Ordercontroll ordercontroll = Get.find();
    //   return willPopOnOrder(ordercontroll);
    // }
    // if (indexModulesCustmor == 4 || indexModulesCustmor == 5) {
    //   return willPopArchive();
    // }
    // if (indexModulesCustmor == 6) {
    //   AcountControll acountControll = Get.find();
    //   return willPopAcount(acountControll);
    // }

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

  void setIdGroup(int id) {
    idGroupSelected = id;
  }

  Future<void> getLocalCustmor(bool isCustmor) async {
    loding = true;

    update([custmorListA]);
    final ControolHome controolHome = Get.find();
    bool isGroup = modulesCategoryAppbar()[controolHome.indexModulesMain] ==
        enumCategory.Gruop.label;
    bool isNullLocal = false;
    boxAllCustmor = await Hive.openBox<List<dynamic>>(
        isCustmor ? HivenServices.custmorAll : HivenServices.staff);
    Box<List<dynamic>> boxAllCustmorGroup =
        await Hive.openBox<List<dynamic>>(HivenServices.custmorAllGroup);
    localAllCustmor = LocalAllCustmor();
    List<CustmorAlluser>? local =
        await localAllCustmor.getCustmor(boxAllCustmor, isCustmor);
    List<int>? idGroup;
    if (isGroup) {
      idGroup = await localAllCustmor.getCustmorByIdGroup(
          controolHome.idGroupSelected!, boxAllCustmorGroup);
    }

    if (local != null) {
      loding = false;
      getCustmorList(isGroup, local, idGroup, isCustmor);

      update([custmorListA]);
    } else {
      isNullLocal = true;
      loding = true;
      custmorList = dfultCustmorList;
      update([custmorListA]);
    }
    getRemte(isNullLocal, isGroup, isCustmor);
  }

  void getCustmorList(bool isGroup, List<CustmorAlluser> local,
      List<int>? idGroup, bool isCustmor) {
    if (isGroup) {
      // custmorList = [];
      // local.forEach(
      //   (local) {
      //     idGroup?.forEach(
      //       (idGroup) {
      //         if (local.id == idGroup) {
      //           custmorList.add(local);
      //         }
      //       },
      //     );
      //   },
      // );
    } else {
      custmorList = local;
    }
  }

  Future<void> getRemte(bool isNullLoacl, bool isGroup, bool isCustmor) async {
    final ServicesDio servicesDio = Get.find();
    RemoteAllcustmor remoteAllcustmor = RemoteAllcustmor(servicesDio);

    List<CustmorAlluser>? result = await remoteAllcustmor.getCustmor(isCustmor);
    if (result != null) {
      loding = false;
      custmorList = result;
      localAllCustmor.setCustmor(result, boxAllCustmor, isCustmor);
      update([custmorListA]);
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
          List<CustmorAlluser>? result =
              await remoteAllcustmor.getCustmor(isCustmor);
          print(time.tick);
          if (result != null) {
            Get.snackbar(
              " ",
              "تم اعادة الاتصال",
              colorText: Colors.black,
              duration: const Duration(seconds: 5),
            );
            loding = false;
            custmorList = result;
            update([custmorListA]);
            time.cancel();
          }
        });
      }
    }
  }
}
