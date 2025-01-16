import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ican/core/Loction/textApp.dart';
import 'package:ican/featuers/AppBar/Presentation/controll/AppbarControll.dart';
import 'package:ican/featuers/home/Presentation/View/homeView1.dart';
import 'package:ican/featuers/home/Presentation/controol/controolHome.dart';
import 'package:ican/featuers/setting/Presentation/Controller/settingControll.dart';
import 'package:ican/featuers/setting/Presentation/view/view.dart';

class Mainlayoutcontroll extends GetxController {
  late int indexSelected;
  late bool initStauts;
  late double oldPosition;
  late double newPosition;
  late bool canGoToPages;
  late ControolHome controolHome;
  late SettingControll settingControll;
  late AppBarControll appControll;
  late ScrollController? scrollcontroller;

  late int end = 20;

  @override
  void onInit() {
    oldPosition = 0;
    newPosition = 30;
    indexSelected = 0;
    canGoToPages = true;
    scrollcontroller = ScrollController();

    super.onInit();
    initStauts = true;
  }

  @override
  onReady() {
    appControll = Get.find();

    super.onReady();
  }

  List<Widget> itemMoudulesMain = [
    const HomeView1(),
    const SettingView(),
    const SettingView(),
    const SettingView(),
  ];
  List<String> namescreen = [
    AppText.AppBarHome.tr,
    AppText.setting.tr,
    AppText.add.tr,
    AppText.add.tr,
  ];
  List<String> namescreen2 = [
    AppText.home.tr,
    AppText.setting.tr,
    AppText.add.tr,
    AppText.add.tr,
  ];
  Future<bool> onWillPop() async {
    if (canGoToPages) {
      await scrollcontroller?.animateTo(0,
          duration: const Duration(milliseconds: 500), curve: Easing.legacy);
      await Future.delayed(const Duration(milliseconds: 200));

      if (indexSelected == 0) {
        controolHome = Get.find();

        return controolHome.onWillpop();
      }
      if (indexSelected == 1) {
        settingControll = Get.find();
        return settingControll.onWillpop();
      }
    }
    return false;
  }

  final List<GlobalKey> tabKeys = List.generate(4, (_) => GlobalKey());

  double? buttonPosition() {
    if (initStauts) {
      oldPosition = newPosition;
      return newPosition.toDouble();
    }
    oldPosition = newPosition;

    final renderBox =
        tabKeys[indexSelected].currentContext?.findRenderObject() as RenderBox?;
    if (renderBox != null) {
      final position = renderBox.localToGlobal(Offset.zero);
      newPosition = position.dx - 30;

      return newPosition;
    }
    return null;
  }

  void selectedNewScrean(int newindex) {
    initStauts = false;
    if (canGoToPages) {
      appControll.changedTitelAppBar(namescreen[newindex]);
      indexSelected = newindex;
      update();
    }
  }

  changedCanGoToPages(bool value) {
    canGoToPages = value;
  }

  void jumbTo() {
    scrollcontroller?.jumpTo(0);
  }
}
