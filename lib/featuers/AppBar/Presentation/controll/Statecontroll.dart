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

class StateControll extends GetxController
    with GetSingleTickerProviderStateMixin {
  bool topSatet = false;
  final GlobalKey dropdownKeyState = GlobalKey();

  bool isDropdownVisibleCity = false;
  bool isDropdownVisibleSearch = false;

  OverlayEntry? overlayEntryCity;

  late String titelState;
  late Color colorSelected;
  late Color fillcolorSelected;
  late SearchControll searchControll;
  late CounterControll counterControll;
  late List<bool> selectedCitys;
  late AnimationController animationController;
  late Animation<double> animation;
  late Animation<double> opacity;
  late Animation<Offset> position;
  //late Box<dynamic> boxStautes;
  late HivenServices hivenServices;
  late List<StateUser> stateItem;
  late bool looding;
  late int lastIndexCountres;
  late bool  isSearch;

  @override
  Future<void> onInit() async {
    
    searchControll = Get.find();
    counterControll = Get.find();
    hivenServices = HivenServices();
    lastIndexCountres = -1;
    titelState = "kk";
    stateItem = itemStautesDafult;

    initValues(itemStautesDafult.length);
    looding = true;
    //boxStautes = await Hive.openBox<dynamic>(HivenServices.stautes);

    // TODO: implement onInit
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    initAnimated();

    // TODO: implement onReady
    super.onReady();
  }

  void initValues(int lenght) {
    selectedCitys = List.generate(lenght, (index) => false);

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
    bool value = selectedCitys[index];
    selectedCitys = List.filled(stateItem.length, false);
    selectedCitys[index] = !value;
    if (!value) {
      
      counterControll.showTitelState(false);
      update([stautes]);
      ChangedTitieCity(
        stateItem[index].name,
        //counters![index].name,
      );

      ChangedfillcolorSelected(AppColor.primaryAppbar);
      ChangedcolorSelected(Colors.white);
    } else {
      counterControll.showTitelState(false);

      ChangedfillcolorSelected(Colors.white);
      ChangedcolorSelected(AppColor.primaryAppbar);
      CloseDropOfCity();
    }
  }

  void ChangedTitieCity(
    String newTitel,
  ) {
    titelState = newTitel;

    CloseDropOfCity();
  }

  void toggleDropdown() {
    isDropdownVisibleCity = !isDropdownVisibleCity;
    update([stautes]);
  }

  void ChangedfillcolorSelected(Color newColor) {
    fillcolorSelected = newColor;
  }

  void ChangedcolorSelected(Color newColor) {
    colorSelected = newColor;
    update([stautes]);
  }

  void openCloseDropOfCity(
    BuildContext context,
  ) {
    if (!isDropdownVisibleCity) {
      openDropOfCity(
        context,
      );
    } else {
      CloseDropOfCity();
    }
  }

  Future<void> CloseDropOfCity() async {
    reverseAnimation();
    await Future.delayed(const Duration(milliseconds: 400));
    searchControll.changedIsScroll(true);

    colorSelected != Colors.white
        ? ChangedcolorSelected(AppColor.primaryAppbar)
        : ChangedcolorSelected(colorSelected);
    overlayEntryCity?.remove();
    overlayEntryCity = null;
    toggleDropdown();
  }

  void openDropOfCity(
    BuildContext context,
  ) {
    searchControll.changedIsScroll(false);

    overlayEntryCity = showDropdownOfState(context);

    colorSelected != Colors.white
        ? ChangedcolorSelected(Colors.black)
        : ChangedcolorSelected(colorSelected);
    Overlay.of(context).insert(overlayEntryCity!);
    startAnimation();
    toggleDropdown();
  }

  void ChangedTapCity() {
    topSatet = !topSatet;
    update([stautes]);
  }

  List<StateUser> itemStautesDafult = [
    StateUser(0, "lglg", 0),
    StateUser(0, "lglg", 0),
    StateUser(0, "lglg", 0),
    StateUser(0, "lglg", 0),
    StateUser(0, "lglg", 0),
  ];

  static String stautes = 'stautes';
  static String stautesdrop = 'stautes';
  void statesOfCounters(int idCountre) async {
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
        update([stautesdrop]);
      } else {
        looding = false;
        stateItem = g;
        initValues(g.length);
        update([stautesdrop]);
      }
      ServicesDio servicesDio = Get.find();
      RemoteStates remoteStates = RemoteStates(servicesDio: servicesDio);
      List<StateUser>? stateUser = await remoteStates.getStautes(idCountre);
      if (stateUser != null) {
        looding = false;
        localeStaute.setNewStautes(stateUser);

        initValues(stateUser.length);
        stateItem = stateUser;
        update([stautesdrop]);
      }
    }
  }
}
