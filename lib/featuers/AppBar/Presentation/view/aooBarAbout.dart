import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ican/core/Loction/textApp.dart';
import 'package:ican/core/compnated/Doctrion.dart';
import 'package:ican/core/utlies/color.dart';
import 'package:ican/core/utlies/appimage.dart';
import 'package:ican/core/utlies/textStyle.dart';
import 'package:ican/featuers/AppBar/Presentation/controll/AppbarControll.dart';
import 'package:ican/featuers/Drawrr/Presentation/controll/drawerControll.dart';
import 'package:ican/featuers/home/Presentation/controol/controolHome.dart';
import 'package:iconly/iconly.dart';

class AppBarAbout extends StatelessWidget {
  const AppBarAbout({
    super.key,
    required this.appBarControll,
  });
  final AppBarControll appBarControll;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
        backgroundColor: AppColor.primaryAppbar,
        automaticallyImplyLeading: false,
        // AppColor.SacendPrimary,
        elevation: 0.0,
        floating: false,
        pinned: true,
        snap: false,
        toolbarHeight: 70,
        expandedHeight: 100,
        actions: [
          IconButton(
              padding: const EdgeInsets.only(top: 30),
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back,
                textDirection: TextDirection.ltr,
              ))
        ],
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {
                    print("hjk");
                    final DrawerControllMain drawerControllMain = Get.find();
                    drawerControllMain.openDrawer();
                  },
                  icon: const Icon(Icons.menu_sharp)),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.notifications_outlined)),
            ],
          ),
        ),
        flexibleSpace: LayoutBuilder(builder: (context, constraints) {
          double appBarHeight = constraints.biggest.height;
          double t = (appBarHeight - kToolbarHeight) / (130 - kToolbarHeight);
          double imageSize = 40 + (40 * t);
          if (appBarHeight < 120) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              appBarControll.ChangedisAppBarDone(true);
            });
          } else {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              appBarControll.ChangedisAppBarDone(false);
            });
          }

          return FlexibleSpaceBar(
              centerTitle: true,
              expandedTitleScale: 1,
              title: Opacity(
                opacity: appBarHeight < 120 ? 1 : 0,
                child: Text(
                  appBarControll.titelAppBar,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
              background: Stack(
                fit: StackFit.loose,
                children: [
                  Positioned(
                    top: 20,
                    left: constraints.maxWidth / 2 - 50,
                    child: SizedBox(
                      width: imageSize,
                      height: imageSize,
                      child: Image.asset(
                        AppImageName.logo,
                        color: Colors.white,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: imageSize + 20,
                    left: 0,
                    right: 0,
                    child: Opacity(
                      opacity: t.clamp(0.0, 1.0),
                      child: Text(
                        appBarControll.titelAppBar,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ));
        }));
  }
}
