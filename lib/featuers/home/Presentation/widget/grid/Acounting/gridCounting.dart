import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ican/core/utlies/Modules/ModulesHome.dart';
import 'package:ican/featuers/home/Presentation/controol/controolHome.dart';
import 'package:ican/featuers/home/Presentation/controol/countingControll.dart';
import 'package:ican/core/compnated/gridCategories.dart';
import 'package:ican/core/compnated/DafultGrid.dart';

class GridCounting extends StatelessWidget {
  const GridCounting({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final AcountingControll countingControll = Get.find();

    List<String> titel = countingControll.moudelsGrid;
    List<String> icon = List.filled(countingControll.moudelsGrid.length, "2");

    return DafultGrid(
      title: titel,
      onTap: (index) {
        countingControll.changedIndexGridAcounting(index);
        countingControll.changedCountingIndex(1);
      },
    );
  }
}
