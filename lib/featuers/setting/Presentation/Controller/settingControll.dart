import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:ican/core/Loction/textApp.dart';
import 'package:ican/core/utlies/Modules/MoudulesSetting.dart';
import 'package:ican/featuers/AppBar/Presentation/controll/AppbarControll.dart';
import 'package:ican/featuers/home/Presentation/widget/Item/Group/groupMain.dart';
import 'package:ican/featuers/mainLayout/Presentation/Controll/mainLayoutcontroll.dart';
import 'package:ican/featuers/setting/Presentation/Controller/GroupControol.dart';
import 'package:ican/featuers/setting/Presentation/widget/GridSetting.dart';
import 'package:ican/featuers/setting/Presentation/widget/item/Group/GroupMain.dart';

class SettingControll extends GetxController {
  late int indexModulesSetting;
  late AppBarControll appBarControll;
  late Mainlayoutcontroll mainlayoutcontroll;

  static String setting = 'setting';
  @override
  void onInit() {
    indexModulesSetting = 0;

    super.onInit();
  }

  @override
  void onReady() {
    appBarControll = Get.find();
    mainlayoutcontroll = Get.find();
    appBarControll.changedTitelAppBar(AppText.setting.tr);
    // TODO: implement onReady
    super.onReady();
  }

  bool onWillpop() {
    if (indexModulesSetting == 0) {
      mainlayoutcontroll.selectedNewScrean(0);
    }
    if (indexModulesSetting == 1) {
      GroupSControol groupSControol = Get.find();
      if (groupSControol.indexModulesGroup == 0) {
        changedIndex(0);
        return false;
      }
      groupSControol.changedIndexModulesGroup(0);
      return false;
    }
    return false;
  }

  void changedIndex(int index) {
    appBarControll.changedTitelAppBar(modulesSetting[index]);
    indexModulesSetting = index;
    update([setting]);
  }

  List<Widget> itemModulesSetting = [
    const GridSetting(),
    const GroupSMain(),
  ];
}
