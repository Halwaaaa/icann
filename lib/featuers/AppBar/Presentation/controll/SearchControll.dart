import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ican/core/Loction/textApp.dart';
import 'package:ican/core/compnated/DafultGrid.dart';
import 'package:ican/core/compnated/Dialog.dart';
import 'package:ican/core/services/servicesDio.dart';
import 'package:ican/featuers/AppBar/Data/Remote/RemtoeSarch.dart';
import 'package:ican/featuers/AppBar/Presentation/controll/CounterControll.dart';
import 'package:ican/featuers/AppBar/Presentation/controll/Statecontroll.dart';
import 'package:ican/featuers/AppBar/Presentation/controll/custmorControll.dart';
import 'package:ican/featuers/AppBar/Presentation/controll/satutsControll.dart';
import 'package:ican/featuers/AppBar/Presentation/widget/Drop/DropdownofSearch.dart';
import 'package:ican/featuers/home/Date/Remote/RemoteOrder.dart';
import 'package:ican/featuers/home/Presentation/controol/custmorGrid.dart';
import 'package:ican/featuers/home/Presentation/controol/groupControll.dart';
import 'package:ican/featuers/home/Presentation/models/CustmorAllUser.dart';
import 'package:ican/featuers/home/Presentation/models/GroupUser.dart';
import 'package:ican/featuers/home/Presentation/models/orderModels.dart';
import 'package:ican/featuers/setting/Presentation/Controller/LeaderGroupControll.dart';
import 'package:ican/featuers/setting/Presentation/Models/LeaderModels.dart';

