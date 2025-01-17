import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ican/core/Loction/textApp.dart';
import 'package:ican/core/Models/UserModels.dart';
import 'package:ican/core/services/hivenServices.dart';
import 'package:ican/core/utlies/Modules/ModulesHome.dart';
import 'package:ican/core/utlies/enum/enumPermation.dart';
import 'package:ican/core/utlies/enum/eunm.dart';
import 'package:ican/featuers/AppBar/Presentation/controll/AppbarControll.dart';
import 'package:ican/featuers/Responses/Presentation/controll/ResponsesControll.dart';
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
  late int? idGroupSelected;

  @override
  void onInit() {
    // TODO: implement onInit
    indexModulesMain = 0;
    enumControll = enumCategory.Mian;
    idGroupSelected = null;

    super.onInit();
  }

  @override
  onReady() {
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

  List<enumPermation> permationHome = [];

  List<Widget> ietmofModules() {
    List<Widget> result = [MainGrid()];
    HivenServices hivenServices = Get.find();
    User? user = hivenServices.userbox.get(HivenServices.user);
    if (user!.permation.contains(enumPermation.customers.label)) {
      result.add(CustomerMain(
        isCustmor: true,
      ));
    }
    if (user.permation.contains(enumPermation.staffs.label)) {
      result.add(CustomerMain(isCustmor: false));
    }
    if (user.permation.contains(enumPermation.groups.label)) {
      result.add(GroupMain());
    }
    if (user.permation.contains(enumPermation.orders.label)) {
      result.add(OrderMain());
    }
    result.add(AcountMain());
    print(result.length);
    return result;
  }

  Future<bool> onWillpop() async {
    if (indexModulesMain == 0) {
      print("ddd");
      SystemNavigator.pop();

      return true;
    }
    if (modulesCategoryAppbar()[indexModulesMain] ==
        enumCategory.CustomerManagement.label) {
      final CustmorAndStaffControll custmorAndStaffControll = Get.find();
      return custmorAndStaffControll.willPopCustmor();
    }
    if (modulesCategoryAppbar()[indexModulesMain] == "الموظفين") {
      print("لموظفي");
      final CustmorAndStaffControll custmorAndStaffControll = Get.find();
      return custmorAndStaffControll.willPopCustmor();
    }
    if (modulesCategoryAppbar()[indexModulesMain] == enumCategory.Gruop.label) {
      final GroupControll groupControll = Get.find();
      return groupControll.willPopGroup();
    }
    // if (indexModulesMain == 3) {
    //   final AcountingControll countingControll = Get.find();
    //   return countingControll.onWillPop();
    // }
    if (modulesCategoryAppbar()[indexModulesMain] ==
        enumCategory.OrderStatus.label) {
      final Ordercontroll ordercontroll = Get.find();
      return ordercontroll.willPopOrder();
    }
    // if (indexModulesMain == 5) {
    //   final ArchiveControll archiveControll = Get.find();
    //   return archiveControll.onWillPop();
    // }
    if (modulesCategoryAppbar()[indexModulesMain] ==
        enumCategory.Account.label) {
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
    print("kkkkkk");
    indexModulesMain = index;
    appBarControll.changedTitelAppBar(modulesCategoryAppbar()[index]);

    update([home]);
  }

  void jumbTo() {
    mainlayoutcontroll = Get.find();

    mainlayoutcontroll.scrollcontroller?.jumpTo(0);
  }

  void setIDGroupSlelcted(int id) {
    idGroupSelected = id;
  }

  static String home = 'home';
  static String custmor = 'custmor';
  static String group = 'custmor';
  static String order = 'order';
}
