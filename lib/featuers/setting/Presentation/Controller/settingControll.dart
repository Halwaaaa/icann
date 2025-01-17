import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:ican/core/Loction/textApp.dart';
import 'package:ican/core/Models/UserModels.dart';
import 'package:ican/core/services/hivenServices.dart';
import 'package:ican/core/utlies/Modules/MoudulesSetting.dart';
import 'package:ican/core/utlies/enum/enumPermation.dart';
import 'package:ican/featuers/AppBar/Presentation/controll/AppbarControll.dart';
import 'package:ican/featuers/home/Presentation/controol/OrderControll.dart';
import 'package:ican/featuers/mainLayout/Presentation/Controll/mainLayoutcontroll.dart';
import 'package:ican/featuers/setting/Presentation/Controller/GroupControol.dart';
import 'package:ican/featuers/setting/Presentation/Controller/LeaderGroupControll.dart';
import 'package:ican/featuers/setting/Presentation/Controller/RepoteControol.dart';
import 'package:ican/featuers/setting/Presentation/Controller/StateLaederControll.dart';
import 'package:ican/featuers/setting/Presentation/Controller/countersLaederAndStaff.dart';
import 'package:ican/featuers/setting/Presentation/widget/GridSetting.dart';
import 'package:ican/featuers/setting/Presentation/widget/item/Group/GroupMain.dart';
import 'package:ican/featuers/setting/Presentation/widget/item/GroupLeaderAndStaiff/LeaderGroupAndStiffMain.dart';
import 'package:ican/featuers/setting/Presentation/widget/item/OrderAdd/ListAddOrder.dart';
import 'package:ican/featuers/setting/Presentation/widget/item/Repote/RepoteMain.dart';

class SettingControll extends GetxController {
  late int indexModulesSetting;
  late AppBarControll appBarControll;
  late Mainlayoutcontroll mainlayoutcontroll;
  late CountersLaederControll countersLaederControll;
  late StateLaederControll stateLaederControll;
  late bool? isStiff;

  static String setting = 'setting';
  @override
  void onInit() {
    indexModulesSetting = 0;
    isStiff = null;

    super.onInit();
  }

  @override
  void onReady() {
    appBarControll = Get.find();
    mainlayoutcontroll = Get.find();
    appBarControll.changedTitelAppBar(AppText.setting.tr);
    countersLaederControll = Get.put(
      CountersLaederControll(),
    );
    stateLaederControll = Get.put(
      StateLaederControll(),
    );
    // TODO: implement onReady
    super.onReady();
  }

  bool onWillpop() {
    if (indexModulesSetting == 0) {
      mainlayoutcontroll.selectedNewScrean(0);
      return false;
    }
    if (modulesSetting()[indexModulesSetting] == AppText.group.tr) {
      GroupSControol groupSControol = Get.find();
      if (groupSControol.indexModulesGroup == 0) {
        changedIndex(0);
        return false;
      }
      groupSControol.changedIndexModulesGroup(0);
      return false;
    }
    if (modulesSetting()[indexModulesSetting] == AppText.groupLeader.tr ||
        modulesSetting()[indexModulesSetting] == 'الموظفين') {
      LeaderGroupControll leaderGroupControll = Get.find();
      print(leaderGroupControll.indexmodulesLeaderGroup);

      if (leaderGroupControll.indexmodulesLeaderGroup == 0) {
        changedIndex(0);
        return false;
      }
      leaderGroupControll.changedIndexModulesLeaderGroup(0, true);
      return false;
    }
    if (modulesSetting()[indexModulesSetting] == AppText.reports.tr) {
      RepoteControol repoteControol = Get.find();
      if (repoteControol.indexModulesRepote == 0) {
        changedIndex(0);
        return false;
      }
    }
    changedIndex(0);
    return false;
  }

  void changedIndex(int index) {
    if (modulesSetting()[index] == AppText.groupLeader.tr) isStiff = false;
    if (modulesSetting()[index] == 'الموظفين') isStiff = true;
    appBarControll.changedTitelAppBar(modulesSetting()[index]);
    mainlayoutcontroll.scrollcontroller?.jumpTo(0);
    indexModulesSetting = index;
    update([setting]);
  }

  List<Widget> itemModulesSetting() {
    List<Widget> item = [];
    item.add(GridSetting());
    HivenServices hivenServices = Get.find();
    User? user = hivenServices.userbox.get(HivenServices.user);
    if (user!.permation.contains(enumPermation.addGroup.label) ||
        user.permation.contains(enumPermation.editGroup.label)) {
      item.add(GroupSMain());
    }
    if (user.permation.contains(enumPermation.addLeaders.label) ||
        user.permation.contains(enumPermation.editLeaders.label)) {
      item.add(LeaderGroupAndStaiffMain());
    }
    if (user.permation.contains(enumPermation.addStaff.label) ||
        user.permation.contains(enumPermation.editStaff.label)) {
      item.add(LeaderGroupAndStaiffMain());
    }

    item.add(RepoteMain());
    if (user.permation.contains(enumPermation.addOrder.label)) {
      item.add(ListAddOrder());
    }
    return item;
  }

  // [
  //   const ,
  //   const GroupSMain(),
  //   const LeaderGroupAndStaiffMain(),
  //   const LeaderGroupAndStaiffMain(),
  //   const RepoteMain(),
  //   ListAddOrder(),
  // ];
  void scrollToIndex(int index) {
    final Mainlayoutcontroll mainlayoutcontroll = Get.find();
    const itemHeight = 85.0; // ارتفاع العنصر مع الحواف
    final targetOffset = index * itemHeight;
    //print(mainlayoutcontroll.scrollcontroller!.offset - targetOffset);
    mainlayoutcontroll.scrollcontroller?.animateTo(
      targetOffset,
      duration: const Duration(microseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}
