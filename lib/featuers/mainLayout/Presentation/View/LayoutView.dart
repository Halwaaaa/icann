import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ican/featuers/AppBar/Presentation/widget/ShapOfAppBarHome.dart';
import 'package:ican/featuers/AppBar/Presentation/controll/AppbarControll.dart';
import 'package:ican/featuers/AppBar/Presentation/controll/SearchControll.dart';
import 'package:ican/featuers/home/Presentation/controol/controolHome.dart';
import 'package:ican/featuers/AppBar/Presentation/view/appBarHome.dart';
import 'package:ican/featuers/mainLayout/Presentation/Controll/mainLayoutcontroll.dart';

class LayoutView extends StatelessWidget {
  const LayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    final Mainlayoutcontroll mainlayoutcontroll = Get.find();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: CustomScrollView(
          controller: mainlayoutcontroll.scrollcontroller,
          slivers: [
            GetBuilder<AppBarControll>(
                id: AppBarControll.titelAppbar1,
                builder: (controller) {
                  return AppBarHome(
                    appBarControll: controller,
                  );
                }),
            GetBuilder<AppBarControll>(
                id: AppBarControll.appbar,
                builder: (controller) {
                  return ShapOfAppBarHome(
                    appBarControll: controller,
                  );
                }),
            GetBuilder<Mainlayoutcontroll>(
                // id: ControolHome.home,
                builder: (controller) {
              return controller.itemMoudulesMain[controller.indexSelected];

              //  gridCategories(itemWidth: itemWidth, itemHeight: itemHeight, crossAxisCount: crossAxisCount);
            }),
          ],
        ),
      ),
    );
  }
}
