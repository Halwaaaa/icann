import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:hive/hive.dart';
import 'package:ican/core/Loction/textApp.dart';
import 'package:ican/core/services/hivenServices.dart';
import 'package:ican/core/services/servicesDio.dart';
import 'package:ican/core/utlies/color.dart';
import 'package:ican/featuers/AppBar/Data/Locale/LocaleCountres.dart';
import 'package:ican/featuers/AppBar/Data/Remote/RemoteCounter.dart';
import 'package:ican/featuers/AppBar/Presentation/controll/SearchControll.dart';
import 'package:ican/featuers/AppBar/Presentation/controll/Statecontroll.dart';
import 'package:ican/featuers/AppBar/Presentation/model/CountersUser.dart';
import 'package:ican/featuers/AppBar/Presentation/widget/Drop/DropdownofCountres.dart';

class CounterControll extends GetxController
    with GetSingleTickerProviderStateMixin {
  bool topCity = false;
  final GlobalKey dropdownKeyCity = GlobalKey();

  bool isDropdownVisibleCity = false;
  bool isDropdownVisibleSearch = false;

  OverlayEntry? overlayEntryCity;

  late String titelCity;
  late Color colorSelected;
  late Color fillcolorSelected;
  late SearchControll searchControll;
  late List<bool> selectedCitys;
  List<String> nameCitys = ["الرياض", "الدمام", "جدة"];
  late AnimationController animationController;
  late Animation<double> animation;
  late Animation<double> opacity;
  late Animation<Offset> position;
  late LocaleCountres localeCountres;
  late List<CountersUser>? counters;
  late int lenght = nameCitys.length;
  late bool showStautes;
  late Box<List<dynamic>?> boxCountres;
  late StateControll stateControll;
  late int indexCountre;
  late bool showTitel;
  late String titelState;
  @override
  void onInit() {
    showTitel = true;
    titelCity = AppText.City.tr;
    initAnimated();

    initValues(nameCitys.length);
    searchControll = Get.find();

    super.onInit();
  }

  void initValues(int lenght) {
    selectedCitys = List.generate(lenght, (index) => false);
    showStautes = false;

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

  @override
  Future<void> onReady() async {
    boxCountres = await Hive.openBox<List<dynamic>>(HivenServices.conters);

    localeCountres = LocaleCountres(boxCountres: boxCountres);
    await getLocale();

    getRemtoCounters();
    //  // TODO: implement onReady
    super.onReady();
  }

  Future<void> getLocale() async {
    //  counters = [];
    counters = await localeCountres.getCountres();
    if (counters != null) {
      initValues(counters!.length);
      update([citydrop]);
    } else {
      initValues(nameCitys.length);
      update([citydrop]);
    }
  }

  Future<void> getRemtoCounters() async {
    ServicesDio servicesDio = Get.find();
    RemoteCounter remoteCounter = RemoteCounter(servicesDio: servicesDio);
    List<CountersUser>? o = await remoteCounter.getCounters();
    if (o != null) {
      setLocalCounters(o);
    }
  }

  void setLocalCounters(List<CountersUser>? o) {
    if (o != null) {
      localeCountres.setNewStautes(o);
      counters = o;
      initValues(counters!.length);
      update([citydrop]);
    } else {
      initValues(nameCitys.length);
      update([citydrop]);
    }
  }

  void startAnimation() {
    animationController.reset();
    animationController.forward();
  }

  void reverseAnimation() {
    animationController.reverse();
  }

  void showTitelState(bool value) {
    showTitel = value;
    update([City]);
  }

  void selectedNewCity(
    int index,
  ) {
    bool value = selectedCitys[index];
    selectedCitys = List.filled(counters!.length, false);
    selectedCitys[index] = !value;
    if (!value) {
      searchControll.setNewCounters(counters![index].id);
      showStautes = true;
      showTitel = true;
      titelState = counters![index].name;
      indexCountre = counters![index].id;
      initValuesForStates();

      update([City]);
      ChangedTitieCity(
        counters![index].name,
      );

      ChangedfillcolorSelected(AppColor.primaryAppbar);
      ChangedcolorSelected(Colors.white);
    } else {
            searchControll.setNewCounters(null);

      showStautes = false;
      update([City]);
      ChangedTitieCity(
        AppText.City.tr,
      );

      ChangedfillcolorSelected(Colors.white);
      ChangedcolorSelected(AppColor.primaryAppbar);
    }
  }

  void initValuesForStates() {
    // stateControll = Get.put(StateControll());

    // stateControll.CloseDropOfCity();
    // stateControll.ChangedTitieCity("j");
    // stateControll.initValues(stateControll.stateItem.length);
  }

  void ChangedTitieCity(
    String newTitel,
  ) {
    titelCity = newTitel;

    CloseDropOfCity();
  }

  void toggleDropdown() {
    isDropdownVisibleCity = !isDropdownVisibleCity;
    update([City]);
  }

  void ChangedfillcolorSelected(Color newColor) {
    fillcolorSelected = newColor;
  }

  void ChangedcolorSelected(Color newColor) {
    colorSelected = newColor;
    update([City]);
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

    overlayEntryCity = showDropdownOfCountres(context);

    colorSelected != Colors.white
        ? ChangedcolorSelected(Colors.black)
        : ChangedcolorSelected(colorSelected);
    Overlay.of(context).insert(overlayEntryCity!);
    startAnimation();
    toggleDropdown();
  }

  void ChangedTapCity() {
    topCity = !topCity;
    update([City]);
  }

  static String City = 'City';
  static String citydrop = 'citydrop';
  static String stautes = 'stautes';
}