class SearchControll extends GetxController
    with GetSingleTickerProviderStateMixin {
  static String saerch = 'saerh';
  static String startDate = 'startDate';
  static String endDate = 'endDate';
  static String dropSearch = 'dropSearch';
  static String custmorSearch = 'custmorSearch';
  static String fouces = 'fouces';
  late bool isVisible;
  late bool isScroll;
  late String titleStartDate;
  late TextEditingController numberOrderController;
  late FocusNode focusNodeNameClient;
  late FocusNode focusNodeNumberOrder;
  late FocusNode focusNodeNumberClient;
  late TextEditingController nameClientController;
  late TextEditingController phoneClientController;
  late TextEditingController searchController;
  late FocusNode searchFouces;
  late String titleEndDate;
  late bool canClose;
  OverlayEntry? overlayEntrysearch;
  OverlayEntry? overlayEntryDate;
  final GlobalKey dropdownKeySearch = GlobalKey();
  final GlobalKey dropdownKeyDate = GlobalKey();
  late ScrollController scrollController;
  late Animation<Offset> position;
  late Animation<double> opacity;

  late CustmorControll custmorControll;
  late CounterControll counterControll;
  late SatutsControll satutsControll;
  late AnimationController animationController;
  late Animation<double> animation;
  late String? counters;
  late String? states;
  late int? custmoreIdSelected;
  late String? startDateSelected;
  late String? endDateSelected;
  late int? idCountrsSelected;
  late int? idStateSelected;
  late int? orderNumber;
  late String? clinetName;
  late String? clinetNumber;
  late bool isSearch;
  late bool lodingOrderSarch;
  late bool isFouces;
  late List<OrderModels>? resultSearch;
  Timer? t;

  @override
  void onInit() {
    // TODO: implement onInit
    searchController = TextEditingController();
    searchFouces = FocusNode();
    searchFouces.addListener(
      () {
        isFouces = searchFouces.hasFocus;
        update([fouces]);
      },
    );

    isScroll = true;
    canClose = true;
    counters = null;
    resultSearch = null;
    states = null;
    custmoreIdSelected = null;
    lodingOrderSarch = false;
    isSearch = false;

    titleStartDate = AppText.DateOfStart.tr;
    startDateSelected = null;
    endDateSelected = null;
    custmoreIdSelected = null;
    startDateSelected = null;
    endDateSelected = null;
    idCountrsSelected = null;
    idStateSelected = null;
    orderNumber = null;
    clinetName = null;
    clinetNumber = null;

    isVisible = true;
    super.onInit();
  }

  void setNewCoustmor(int? value) {
    custmoreIdSelected = value;
  }

  void setNewCounters(int? id) {
    idCountrsSelected = id;
  }

  void setNewState(int? id) {
    idStateSelected = id;
  }

  void setSearch(bool value) {
    isSearch = value;
    update([saerch]);
  }

  @override
  void onReady() {
    initText();
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
    super.onReady();
  }

  void initText() {
    nameClientController = TextEditingController();
    numberOrderController = TextEditingController();
    phoneClientController = TextEditingController();
    focusNodeNameClient = FocusNode();
    focusNodeNumberOrder = FocusNode();
    focusNodeNumberClient = FocusNode();
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
    t?.cancel();
    searchController.dispose();

    numberOrderController.dispose();
    nameClientController.dispose();
    numberOrderController.dispose();
    phoneClientController.dispose();
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
    startDateSelected = newTitle;

    update([
      startDate,
    ]);
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

  void ChangedCanClose(bool value) {
    canClose = value;
  }

  void openCloseDropOfCity(
      BuildContext context, SearchControll searchControll) {
    if (!isDropdownVisibleSearch) {
      openDropOfSearch(context, searchControll);
    } else {
      if (canClose) {
        CloseDropOfSearch();
      }
    }
  }

  Future<void> CloseDropOfSearch() async {
    counterControll = Get.find();
    counterControll.CloseDropOfCity();
    if (counterControll.showStautes) {
      StateControll stateControll = Get.find();
      stateControll.CloseDropOfCity();
    }
    animationController.reverse();
    await Future.delayed(
      const Duration(milliseconds: 700),
    );

    //  cityControll.CloseDropOfCity();

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

  void tapSarch(BuildContext context) {
    print(int.tryParse(numberOrderController.text));
    if (int.tryParse(numberOrderController.text) == null &&
        numberOrderController.text.isNotEmpty) {
      Get.snackbar("خطا ", "الرجاء اختيار رقم صالح");
    }
    if (numberOrderController.text.isEmpty &&
        nameClientController.text.isEmpty &&
        phoneClientController.text.isEmpty &&
        idCountrsSelected == null &&
        idStateSelected == null &&
        custmoreIdSelected == null &&
        titleEndDate == AppText.DateOfEnd.tr &&
        titleStartDate == AppText.DateOfStart.tr) {
      Get.snackbar("خطا ", "الرجاء  اختيار احدى الحقول للبحث");
    } else {
      isSearch = true;
      getRemteOrderSaerch();
      CloseDropOfSearch();
      update([saerch]);
    }
  }

  Future<void> getRemteOrderSaerch() async {
    lodingOrderSarch = true;
    update([saerch]);

    final ServicesDio servicesDio = Get.find();
    SearchRemto searchRemto = SearchRemto(servicesDio);

    List<OrderModels>? result = await searchRemto.getSaerch(
        idCountrsSelected,
        idStateSelected,
        titleStartDate,
        titleEndDate,
        nameClientController.text,
        phoneClientController.text,
        1);
    if (result != null) {
      //  print(result.first.client_phone);
      lodingOrderSarch = false;
      resultSearch = result;

      update([saerch]);
    } else {
      lodingOrderSarch = true;
      update([saerch]);
      Get.snackbar(
        "خطا",
        "الرجاء التحقق من الاتصال",
        //backgroundColor: Colors.black,
        colorText: Colors.black,
        duration: const Duration(seconds: 5),
      );
      t = Timer.periodic(const Duration(seconds: 10), (time) async {
        List<OrderModels>? result = await searchRemto.getSaerch(
            idCountrsSelected,
            idStateSelected,
            titleStartDate,
            titleEndDate,
            nameClientController.text,
            phoneClientController.text,
            1);
        print(time.tick);
        if (result != null) {
          Get.snackbar(
            " ",
            "تم اعادة الاتصال",
            colorText: Colors.black,
            duration: const Duration(seconds: 5),
          );

          lodingOrderSarch = false;
          resultSearch = result;
          update([saerch]);
          time.cancel();
        }
      });
    }
  }

  List<GroupUser> searchGroup(
      GroupControll groupControll,
      SearchControll searchControll,
      List<GroupUser> groupNew,
      List<GroupUser> groupUser) {
    groupControll.groupData.forEachIndexed(
      (index, element) {
        if (element.name.contains(searchControll.searchController.text) ||
            element.leader_name
                .contains(searchControll.searchController.text) ||
            element.created_at.contains(searchControll.titleStartDate)) {
          groupNew.add(element);
        }
      },
    );
    if (groupNew.isEmpty) {
      groupUser = groupControll.groupData;
    } else {
      groupUser = groupNew;
      groupNew = [];
    }
    return groupUser;
  }

  List<CustmorAlluser> searchCoustmorAndStaff(
      CustmorAndStaffControll custmorAndStaffControll,
      SearchControll searchControll,
      List<CustmorAlluser> custmorNew,
      List<CustmorAlluser> custmorUser) {
    custmorAndStaffControll.custmorList.forEachIndexed(
      (index, element) {
        if (element.name.contains(searchControll.searchController.text) ||
            element.mobile_no.contains(searchControll.searchController.text) ||
            element.created_at.contains(searchControll.titleStartDate)) {
          custmorNew.add(element);
        }
      },
    );
    if (custmorNew.isEmpty) {
      custmorUser = custmorAndStaffControll.custmorList;
    } else {
      custmorUser = custmorNew;
      custmorNew = [];
    }
    return custmorUser;
  }

  List<LeaderModels> searchLeader(
      LeaderGroupControll leaderGroupControll,
      SearchControll searchControll,
      List<LeaderModels> LeaderNew,
      List<LeaderModels> LeaderUser) {
    leaderGroupControll.leaderListData.forEachIndexed(
      (index, element) {
        if (element.name.contains(searchControll.searchController.text) ||
            element.mobileNo.contains(searchControll.searchController.text) ||
            element.groupName.contains(searchControll.searchController.text) ||
            element.createdAt.contains(searchControll.titleStartDate)) {
          LeaderNew.add(element);
        }
      },
    );
    if (LeaderNew.isEmpty) {
      LeaderUser = leaderGroupControll.leaderListData;
    } else {
      LeaderUser = LeaderNew;
      LeaderNew = [];
    }
    return LeaderUser;
  }
}
