import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:ican/core/Loction/textApp.dart';
import 'package:ican/core/utlies/color.dart';
import 'package:ican/featuers/AppBar/Presentation/controll/SearchControll.dart';
import 'package:ican/featuers/AppBar/Presentation/widget/Drop/DropdownOfStatus.dart';

class SatutsControll extends GetxController
    with GetSingleTickerProviderStateMixin {
  bool topStats = false;
  final GlobalKey dropdownKeyStauts = GlobalKey();

  bool isDropdownVisibleStauts = false;

  OverlayEntry? overlayEntryStauts;

  late String titelStauts;
  late Color colorSelected;
  late Color fillcolorSelected;
  late List<bool> selectedStauts;
  late SearchControll searchControll;
  late AnimationController animationController;
  late Animation<double> animation;
  late Animation<Offset> position;
  late Animation<double> opacity;

  List<String> nameStautes = ["الرياض", "الدمام", "جدة"];
  @override
  void onInit() {
    selectedStauts = List.generate(nameStautes.length, (index) => false);
    colorSelected = AppColor.primaryAppbar;
    fillcolorSelected = Colors.white;
    searchControll = Get.find();
    animationController = AnimationController(
      vsync: this, // GetSingleTickerProviderStateMixin يوفر `vsync`
      duration: const Duration(milliseconds: 300),
    );
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.linear,
    );
    position =
        Tween<Offset>(begin: const Offset(0.0, 0.2), end: const Offset(0, 0))
            .animate(animation);
    opacity = Tween<double>(begin: 0.0, end: 1).animate(animation);
    titelStauts = AppText.satuts.tr;
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

  void selectedNewStaut(int index) {
    bool value = selectedStauts[index];
    selectedStauts = List.filled(nameStautes.length, false);
    selectedStauts[index] = !value;
    if (!value) {
      ChangedTitieStauts(nameStautes[index]);

      ChangedfillcolorSelected(AppColor.primaryAppbar);
      ChangedcolorSelected(Colors.white);
    } else {
      ChangedTitieStauts(AppText.satuts.tr);

      ChangedfillcolorSelected(Colors.white);
      ChangedcolorSelected(AppColor.primaryAppbar);
    }
  }

  void ChangedTitieStauts(String newTitel) {
    titelStauts = newTitel;

    CloseDropOfCity();
  }

  void toggleDropdown() {
    isDropdownVisibleStauts = !isDropdownVisibleStauts;
    update([status]);
  }

  void ChangedfillcolorSelected(Color newColor) {
    fillcolorSelected = newColor;
  }

  void ChangedcolorSelected(Color newColor) {
    colorSelected = newColor;
    update([status]);
  }

  Future<void> openCloseDropOfCity(
    BuildContext context,
  ) async {
    if (!isDropdownVisibleStauts) {
      await searchControll.scrollToIndex(6);

      // ignore: use_build_context_synchronously
      openDropOfCity(
        context,
      );
    } else {
      animationController.reverse();

      CloseDropOfCity();
    }
  }

  Future<void> CloseDropOfCity() async {
    searchControll.changedIsScroll(true);
    animationController.reverse();
    colorSelected != Colors.white
        ? ChangedcolorSelected(AppColor.primaryAppbar)
        : ChangedcolorSelected(colorSelected);
    await Future.delayed(const Duration(milliseconds: 300));

    overlayEntryStauts?.remove();
    overlayEntryStauts = null;
    toggleDropdown();
  }

  void openDropOfCity(
    BuildContext context,
  ) {
    searchControll.changedIsScroll(false);
    overlayEntryStauts = showDropdownOfStauts(
      context,
    );
    colorSelected != Colors.white
        ? ChangedcolorSelected(Colors.black)
        : ChangedcolorSelected(colorSelected);
    Overlay.of(context).insert(overlayEntryStauts!);
    startAnimation();
    toggleDropdown();
  }

  void ChangedTapCity() {
    topStats = !topStats;
    update([status]);
  }

  static String status = 'Status';
}
