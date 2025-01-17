import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ican/core/compnated/DafultGrid.dart';
import 'package:ican/core/utlies/Modules/ModulesHome.dart';
import 'package:ican/featuers/AppBar/Presentation/controll/SearchControll.dart';
import 'package:ican/featuers/home/Presentation/controol/controolHome.dart';
import 'package:ican/core/compnated/gridCategories.dart';

class MainGrid extends StatelessWidget {
  const MainGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ControolHome>(
        id: ControolHome.home,
        builder: (controolHome) {
          List<String> titel = modulesCategoryMain();
          List<String> icon = modulesIconMain();

          return DafultGrid(
            onTap: (index) {
              controolHome.changedIndexMain(index + 1);
            },
            icon1: icon,
            isText: false,
            title: titel,
          );
        });
  }
}
