import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:hive/hive.dart';
import 'package:ican/core/Loction/textApp.dart';
import 'package:ican/core/compnated/Dialog.dart';
import 'package:ican/core/compnated/dafultItem.dart';
import 'package:ican/core/services/hivenServices.dart';
import 'package:ican/core/services/servicesDio.dart';
import 'package:ican/core/utlies/color.dart';
import 'package:ican/featuers/AppBar/Data/Locale/LocalCustmor.dart';
import 'package:ican/featuers/AppBar/Data/Remote/RemoteCustmor.dart';
import 'package:ican/featuers/AppBar/Presentation/controll/SearchControll.dart';
import 'package:ican/featuers/AppBar/Presentation/model/CustmorUser.dart';
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
  late List<CustmorUser> nameCustmor;
  late bool loding;
  late LocaleCustmor localeCustmor;
  late Box<List<dynamic>> boxCustmor;
  late bool isNullCusmor;
  Timer? t;

  List<CustmorUser> nameCustmorDafult = [
    CustmorUser(id: 0, name: "laith"),
    CustmorUser(id: 1, name: "baraa"),
    CustmorUser(id: 2, name: 'amar'),
  ];

  @override
  void onInit() {
    titelSatuts = AppText.customers.tr;
    isNullCusmor = false;
    loding = true;
    nameCustmor = nameCustmorDafult;
    initValue(nameCustmorDafult.length);

    super.onInit();
  }

  @override
  Future<void> onReady() async {
    searchControll = Get.find();
    initAnimated();
    boxCustmor = await Hive.openBox<List<dynamic>>(HivenServices.custmorName);
    localeCustmor = LocaleCustmor(boxCustmor);
    getLocaleCustmor();

    super.onReady();
  }

  void initAnimated() {
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
  }

  void initValue(int lenght) {
    selectedCustmor = List.generate(lenght, (index) => false);

    colorSelected = AppColor.primaryAppbar;
    fillcolorSelected = Colors.white;
  }

  @override
  void onClose() {
    t?.cancel();
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
      ChangedTitieCity(nameCustmor[index].name);
      searchControll.setNewCoustmor(nameCustmor[index].id);
      changedfillcolorSelected(AppColor.primaryAppbar);
      changedcolorSelected(Colors.white);
    } else {
      ChangedTitieCity(AppText.customers.tr);
      searchControll.setNewCoustmor(null);

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
  static String custmorList = 'custmorList';

  Future<void> getLocaleCustmor() async {
    loding = true;
    update([custmorList]);
    List<CustmorUser>? localSave = await localeCustmor.getCustmor();
    if (localSave != null) {
      if (localSave.isEmpty) {
        loding = false;
        initValue(nameCustmorDafult.length);
        nameCustmor = nameCustmorDafult;
        update([custmor, custmorList]);
      } else {
        loding = false;
        initValue(localSave.length);
        nameCustmor = localSave;
        update([custmor, custmorList]);
      }
    } else {
      isNullCusmor = true;
      loding = true;

      initValue(nameCustmorDafult.length);
      nameCustmor = nameCustmorDafult;
      update([custmor, custmorList]);
    }
    getRemoteCustmor(isNullCusmor);
  }

  Future<void> getRemoteCustmor(bool isNull) async {
    ServicesDio servicesDio = Get.find();
    RemoteCustmor remoteCustmor = RemoteCustmor(servicesDio);
    List<CustmorUser>? o = await remoteCustmor.getCustmor();

    if (o != null) {
      if (o.isEmpty) {
        loding = false;
        initValue(nameCustmorDafult.length);
        nameCustmor = nameCustmorDafult;
        update([custmor, custmorList]);
      } else {
        loding = false;
        nameCustmor = o;
        initValue(o.length);
        localeCustmor.setCustmor(o);
        update([custmor, custmorList]);
      }
    } else {
      if (isNull) {
        Get.showSnackbar(const GetSnackBar(
          message: "الرجاء التحقق من الاتصال",
        ));

        t = Timer.periodic(const Duration(seconds: 10), (time) async {
          List<CustmorUser>? result = await remoteCustmor.getCustmor();
          print(time.tick);
          if (result != null) {
            if (result.isEmpty) {
              loding = false;
              initValue(nameCustmorDafult.length);
              nameCustmor = nameCustmorDafult;
              update([custmorList, custmor]);
            } else {
              Get.snackbar(
                "",
                "تم اعادة الاتصال",
                colorText: Colors.black,
                duration: const Duration(seconds: 5),
              );
              loding = false;
              initValue(result.length);

              nameCustmor = result;
              update([custmorList, custmor]);

              localeCustmor.setCustmor(result);

              time.cancel();
            }
          }
        });
      }
    }
  }
}
