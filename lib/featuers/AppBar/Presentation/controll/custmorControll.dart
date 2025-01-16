import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:ican/core/Loction/textApp.dart';
import 'package:ican/core/utlies/color.dart';
import 'package:ican/featuers/AppBar/Presentation/controll/SearchControll.dart';
import 'package:ican/featuers/AppBar/Presentation/widget/Drop/DropdownOfCustmor.dart';

class CustmorControll extends GetxController
    with GetSingleTickerProviderStateMixin {
  bool topCustmor = false;
  final GlobalKey dropdownKeyCustmor = GlobalKey();

  bool isDropdownVisibleCustmor = false;

  OverlayEntry? overlayEntryCustmor;

  late String titelSatuts;
  late Color colorSelected;
  late Color fillcolorSelected;
  late List<bool> selectedCustmor;
  late SearchControll searchControll;
  late AnimationController animationController;
  late Animation<double> animation;
  late Animation<double> opacity;
  late Animation<Offset> position;

  List<String> nameCustmor = [
    "الرياض",
    "الدمام",
    "جدة",
    "الرياض",
    "الدمام",
    "جدة",
    "الرياض",
    "الدمام",
    "جدة"
  ];
  @override
  void onInit() {
    selectedCustmor = List.generate(nameCustmor.length, (index) => false);
    colorSelected = AppColor.primaryAppbar;
    fillcolorSelected = Colors.white;
    searchControll = Get.find();
    animationController = AnimationController(
      vsync: this, // GetSingleTickerProviderStateMixin يوفر `vsync`
      duration: const Duration(milliseconds: 400),
    );
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut,
    );
    opacity = Tween<double>(begin: 0.0, end: 1).animate(animation);
    position =
        Tween<Offset>(begin: const Offset(0, 0.1), end: const Offset(0, 0))
            .animate(animation);

    titelSatuts = AppText.customers.tr;
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

  void selectedNewCumtor(int index) {
    bool value = selectedCustmor[index];
    selectedCustmor = List.filled(nameCustmor.length, false);
    selectedCustmor[index] = !value;
    if (!value) {
      ChangedTitieCity(nameCustmor[index]);

      changedfillcolorSelected(AppColor.primaryAppbar);
      changedcolorSelected(Colors.white);
    } else {
      ChangedTitieCity(AppText.customers.tr);

      changedfillcolorSelected(Colors.white);
      changedcolorSelected(AppColor.primaryAppbar);
    }
  }

  void ChangedTitieCity(String newTitel) {
    titelSatuts = newTitel;

    CloseDropOfCity();
  }

  void toggleDropdown() {
    isDropdownVisibleCustmor = !isDropdownVisibleCustmor;
    update([custmor]);
  }

  void changedfillcolorSelected(Color newColor) {
    fillcolorSelected = newColor;
  }

  void changedcolorSelected(Color newColor) {
    colorSelected = newColor;
    update([custmor]);
  }

  Future<void> openCloseDropOfCity(
    BuildContext context,
  ) async {
    if (!isDropdownVisibleCustmor) {
      await searchControll.scrollToIndex(5);
      //  await Future.delayed(const Duration(milliseconds: 200));
      openDropOfCity(
        context,
      );
    } else {
      CloseDropOfCity();
    }
  }

  Future<void> CloseDropOfCity() async {
    animationController.reverse();
    await Future.delayed(const Duration(milliseconds: 400));
    searchControll.changedIsScroll(true);
    colorSelected != Colors.white
        ? changedcolorSelected(AppColor.primaryAppbar)
        : changedcolorSelected(colorSelected);
    overlayEntryCustmor?.remove();
    overlayEntryCustmor = null;
    toggleDropdown();
  }

  void openDropOfCity(
    BuildContext context,
  ) {
    searchControll.changedIsScroll(false);
    overlayEntryCustmor = DropdownOfCustmor(
      context,
    );
    colorSelected != Colors.white
        ? changedcolorSelected(Colors.black)
        : changedcolorSelected(colorSelected);
    Overlay.of(context).insert(overlayEntryCustmor!);
    startAnimation();

    toggleDropdown();
  }

  void ChangedTapCity() {
    topCustmor = !topCustmor;
    update([custmor]);
  }

  static String custmor = 'custmor';
}
