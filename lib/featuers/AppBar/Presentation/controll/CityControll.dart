import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:ican/core/Loction/textApp.dart';
import 'package:ican/core/utlies/color.dart';
import 'package:ican/featuers/AppBar/Presentation/controll/SearchControll.dart';
import 'package:ican/featuers/AppBar/Presentation/widget/Drop/DropdownofCity.dart';

class CityControll extends GetxController
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
  @override
  void onInit() {
    selectedCitys = List.generate(nameCitys.length, (index) => false);
    colorSelected = AppColor.primaryAppbar;
    fillcolorSelected = Colors.white;
    searchControll = Get.find();

    titelCity = AppText.City.tr;
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
    super.onInit();
  }

  @override
  void onClose() {
    animationController.dispose();
    // TODO: implement onClose
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
    selectedCitys = List.filled(nameCitys.length, false);
    selectedCitys[index] = !value;
    if (!value) {
      ChangedTitieCity(
        nameCitys[index],
      );

      ChangedfillcolorSelected(AppColor.primaryAppbar);
      ChangedcolorSelected(Colors.white);
    } else {
      ChangedTitieCity(
        AppText.City.tr,
      );

      ChangedfillcolorSelected(Colors.white);
      ChangedcolorSelected(AppColor.primaryAppbar);
    }
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
    CityControll cityControll,
  ) {
    if (!isDropdownVisibleCity) {
      openDropOfCity(
        context,
        cityControll,
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
    CityControll cityControll,
  ) {
    searchControll.changedIsScroll(false);

    overlayEntryCity = showDropdownOfCity(context);

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
}
