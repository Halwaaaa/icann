import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ican/core/compnated/DafultGrid.dart';
import 'package:ican/core/utlies/Modules/ModulesHome.dart';
import 'package:ican/core/utlies/Modules/MoudulesSetting.dart';
import 'package:ican/featuers/home/Presentation/controol/controolHome.dart';
import 'package:ican/core/compnated/gridCategories.dart';
import 'package:ican/featuers/setting/Presentation/Controller/settingControll.dart';

class GridSetting extends StatelessWidget {
  const GridSetting({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> titel = modulesSettingtitel();
    final List<String> icon = modulesSettingIconName();
    final SettingControll settingControll = Get.find();

    return DafultGrid(
      onTap: (index) {
        settingControll.changedIndex(index + 1);
        //controolHome.changedIndexMain(index + 1);
      },
      icon1: icon,
      isText: false,
      title: titel,
    );
  }
}
