import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ican/core/utlies/Modules/ModulesHome.dart';
import 'package:ican/featuers/home/Presentation/controol/controolHome.dart';
import 'package:ican/featuers/home/Presentation/controol/groupControll.dart';
import 'package:ican/core/compnated/gridCategories.dart';
import 'package:ican/core/compnated/DafultGrid.dart';

class GroupGridInfomation extends StatelessWidget {
  const GroupGridInfomation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final GroupControll groupControll = Get.find();
    List<String> titel = modulesCategoryGroup;
    List<String> icon = modulesIconGroup;

    return DafultGrid(
        title: modulesCategoryGroup,
        icon1: icon,
        isText: false,
        onTap: (index) {
          groupControll.changedIndexGridGroup(index);
          groupControll.changedIndexGroup(index + 2);
        },
        titel1: "xx");
  }
}
