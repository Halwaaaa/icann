import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:hive/hive.dart';
import 'package:ican/core/Loction/textApp.dart';
import 'package:ican/core/services/hivenServices.dart';
import 'package:ican/core/services/servicesDio.dart';
import 'package:ican/core/utlies/Modules/MoudulesSetting.dart';
import 'package:ican/core/utlies/color.dart';
import 'package:ican/featuers/AppBar/Data/Locale/LocaleCountres.dart';
import 'package:ican/featuers/AppBar/Data/Remote/RemoteCounter.dart';
import 'package:ican/featuers/AppBar/Presentation/controll/SearchControll.dart';
import 'package:ican/featuers/AppBar/Presentation/model/CountersUser.dart';
// ignore: unused_import
import 'package:ican/featuers/AppBar/Presentation/widget/Drop/DropdownofCountres.dart';
import 'package:ican/featuers/mainLayout/Presentation/Controll/mainLayoutcontroll.dart';
import 'package:ican/featuers/setting/Presentation/Controller/StateLaederControll.dart';
import 'package:ican/featuers/setting/Presentation/Controller/settingControll.dart';
import 'package:ican/featuers/setting/Presentation/widget/Drop/DropdownOfAddStautes.dart';
import 'package:ican/featuers/setting/Presentation/widget/Drop/DropdownOfCounters.dart';

