import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:ican/core/Loction/textApp.dart';
import 'package:ican/core/services/hivenServices.dart';
import 'package:ican/core/services/servicesDio.dart';
import 'package:ican/core/utlies/color.dart';
import 'package:ican/featuers/AppBar/Data/Locale/LocaleCountres.dart';
import 'package:ican/featuers/AppBar/Data/Locale/localState.dart';
import 'package:ican/featuers/AppBar/Data/Remote/RemoteState.dart';
import 'package:ican/featuers/AppBar/Presentation/controll/CounterControll.dart';
import 'package:ican/featuers/AppBar/Presentation/controll/SearchControll.dart';
import 'package:ican/featuers/AppBar/Presentation/model/CountersUser.dart';
import 'package:ican/featuers/AppBar/Presentation/model/StateUser.dart';
import 'package:ican/featuers/AppBar/Presentation/widget/Drop/DropdownofState.dart';
import 'package:ican/featuers/setting/Presentation/Controller/countersLaederAndStaff.dart';
import 'package:ican/featuers/setting/Presentation/widget/Drop/DropdownofState.dart';

class StateLaederControll extends GetxController
    with GetSingleTickerProviderStateMixin {
  bool topSatet = false;
  final GlobalKey dropdownKeyState = GlobalKey();
  final GlobalKey dropdownKeyStateAdd = GlobalKey();

  bool isDropdownVisibleLaeder = false;
  bool isDropdownVisibleSearch = false;

  OverlayEntry? overlayEntryLaeder;

  late Color colorSelected;
  late Color fillcolorSelected;
  late SearchControll searchControll;
  late CountersLaederControll counterControll;
  late List<bool> selectedState = [];
  late AnimationController animationController;
  late Animation<double> animation;
  late Animation<double> opacity;
  late Animation<Offset> position;
  //late Box<dynamic> boxStautes;
  late HivenServices hivenServices;
  late List<StateUser> stateItem;
  late bool looding;
  late int lastIndexCountres;
  late int? idStates;
  late String titelState;

  @override
  Future<void> onInit() async {
    searchControll = Get.find();
    counterControll = Get.find();
    hivenServices = HivenServices();
    init();
    //boxStautes = await Hive.openBox<dynamic>(HivenServices.stautes);

    // TODO: implement onInit
    super.onInit();
  }

  void init() {
    lastIndexCountres = -1;
    titelState = " ";
    stateItem = itemStautesDafult;

    initValues(itemStautesDafult.length);
    looding = true;
    idStates = null;
  }

  @override
  Future<void> onReady() async {
    initAnimated();

    // TODO: implement onReady
    super.onReady();
  }

  void ChangedIdState(int id) {
    idStates = id;
  }

  void initValues(int lenght) {
    selectedState = List.generate(lenght, (index) => false);

    colorSelected = AppColor.primaryAppbar;
    fillcolorSelected = Colors.white;
  }

  void initAnimated() {
    animationController = AnimationController(
      vsync: this, // GetSingleTickerProviderStateMixin يوفر `vsync`
      duration: const Duration(milliseconds: 400),
    );

    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.linear,
    );
    opacity = Tween<double>(begin: 0, end: 1).animate(animation);
    position =
        Tween<Offset>(begin: const Offset(0.0, 0.2), end: const Offset(0, 0))
            .animate(animation);
  }

  @override
  onClose() {
    //  boxCountres.close();
    animationController.dispose();

    super.onClose();
  }

  void startAnimation() {
    animationController.reset();
    animationController.forward();
  }

  void reverseAnimation() {
    animationController.reverse();
  }

  void selectedNewCity(
    int index,
  ) {
    bool value = selectedState[index];
    selectedState = List.filled(stateItem.length, false);
    selectedState[index] = !value;
    if (!value) {
      counterControll.showTitelState(false);
      idStates = stateItem[index].id;
      update([stautes]);
      ChangedTitieCity(
        stateItem[index].name,
        //counters![index].name,
      );
      CloseDropOfCity();

      ChangedfillcolorSelected(AppColor.primaryAppbar);
      ChangedcolorSelected(Colors.white);
    } else {
      counterControll.showTitelState(false);
      idStates = null;

      ChangedfillcolorSelected(Colors.white);
      ChangedcolorSelected(AppColor.primaryAppbar);
      CloseDropOfCity();
    }
  }

  void ChangedTitieCity(
    String newTitel,
  ) {
    titelState = newTitel;
  }

  void toggleDropdown(bool value) {
    isDropdownVisibleLaeder = value;
    update([stautes]);
  }

  void ChangedfillcolorSelected(Color newColor) {
    fillcolorSelected = newColor;
  }

  void ChangedcolorSelected(Color newColor) {
    colorSelected = newColor;
    update([stautes]);
  }

  void openCloseDropOfCity(BuildContext context, bool isAdd) {
    if (isDropdownVisibleLaeder) {
      openDropOfCity(context, isAdd);
    } else {
      CloseDropOfCity();
    }
  }

  Future<void> CloseDropOfCity() async {
    reverseAnimation();
    await Future.delayed(const Duration(milliseconds: 400));
    // searchControll.changedIsScroll(true);

    colorSelected != Colors.white
        ? ChangedcolorSelected(AppColor.primaryAppbar)
        : ChangedcolorSelected(colorSelected);
    overlayEntryLaeder?.remove();
    overlayEntryLaeder = null;
    toggleDropdown(true);
  }

  void openDropOfCity(BuildContext context, bool isAdd) {
    //searchControll.changedIsScroll(false);

    overlayEntryLaeder = showDropdownOfStateLaeder(context, isAdd);

    colorSelected != Colors.white
        ? ChangedcolorSelected(Colors.black)
        : ChangedcolorSelected(colorSelected);
    Overlay.of(context).insert(overlayEntryLaeder!);
    startAnimation();
    toggleDropdown(false);
  }

  void ChangedTapCity() {
    topSatet = !topSatet;
    update([stautes]);
  }

  void setSelected(List<bool> y) {
    selectedState = y;
  }

  List<StateUser> itemStautesDafult = [
    StateUser(0, "ff", 0),
    StateUser(0, "ff", 0),
    StateUser(0, "ff", 0),
    StateUser(0, "ff", 0),
  ];

  static String stautes = 'stautes';
  static String stautesdrop = 'stautesdrop';
  static String stauteEdit = 'stauteEdit';
  void statesOfCounters(int idCountre, bool isEdit) async {
    // if (!boxStautes.isOpen) {
    //   boxStautes = await Hive.openBox<dynamic>(HivenServices.stautes);
    // }
    if (lastIndexCountres == idCountre) {
    } else {
      lastIndexCountres = idCountre;
      Box boxStautes = await Hive.openBox<dynamic>(HivenServices.stautes);

      LocaleStaute localeStaute = LocaleStaute(boxStautes);
      List<StateUser>? g = await localeStaute.getCountres(idCountre);
      if (g == null) {
        looding = true;
        stateItem = itemStautesDafult;
        initValues(stateItem.length);
        isEdit
            ? update([stauteEdit])
            : update([
                stautesdrop,
              ]);
      } else {
        looding = false;
        stateItem = g;
        initValues(g.length);
        isEdit
            ? update([stauteEdit])
            : update([
                stautesdrop,
              ]);
      }
      ServicesDio servicesDio = Get.find();
      RemoteStates remoteStates = RemoteStates(servicesDio: servicesDio);
      List<StateUser>? stateUser = await remoteStates.getStautes(idCountre);
      if (stateUser != null) {
        looding = false;
        localeStaute.setNewStautes(stateUser);

        initValues(stateUser.length);
        stateItem = stateUser;
        isEdit
            ? update([stauteEdit])
            : update([
                stautesdrop,
              ]);
      }
    }
  }
}
