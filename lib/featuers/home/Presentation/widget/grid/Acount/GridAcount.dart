import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ican/core/utlies/Modules/ModulesHome.dart';
import 'package:ican/featuers/home/Presentation/controol/acountControll.dart';
import 'package:ican/featuers/home/Presentation/controol/controolHome.dart';
import 'package:ican/featuers/home/Presentation/controol/countingControll.dart';
import 'package:ican/core/compnated/gridCategories.dart';
import 'package:ican/core/compnated/DafultGrid.dart';

class GridAcount extends StatelessWidget {
  const GridAcount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final AcountControll acountControll = Get.find();
    List<String> titel = moudelsAcount;

    return DafultGrid(
        title: titel,
        onTap: (index) {
          acountControll.changedIndexGridAcount(index);
          acountControll.changedAcountIndex(index + 1);
        },
        titel1: "k");
  }
}