class CountersLaederControll extends GetxController
    with GetSingleTickerProviderStateMixin {
  bool topCity = false;
  bool topStautes = false;
  final GlobalKey dropdownKeyCounters = GlobalKey();
  final GlobalKey dropdownKeyCountersAddOrder = GlobalKey();
  final GlobalKey dropdownKeySatuyes = GlobalKey();
  final GlobalKey dropdownKeySatuesAdd = GlobalKey();

  late bool isDropdownVisibleCounters;
  late bool isDropdownVisibleSatutes;
  bool isDropdownVisibleSearch = false;

  OverlayEntry? overlayEntryCounters;
  OverlayEntry? overlayEntryStatues;

  late String titelCounters;
  late Color colorSelected;
  late Color colorSelectedStatues;
  late Color fillcolorSelected;
  late Color fillcolorSelectedStatues;
  late SearchControll searchControll;
  late List<bool> selectedCounters;
  late List<bool> selectedStatues = [];
  List<String> nameCounters = ["الرياض", "الدمام", "جدة"];
  List<String> nameStatues = ["نشط", "غير نشظ"];
  List<String> nameStatuesAdd = ["cc", "cod"];
  late AnimationController animationController;
  late Animation<double> animation;
  late Animation<double> opacity;
  late Animation<Offset> position;
  late LocaleCountres localeCountres;
  late List<CountersUser>? counters;
  late int lenght = nameCounters.length;
  late bool showStautes;
  late Box<List<dynamic>?> boxCountres;
  late StateLaederControll stateControll;
  late int? indexCountre;
  late bool showTitel;
  late SettingControll settingControll;

  late String titelState;
  late String titelStautes;
  late int? idStautes;
  @override
  void onInit() {
    init();
    searchControll = Get.find();
    initAnimated();

    super.onInit();
  }

  void init() {
    initValues(nameCounters.length);
    initValuesStautes(nameCounters.length);
    isDropdownVisibleCounters = true;
    isDropdownVisibleSatutes = true;
    settingControll = Get.find();
    titelState = "jjjj";
    showTitel = true;
    titelCounters = AppText.City.tr;
    titelStautes =
        modulesSetting()[settingControll.indexModulesSetting] != 'اضافة طلب'
            ? AppText.satuts.tr
            : AppText.payment.tr;
    indexCountre = null;
    colorSelectedStatues = AppColor.Catrgray;
    fillcolorSelectedStatues = Colors.white;

    idStautes = null;
    counters = null;
    initValues(nameCounters.length);
    initValuesStautes(nameCounters.length);

    getLocale(false);
  }

  void setSelecteCounters(List<bool> selected) {
    selectedCounters = selected;
  }

  void changedshowStautes(bool value) {
    showStautes = value;
  }

  void changedTitelStautes(String value) {
    titelState = value;
  }

  void setSelectedStautes(List<bool> h) {
    selectedStatues = h;
  }

  void initValues(int lenght) {
    selectedCounters = List.generate(lenght, (index) => false);
    showStautes = false;

    colorSelected = AppColor.Catrgray;
    fillcolorSelected = Colors.white;
  }

  void initValuesStautes(int lenght) {
    selectedStatues = List.generate(lenght, (index) => false);
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
    //  // TODO: implement onReady
    super.onReady();
  }

  Future<void> getLocale(bool isedit) async {
    boxCountres = await Hive.openBox<List<dynamic>>(HivenServices.conters);

    localeCountres = LocaleCountres(boxCountres: boxCountres);

    //  counters = [];
    counters = await localeCountres.getCountres();
    if (counters != null) {
      initValues(counters!.length);
      isedit
          ? update([
              cityEdit,
            ])
          : update([
              cityCounters,
            ]);
    } else {
      initValues(nameCounters.length);
      isedit
          ? update([
              cityEdit,
            ])
          : update([
              cityCounters,
            ]);
    }
    getRemtoCounters(isedit);
  }

  Future<void> getRemtoCounters(bool isedit) async {
    ServicesDio servicesDio = Get.find();
    RemoteCounter remoteCounter = RemoteCounter(servicesDio: servicesDio);
    List<CountersUser>? o = await remoteCounter.getCounters();
    if (o != null) {
      setLocalCounters(o, isedit);
    }
  }

  void setLocalCounters(List<CountersUser>? o, bool isedit) {
    if (o != null) {
      localeCountres.setNewStautes(o);
      counters = o;
      initValues(counters!.length);
      isedit
          ? update([
              cityEdit,
            ])
          : update([
              cityCounters,
            ]);
    } else {
      initValues(nameCounters.length);
      isedit
          ? update([
              cityEdit,
            ])
          : update([
              cityCounters,
            ]);
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

  void changedIdCounters(int id) {
    indexCountre = id;
  }

  void changedIdStautes(int index) {
    idStautes = index;
  }

  void selectedNewCity(
    int index,
  ) {
    bool value = selectedCounters[index];
    selectedCounters = List.filled(counters!.length, false);
    selectedCounters[index] = !value;
    if (!value) {
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
      showStautes = false;
      indexCountre = null;
      update([City]);
      ChangedTitieCity(
        AppText.City.tr,
      );

      ChangedfillcolorSelected(Colors.white);
      ChangedcolorSelected(AppColor.primaryAppbar);
    }
  }

  void selectedNewStautes(int index, bool isAdd) {
    bool value = selectedStatues[index];
    selectedStatues = List.filled(counters!.length, false);
    selectedStatues[index] = !value;
    if (!value) {
      idStautes = index;
      ChangedTitieSatutes(
        !isAdd ? nameStatues[index] : nameStatuesAdd[index],
      );

      ChangedfillcolorSelectedStatues(AppColor.primaryAppbar);
      ChangedcolorSelectedStatues(Colors.white);
    } else {
      idStautes = null;
      update([statuesLaeder]);
      ChangedTitieSatutes(!isAdd ? AppText.satuts.tr : AppText.payment.tr);

      ChangedfillcolorSelectedStatues(Colors.white);
      ChangedcolorSelectedStatues(AppColor.primaryAppbar);
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
    titelCounters = newTitel;

    CloseDropOfCity();
  }

  void ChangedTitieSatutes(
    String newTitel,
  ) {
    titelStautes = newTitel;

    CloseDropOfStautes();
  }

  void toggleDropdown(bool value) {
    isDropdownVisibleCounters = value;
    update([City]);
  }

  void toggleDropdownStautes(bool value) {
    isDropdownVisibleSatutes = value;
    update([statuesLaeder]);
  }

  void ChangedfillcolorSelected(Color newColor) {
    fillcolorSelected = newColor;
  }

  void ChangedfillcolorSelectedStatues(Color newColor) {
    fillcolorSelectedStatues = newColor;
  }

  void ChangedcolorSelected(Color newColor) {
    colorSelected = newColor;
    update([City]);
  }

  void ChangedcolorSelectedStatues(Color newColor) {
    colorSelectedStatues = newColor;
    update([statuesLaeder]);
  }

  void openCloseDropOfCity(BuildContext context, bool isAdd) {
    print(isDropdownVisibleCounters);
    if (isDropdownVisibleCounters) {
      openDropOfCity(context, isAdd);
    } else {
      CloseDropOfCity();
    }
  }

  void openCloseDropOfStautes(BuildContext context, bool isAdd) {
    if (isDropdownVisibleSatutes) {
      openDropOfstautes(context, isAdd);
    } else {
      CloseDropOfStautes();
    }
  }

  Future<void> CloseDropOfCity() async {
    reverseAnimation();
    await Future.delayed(const Duration(milliseconds: 400));
    searchControll.changedIsScroll(true);

    colorSelected != Colors.white
        ? ChangedcolorSelected(AppColor.Catrgray)
        : ChangedcolorSelected(colorSelected);
    overlayEntryCounters?.remove();
    overlayEntryCounters = null;
    toggleDropdown(true);
  }

  Future<void> CloseDropOfStautes() async {
    reverseAnimation();
    await Future.delayed(const Duration(milliseconds: 400));

    overlayEntryStatues?.remove();
    overlayEntryStatues = null;
    toggleDropdownStautes(true);
  }

  void openDropOfCity(
    BuildContext context,
    bool isAdd,
  ) {
    stateControll = Get.find();
    stateControll.CloseDropOfCity();
    toggleDropdown(false);

    overlayEntryCounters =
        showDropdownOfCountresLaeder(context, selectedCounters, isAdd);

    colorSelected != Colors.white
        ? ChangedcolorSelected(Colors.black)
        : ChangedcolorSelected(colorSelected);
    Overlay.of(context).insert(overlayEntryCounters!);
    startAnimation();
  }

  void openDropOfstautes(BuildContext context, bool isAdd) {
    toggleDropdownStautes(false);

    //  searchControll.changedIsScroll(false);
    // mainlayoutcontroll.scrollcontroller.
    overlayEntryStatues = showDropdownOfSatutesLaeder(context, isAdd);

    Overlay.of(context).insert(overlayEntryStatues!);
    startAnimation();
  }

  void ChangedTapCity() {
    topCity = !topCity;
    update([City]);
  }

  void ChangedTapStautes() {
    topStautes = !topStautes;
    update([statuesLaeder]);
  }

  static String City = 'City';
  static String cityEdit = 'cityEdit';
  static String statuesLaeder = 'statuesLaeder';
  static String cityCounters = 'cityCounters ';
  static String stautes = 'stautes';
}
