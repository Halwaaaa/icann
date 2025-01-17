import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ican/core/Loction/textApp.dart';
import 'package:ican/featuers/AppBar/Presentation/controll/AppbarControll.dart';
import 'package:ican/featuers/Notifition/Presentation/View/NotificationView.dart';
import 'package:ican/featuers/Responses/Presentation/View/ResponsesView.dart';
import 'package:ican/featuers/home/Presentation/View/homeView1.dart';
import 'package:ican/featuers/home/Presentation/controol/controolHome.dart';
import 'package:ican/featuers/setting/Presentation/Controller/settingControll.dart';
import 'package:ican/featuers/setting/Presentation/view/view.dart';

class Mainlayoutcontroll extends GetxController {
  static String loding = 'loding';
  late int indexSelected;
  late bool initStauts;
  late double oldPosition;
  late double newPosition;
  late bool canGoToPages;
  late ControolHome controolHome;
  late SettingControll settingControll;
  late AppBarControll appControll;
  late ScrollController? scrollcontroller;
  late bool isloding;

  late int end = 20;

  @override
  void onInit() {
    isloding = false;
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

  void changedLoding(bool value) {
    isloding = value;
    update([loding]);
  }

  List<Widget> itemMoudulesMain = [
    const HomeView1(),
    const SettingView(),
    const ResponsesView(),
    const NotificationView(),
  ];
  List<String> namescreen = [
    AppText.AppBarHome.tr,
    AppText.setting.tr,
    AppText.responses.tr,
    AppText.Notifications.tr,
  ];
  List<String> namescreen2 = [
    AppText.home.tr,
    AppText.setting.tr,
    AppText.responses.tr,
    AppText.Notifications.tr,
  ];

  Future<bool> onWillPop() async {
    if (canGoToPages) {
      if (isloding == true) {
        changedLoding(false);
      }
      if (indexSelected == 0) {
        controolHome = Get.find();
        bool result = await controolHome.onWillpop();
        print(result);
        return result;
      }
      await scrollcontroller?.animateTo(0,
          duration: const Duration(milliseconds: 300), curve: Easing.legacy);
      await Future.delayed(const Duration(milliseconds: 300));

      if (indexSelected == 1) {
        settingControll = Get.find();
        return settingControll.onWillpop();
      }
      selectedNewScrean(0);
      return false;
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
      if (newindex == 0) {
        controolHome = Get.find();

        controolHome.onInit();
      }
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
