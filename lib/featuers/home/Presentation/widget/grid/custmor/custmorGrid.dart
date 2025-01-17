import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ican/core/utlies/Modules/ModulesHome.dart';
import 'package:ican/featuers/home/Presentation/controol/controolHome.dart';
import 'package:ican/featuers/home/Presentation/controol/custmorGrid.dart';
import 'package:ican/core/compnated/gridCategories.dart';
import 'package:ican/core/compnated/DafultGrid.dart';

class CustmorGrid extends StatelessWidget {
  const CustmorGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final CustmorAndStaffControll custmorAndStaffControll = Get.find();

    List<String> titel = modulesCategoryCustmor;
    List<String> icon = modulesIconCustmor;

    return DafultGrid(
      title: titel,
      icon1: icon,
      isText: false,
      onTap: (index) {
        custmorAndStaffControll.changedIndexGridCustmor(index);
        custmorAndStaffControll.changedIndexCustmor(index + 2);
      },
    );
  }
}
