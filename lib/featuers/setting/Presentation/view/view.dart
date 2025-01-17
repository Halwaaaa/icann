import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ican/featuers/setting/Presentation/Controller/settingControll.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingControll>(
        init: SettingControll(),
        id: SettingControll.setting,
        builder: (settingControll) {
          return settingControll
              .itemModulesSetting()[settingControll.indexModulesSetting];
        });
  }
}
