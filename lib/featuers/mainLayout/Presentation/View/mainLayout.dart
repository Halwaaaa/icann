import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ican/core/Loction/textApp.dart';
import 'package:ican/core/utlies/Modules/ModulesMain.dart';
import 'package:ican/core/utlies/color.dart';
import 'package:ican/core/utlies/textStyle.dart';
import 'package:ican/featuers/AppBar/Presentation/controll/AppbarControll.dart';
import 'package:ican/featuers/AppBar/Presentation/view/appBarHome.dart';
import 'package:ican/featuers/AppBar/Presentation/widget/ShapOfAppBarHome.dart';
import 'package:ican/featuers/Drawrr/Presentation/controll/drawerControll.dart';
import 'package:ican/featuers/Drawrr/Presentation/view/drawerView.dart';
import 'package:ican/featuers/home/Presentation/controol/controolHome.dart';
import 'package:ican/featuers/mainLayout/Presentation/Controll/mainLayoutcontroll.dart';
import 'package:iconly/iconly.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class MainlayoutView extends StatelessWidget {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  MainlayoutView({super.key});
  Widget _getIcon(int index, Color? colorsIcon) {
    switch (index) {
      case 0:
        return Icon(
          Icons.home,
          color: colorsIcon,
        );
      case 1:
        return Icon(
          Icons.settings,
          color: colorsIcon,
        );
      case 2:
        return Icon(
          IconlyBold.chat,
          color: colorsIcon,
        );

      case 3:
        return const Icon(IconlyBold.notification);
      default:
        return const Icon(Icons.home);
    }
  }

  @override
  Widget build(BuildContext context) {
    final DrawerControllMain drawerController = Get.find();
    final Mainlayoutcontroll mainlayoutcontroll = Get.find();

    return WillPopScope(
      onWillPop: () async {
        return mainlayoutcontroll.onWillPop();
      },
      child: GetBuilder<Mainlayoutcontroll>(
        builder: (mainlayoutcontroll) {
          mainlayoutcontroll.buttonPosition();
          List<PersistentBottomNavBarItem> navBarsItems = List.generate(
            4,
            (index) {
              return PersistentBottomNavBarItem(
                  icon: GestureDetector(
                      key: mainlayoutcontroll.tabKeys[index],
                      onTap: () {
                        _controller.jumpToTab(0);

                        //_printButtonPosition(tabKeys[index]);
                        mainlayoutcontroll.selectedNewScrean(index);
                      },
                      child: _getIcon(index, null)),
                  activeColorPrimary: mainlayoutcontroll.indexSelected != index
                      ? AppColor.primaryAppbar
                      : Colors.transparent,
                  activeColorSecondary:
                      mainlayoutcontroll.indexSelected != index
                          ? Colors.white
                          : Colors.transparent,
                  inactiveColorPrimary:
                      mainlayoutcontroll.indexSelected != index
                          ? Colors.white
                          : Colors.transparent);
            },
          );

          return Scaffold(
            key: drawerController.scaffoldKey,
            drawer: const DrawerView(),
            bottomNavigationBar: Directionality(
              textDirection: TextDirection.ltr,
              child: Stack(
                children: [
                  PersistentTabView(
                    //   floatingActionButton: const Text("data"),
                    navBarHeight: 60,

                    padding: const EdgeInsets.symmetric(horizontal: 20),

                    context,
                    onItemSelected: (value) {
                      _controller.jumpToTab(0);
                      mainlayoutcontroll.selectedNewScrean(value);
                    },
                    controller: _controller,
                    backgroundColor: AppColor.primaryAppbar,
                    screens: modulesMainScreens(),

                    handleAndroidBackButtonPress: true,
                    resizeToAvoidBottomInset: true,
                    items: navBarsItems,
                    navBarStyle: NavBarStyle.style2,
                  ),
                  TweenAnimationBuilder(
                    tween: Tween<double>(
                        begin: mainlayoutcontroll.oldPosition,
                        end: mainlayoutcontroll.newPosition),
                    duration: const Duration(milliseconds: 300),
                    builder: (context, value, child) => Positioned(
                      bottom: 15,
                      left: value,
                      child: child!,
                    ),
                    child: InkWell(
                      onTap: () {
                        _controller.jumpToTab(0);
                      },
                      child: CircleAvatar(
                          radius: 35,
                          backgroundColor: AppColor.Catrgray,
                          child: Center(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _getIcon(mainlayoutcontroll.indexSelected,
                                  Colors.white),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                mainlayoutcontroll.namescreen2[
                                    mainlayoutcontroll.indexSelected],
                                style: ApptextStyle.textStyleApp13,
                              ),
                            ],
                          ))),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
