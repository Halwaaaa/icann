import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ican/core/Loction/textApp.dart';
import 'package:ican/featuers/AppBar/Presentation/controll/CityControll.dart';
import 'package:ican/featuers/AppBar/Presentation/controll/custmorControll.dart';
import 'package:ican/featuers/AppBar/Presentation/controll/satutsControll.dart';
import 'package:ican/featuers/AppBar/Presentation/widget/Drop/DropdownofSearch.dart';

class SearchControll extends GetxController
    with GetSingleTickerProviderStateMixin {
  static String saerch = 'saerh';
  static String startDate = 'startDate';
  static String endDate = 'endDate';
  static String dropSearch = 'dropSearch';
  late bool isVisible;
  late bool isScroll;
  late String titleStartDate;
  late TextEditingController numberOrderController;
  late FocusNode focusNodeNameClient;
  late FocusNode focusNodeNumberOrder;
  late FocusNode focusNodeNumberClient;
  late TextEditingController nameClientController;
  late TextEditingController numberClientController;
  late String titleEndDate;
  OverlayEntry? overlayEntrysearch;
  OverlayEntry? overlayEntryDate;
  final GlobalKey dropdownKeySearch = GlobalKey();
  final GlobalKey dropdownKeyDate = GlobalKey();
  late ScrollController scrollController;
  late Animation<Offset> position;
  late Animation<double> opacity;

  late CustmorControll custmorControll;
  late CityControll cityControll;
  late SatutsControll satutsControll;
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void onInit() {
    // TODO: implement onInit
    isScroll = true;
    titleStartDate = AppText.DateOfStart.tr;
    numberClientController = TextEditingController();
    nameClientController = TextEditingController();
    numberOrderController = TextEditingController();
    focusNodeNameClient = FocusNode();
    focusNodeNumberOrder = FocusNode();
    focusNodeNumberClient = FocusNode();
    titleEndDate = AppText.DateOfEnd.tr;
    scrollController = ScrollController();
    animationController = AnimationController(
      vsync: this, // GetSingleTickerProviderStateMixin يوفر `vsync`
      duration: const Duration(milliseconds: 700),
    );
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.linear,
    );
    position =
        Tween<Offset>(begin: const Offset(0.0, 0.5), end: const Offset(0, 0))
            .animate(animation);
    opacity = Tween<double>(begin: 0.0, end: 1).animate(animation);
    isVisible = true;
    super.onInit();
  }

  void startAnimation() {
    animationController.reset();
    animationController.forward();
  }

  void reverseAnimation() {
    animationController.reverse();
  }

  @override
  void onClose() {
    // TODO: implemen
    //numt onClose
    animationController.dispose();

    numberClientController.dispose();
    nameClientController.dispose();
    numberOrderController.dispose();
    focusNodeNameClient.dispose();
    focusNodeNumberOrder.dispose();
    focusNodeNumberClient.dispose();
    super.onClose();
  }

  Future<void> closeTextFormFiled() async {
    await Future.delayed(const Duration(milliseconds: 100));
    if (focusNodeNameClient.hasFocus) {
      focusNodeNameClient.unfocus();
    }
    if (focusNodeNumberOrder.hasFocus) {
      focusNodeNumberOrder.unfocus();
    }
    if (focusNodeNumberClient.hasFocus) {
      focusNodeNumberClient.unfocus();
    }
  }

  void changedVisibel(bool visil) {
    isVisible = visil;
    update([dropSearch]);
  }

  void changedtitleStartDate(String newTitle) {
    titleStartDate = newTitle;
    update([startDate]);
  }

  void changedtitleEndDate(String newTitle) {
    titleEndDate = newTitle;
    update([endDate]);
  }

  void changedIsScroll(bool newValue) {
    isScroll = newValue;
    update([dropSearch]);
  }

  bool isDropdownVisibleSearch = false;
  void toggleDropdown() {
    isDropdownVisibleSearch = !isDropdownVisibleSearch;
    update([]);
  }

  void openCloseDropOfCity(
      BuildContext context, SearchControll searchControll) {
    if (!isDropdownVisibleSearch) {
      openDropOfSearch(context, searchControll);
    } else {
      CloseDropOfSearch();
    }
  }

  Future<void> CloseDropOfSearch() async {
    animationController.reverse();
    await Future.delayed(
      const Duration(milliseconds: 700),
    );

    cityControll = Get.put(CityControll());

    cityControll.CloseDropOfCity();

    overlayEntrysearch?.remove();
    overlayEntrysearch = null;
    toggleDropdown();
  }

  void CloseDropOfDate() {
    overlayEntryDate?.remove();
    overlayEntryDate = null;
  }

  void openDropOfDatePiker(BuildContext context, SearchControll controller) {
    //overlayEntryDate = showDropShowDatePiker();

    Overlay.of(context).insert(
      overlayEntryDate!,
    );
  }

  void openDropOfSearch(BuildContext context, SearchControll controller) {
    overlayEntrysearch = showDropdownOfSearch(context);

    Overlay.of(context).insert(
      overlayEntrysearch!,
    );
    startAnimation();
    toggleDropdown();
  }

  Future<void> scrollToIndex(int index) async {
    const itemHeight = 60.5; // ارتفاع العنصر مع الحواف
    final targetOffset = index * itemHeight;
    await scrollController.animateTo(
      targetOffset,
      duration: const Duration(microseconds: 300),
      curve: Curves.slowMiddle,
    );
  }
}
