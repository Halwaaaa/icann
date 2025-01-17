import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ican/featuers/AppBar/Presentation/widget/ShapOfAppBarHome.dart';
import 'package:ican/featuers/AppBar/Presentation/controll/AppbarControll.dart';
import 'package:ican/featuers/AppBar/Presentation/controll/SearchControll.dart';
import 'package:ican/featuers/home/Presentation/controol/controolHome.dart';
import 'package:ican/featuers/AppBar/Presentation/view/appBarHome.dart';

class HomeView1 extends StatelessWidget {
  const HomeView1({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ControolHome>(
        id: ControolHome.home,
        // init: ControolHome(),
        builder: (controller) {
          print("homr");
          return controller.ietmofModules()[controller.indexModulesMain];
        });

    //  gridCategories(itemWidth: itemWidth, itemHeight: itemHeight, crossAxisCount: crossAxisCount);
  }
}
