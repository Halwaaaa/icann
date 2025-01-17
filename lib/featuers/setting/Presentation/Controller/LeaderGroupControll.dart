import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:ican/core/Loction/textApp.dart';
import 'package:ican/core/services/hivenServices.dart';
import 'package:ican/core/services/servicesDio.dart';
import 'package:ican/core/utlies/Modules/MoudulesSetting.dart';
import 'package:ican/core/utlies/color.dart';
import 'package:ican/featuers/AppBar/Data/Locale/localState.dart';
import 'package:ican/featuers/AppBar/Data/Remote/RemoteCounter.dart';
import 'package:ican/featuers/AppBar/Data/Remote/RemoteState.dart';
import 'package:ican/featuers/AppBar/Presentation/controll/AppbarControll.dart';
import 'package:ican/featuers/AppBar/Presentation/model/CountersUser.dart';
import 'package:ican/featuers/AppBar/Presentation/model/StateUser.dart';
import 'package:ican/featuers/mainLayout/Presentation/Controll/mainLayoutcontroll.dart';
import 'package:ican/featuers/setting/Data/Locle/LocaleLeader.dart';
import 'package:ican/featuers/setting/Data/Remote/RemoteLeaders.dart';
import 'package:ican/featuers/setting/Presentation/Controller/StateLaederControll.dart';
import 'package:ican/featuers/setting/Presentation/Controller/countersLaederAndStaff.dart';
import 'package:ican/featuers/setting/Presentation/Controller/settingControll.dart';
import 'package:ican/featuers/setting/Presentation/Models/LeaderModels.dart';
import 'package:ican/featuers/setting/Presentation/Models/laederInfirmation.dart';
import 'package:ican/featuers/setting/Presentation/widget/item/GroupLeaderAndStaiff/LeaderGroupAndStaffAdd.dart';
import 'package:ican/featuers/setting/Presentation/widget/item/GroupLeaderAndStaiff/LeaderGroupAndStaffList.dart';

class LeaderGroupControll extends GetxController
    with GetTickerProviderStateMixin {
  static String leaderGroup = 'leaderGroup';
  static String leaderGroupTextFormAdd = 'leaderGroupTextFormAdd';
  static String leaderGroupTextFormEdit = 'leaderGroupTextFormEdit';
  static String lodingAdd = 'lodingAdd';

  late AnimationController animationControllerAdd;
  late Animation<double> animationAdd;
  late Animation<Offset> positionAdd;
  late Animation<double> opacityAdd;
  late TextEditingController textControllersadd;
  late TextEditingController textControllersNameAll;
  late TextEditingController textControllersUserNmae;
  late TextEditingController textControllersPassworde;
  late TextEditingController textControllersaddress;
  late TextEditingController textControllersPhone;
  late TextEditingController textControllersNotes;
  late CountersLaederControll countersLaederControll;
  late StateLaederControll stateLaederControll;
  late bool lodingTap;
  late List<TextEditingController> textControllersEdit;
  late List<FocusNode> textFoucsNodeAdd;
  late List<FocusNode> textFoucsNodeEdit;
  late AppBarControll appBarControll;
  late List<bool> iSFoucesAdd;
  late List<bool> iSFoucesEdit;
  late bool lodingLeaders;
  late bool lodingStafii;
  late int? idStutes;
  late bool lodingEdit;
  late int? idLeaderUpdata;
  late int? idUpDtataLaeder;
  late SettingControll settingControll;
  late List<String> nameTitel;

  late List<LeaderModels> leaderListData;
  Timer? t;

  int length = 7;
  // modulesTitelTextFormForLeader.length;

  late int indexmodulesLeaderGroup;

  @override
  void onInit() {
    indexmodulesLeaderGroup = 0;

    settingControll = Get.find();

    nameTitel = modulesSetting()[settingControll.indexModulesSetting] ==
            AppText.groupLeader.tr
        ? [
            AppText.groupLeader.tr,
            AppText.addGroupLeader.tr,
            AppText.editGroupLeader.tr,
          ]
        : [
            'الموظفين',
            'اضافة موظف',
            'التعديل على الموظف',
          ];
    iniTextFormFiled();
    iniFouceNode();

    init();
    lodingEdit = false;

    idLeaderUpdata = null;
    fouceaddListener();

    super.onInit();
  }

  void init() {
    idLeaderUpdata = null;
    lodingLeaders = false;
    leaderListData = leaderListDafult;
    animatedPages();
    idStutes = null;
    lodingTap = false;
    initIs();
    claerText();

    getLocalLeader();
  }

  @override
  void onReady() {
    appBarControll = Get.find();
    countersLaederControll = Get.find();
    stateLaederControll = Get.find();
    countersLaederControll.init();
    stateLaederControll.init();
    //  Get.put((),);
    super.onReady();
  }

  @override
  void onClose() {
    t?.cancel();
    disPoseTextEditControol();
    disposeFoucsNode();
    super.onClose();
  }

  void initIs() {
    iSFoucesAdd = List.filled(length, false);
    iSFoucesEdit = List.filled(length, false);
  }

  void animatedPages() {
    animationControllerAdd = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    animationAdd =
        CurvedAnimation(parent: animationControllerAdd, curve: Curves.linear);
    positionAdd =
        Tween<Offset>(begin: const Offset(0, 0.2), end: const Offset(0, 0))
            .animate(animationAdd);
    opacityAdd = Tween<double>(begin: 0, end: 1).animate(animationAdd);
  }

  void iniTextFormFiled() {
    textControllersNameAll = TextEditingController();
    textControllersUserNmae = TextEditingController();
    textControllersPassworde = TextEditingController();
    textControllersNotes = TextEditingController();
    textControllersPhone = TextEditingController();
    textControllersaddress = TextEditingController();

    textControllersEdit = List.generate(length, (intdex) {
      return TextEditingController();
    });
  }

  void iniFouceNode() {
    textFoucsNodeAdd = List.generate(length, (intdex) {
      return FocusNode();
    });
    textFoucsNodeEdit = List.generate(length, (intdex) {
      return FocusNode();
    });
  }

  void claerText() {
    textControllersNameAll.clear();
    textControllersUserNmae.clear();
    textControllersPassworde.clear();
    textControllersNotes.clear();
    textControllersPhone.clear();
    textControllersaddress.clear();
  }

  void disPoseTextEditControol() {
    textControllersNameAll.dispose();
    textControllersUserNmae.dispose();
    textControllersPassworde.dispose();
    textControllersNotes.dispose();
    textControllersPhone.dispose();

    for (var element in textControllersEdit) {
      element.dispose();
    }
  }

  void disposeFoucsNode() {
    for (var element in textFoucsNodeAdd) {
      element.dispose();
    }
    for (var element in textFoucsNodeEdit) {
      element.dispose();
    }
  }

  void setIdUpDataLaeder(int id) {
    idUpDtataLaeder = id;
  }

  void changedIndexModulesLeaderGroup(int index, bool isAdd) {
    Mainlayoutcontroll mainlayoutcontroll = Get.find();
    mainlayoutcontroll.scrollcontroller?.jumpTo(0);
    if (isAdd) {
      lodingEdit = false;
      //update([leaderGroupTextFormAdd]);
      countersLaederControll.init();
      stateLaederControll.init();
      init();
      update([
        leaderGroupTextFormAdd,
      ]);
    }
    appBarControll.changedTitelAppBar(nameTitel[index]);
    countersLaederControll.toggleDropdown(true);
    countersLaederControll.toggleDropdownStautes(true);
    stateLaederControll.toggleDropdown(true);

    indexmodulesLeaderGroup = index;
    update([leaderGroup]);
  }

  List<Widget> itemModulesLeaderGroup = [
    const LeadergroupAndStafflist(),
    const LeaderGroupAndStaffadd(
      isAdd: true,
    ),
    const LeaderGroupAndStaffadd(
      isAdd: false,
    ),
  ];

  void fouceaddListener() {
    textFoucsNodeAdd.forEachIndexed(
      (
        index,
        element,
      ) {
        element.addListener(
          () {
            print(element.hasFocus);
            iSFoucesAdd[index] = element.hasFocus;
            update([leaderGroupTextFormAdd, leaderGroupTextFormEdit]);
          },
        );
      },
    );
    textFoucsNodeEdit.forEachIndexed(
      (
        index,
        element,
      ) {
        element.addListener(
          () {
            //  print(element.hasFocus);
            iSFoucesEdit[index] = element.hasFocus;
            update([leaderGroupTextFormEdit]);
          },
        );
      },
    );
  }

  void scrollToIndex(int index) {
    final Mainlayoutcontroll mainlayoutcontroll = Get.find();
    const itemHeight = 85.0; // ارتفاع العنصر مع الحواف
    final targetOffset = index * itemHeight;
    //print(mainlayoutcontroll.scrollcontroller!.offset - targetOffset);
    mainlayoutcontroll.scrollcontroller?.animateTo(
      targetOffset,
      duration: const Duration(microseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  Future<void> getLocalLeader() async {
    lodingLeaders = true;
    update([leaderGroup]);
    bool isNullLocal = false;
    Box<List<dynamic>> boxLeader =
        await Hive.openBox<List<dynamic>>(HivenServices.leaders);
    LocaleLeader localeLeader = LocaleLeader(boxLeader);
    List<LeaderModels>? local = await localeLeader.getLeader();
    if (local != null) {
      lodingLeaders = false;

      leaderListData = local;
      update([leaderGroup]);
    } else {
      isNullLocal = true;
      lodingLeaders = true;
      leaderListData = leaderListDafult;
      update([leaderGroup]);
    }
    getRemteLeader(isNullLocal, localeLeader);
  }

  Future<void> getRemteLeader(
      bool isNullLoacl, LocaleLeader localeLeader) async {
    final ServicesDio servicesDio = Get.find();
    RemoteLeadersAndStaff remoteLeaders =
        RemoteLeadersAndStaff(servicesDio: servicesDio);

    List<LeaderModels>? result = await remoteLeaders.getLeader();
    if (result != null) {
      lodingLeaders = false;
      leaderListData = result;
      localeLeader.setLeader(
        result,
      );
      update([leaderGroup]);
    } else {
      if (isNullLoacl) {
        Get.snackbar(
          "خطا",
          "الرجاء التحقق من الاتصال",
          //backgroundColor: Colors.black,
          colorText: Colors.black,
          duration: const Duration(seconds: 5),
        );
        t = Timer.periodic(const Duration(seconds: 10), (time) async {
          List<LeaderModels>? result = await remoteLeaders.getLeader();
          if (result != null) {
            Get.snackbar(
              " ",
              "تم اعادة الاتصال",
              colorText: Colors.black,
              duration: const Duration(seconds: 5),
            );
            lodingLeaders = false;
            leaderListData = result;
            update([leaderGroup]);
            time.cancel();
          }
        });
      }
    }
  }

  Future<void> tapAddLaedr(BuildContext context) async {
    Mainlayoutcontroll mainlayoutcontroll = Get.find();
    mainlayoutcontroll.changedLoding(true);
    final ServicesDio servicesDio = Get.find();
    final CountersLaederControll countersLaederControll = Get.find();
    final StateLaederControll stateLaederControll = Get.find();
    RemoteLeadersAndStaff remoteLeaders =
        RemoteLeadersAndStaff(servicesDio: servicesDio);
    LeaderWithDetails leaderWithDetails = LeaderWithDetails(
      address: textControllersaddress.text,
      countryId: countersLaederControll.indexCountre,
      mobileNo: int.tryParse(textControllersPhone.text) ?? "j",
      name: textControllersNameAll.text,
      note: textControllersNotes.text,
      password: textControllersPassworde.text,
      stateId: stateLaederControll.idStates,
      status: countersLaederControll.idStautes,
      username: textControllersUserNmae.text,
      cityId: null,
    );
    if (indexmodulesLeaderGroup == 1) {
      await remoteLeaders
          .storeLaederAndStaff(
              leaderWithDetails.toJson(), context, settingControll.isStiff!)
          .then((n) {
        mainlayoutcontroll.changedLoding(false);

        lodingTap = false;
        update([lodingAdd]);
      }).catchError((Erro) {
        mainlayoutcontroll.changedLoding(false);
      });
    } else {
      await remoteLeaders
          .updataLaederAndStaff(leaderWithDetails.toJson(), context,
              idLeaderUpdata!, settingControll.isStiff!)
          .then((n) {
        mainlayoutcontroll.changedLoding(false);
      }).catchError((y) {
        print("${y}jjjjjjjjjjjjjjj");
        mainlayoutcontroll.changedLoding(false);
      });
    }
  }

  remoteEditLaeder(int id) async {
    print("object");
    lodingEdit = true;
    if (countersLaederControll.counters != null) {
      await getEdit(id);
    }
  }

  Future<void> getEdit(int id) async {
    idLeaderUpdata = id;
    update([leaderGroupTextFormEdit]);
    ServicesDio servicesDio = Get.find();
    CountersLaederControll countersLaederControll = Get.find();
    RemoteLeadersAndStaff remoteLeaders =
        RemoteLeadersAndStaff(servicesDio: servicesDio);
    LeaderWithDetails? leaderWithDetails =
        await remoteLeaders.editLaederAndStaff(id, settingControll.isStiff!);

    if (leaderWithDetails != null) {
      await countersget(servicesDio, leaderWithDetails, countersLaederControll);
    }
  }

  Future<void> countersget(
      ServicesDio servicesDio,
      LeaderWithDetails leaderWithDetails,
      CountersLaederControll countersLaederControll) async {
    RemoteCounter remoteCounter = RemoteCounter(servicesDio: servicesDio);
    CountersUser? countres =
        await remoteCounter.getCountersbyId(leaderWithDetails.countryId!);

    if (countres != null) {
      initCountres(countersLaederControll, countres, leaderWithDetails);
      await staut(servicesDio, leaderWithDetails, countersLaederControll);
    }
  }

  Future<void> staut(
      ServicesDio servicesDio,
      LeaderWithDetails leaderWithDetails,
      CountersLaederControll countersLaederControll) async {
    RemoteStates remoteStates = RemoteStates(servicesDio: servicesDio);

    StateUser? stateUser = await remoteStates.getStautesbyid(
        leaderWithDetails.countryId!, leaderWithDetails.stateId!);
    // List<StateUser>? statesUser =
    // await remoteStates.getStautes(leaderWithDetails.countryId!);

    if (stateUser != null) {
      Box boxStautes = await Hive.openBox<dynamic>(HivenServices.stautes);

      //LocaleStaute localeStaute = LocaleStaute(boxStautes);
      // localeStaute.setNewStautes(statesUser!);
      StateGet(countersLaederControll, leaderWithDetails, stateUser);
    }
  }

  void StateGet(CountersLaederControll countersLaederControll,
      LeaderWithDetails leaderWithDetails, StateUser stateUser) {
    countersLaederControll.changedIdCounters(leaderWithDetails.countryId!);
    countersLaederControll.changedIdStautes(leaderWithDetails.status!);
    stateLaederControll.ChangedIdState(stateUser.id);
    initSatet(stateUser, countersLaederControll, leaderWithDetails);
    initText(leaderWithDetails);
    lodingEdit = false;

    //   mainlayoutcontroll.changedLoding(true);
    update([leaderGroupTextFormEdit]);
  }

  void initText(LeaderWithDetails leaderWithDetails) {
    textControllersNameAll.text = leaderWithDetails.name ?? "";
    textControllersUserNmae.text = leaderWithDetails.username ?? "";
    textControllersPassworde.text = leaderWithDetails.password ?? "";
    textControllersaddress.text = leaderWithDetails.address ?? "";
    textControllersNotes.text = leaderWithDetails.note ?? "";
    textControllersPhone.text = leaderWithDetails.mobileNo ?? "";
  }

  void initSatet(
      StateUser stateUser,
      CountersLaederControll countersLaederControll,
      LeaderWithDetails leaderWithDetails) {
    countersLaederControll.changedshowStautes(true);
    countersLaederControll.changedTitelStautes(stateUser.name);
    countersLaederControll.showTitelState(false);
    stateLaederControll.ChangedTitieCity(stateUser.name);
    getStateSelected(leaderWithDetails);

    stateLaederControll.ChangedcolorSelected(Colors.white);
    stateLaederControll.ChangedfillcolorSelected(AppColor.primaryAppbar);
  }

  void getStateSelected(LeaderWithDetails leaderWithDetails) {
    stateLaederControll.statesOfCounters(leaderWithDetails.stateId!, true);
    if (stateLaederControll.looding == false) {
      List<StateUser> state = stateLaederControll.stateItem;
      List<bool> selected = stateLaederControll.selectedState;
      selected = List.filled(state.length, false);

      int? indexSelected;
      state.forEachIndexed(
        (index, element) {
          if (element.id == leaderWithDetails.stateId!) {
            indexSelected = index;
          }
        },
      );
      if (indexSelected != null) {
        selected[indexSelected!] = true;
      }
      stateLaederControll.setSelected(selected);
    }
  }

  void initCountres(CountersLaederControll countersLaederControll,
      CountersUser countreSelected, LeaderWithDetails leaderWithDetails) {
    setSelectedCountres(countersLaederControll, countreSelected);
    List<bool> selectedStatues = [false, false];
    if (leaderWithDetails.status != null) {
      selectedStatues[leaderWithDetails.status!] = true;
    }
    countersLaederControll.setSelectedStautes(selectedStatues);
    countersLaederControll.ChangedTitieCity(countreSelected.name);
    countersLaederControll.ChangedTitieSatutes(
        countersLaederControll.nameStatues[leaderWithDetails.status!]);
    countersLaederControll.ChangedcolorSelected(Colors.white);
    countersLaederControll.ChangedfillcolorSelected(AppColor.primaryAppbar);
    countersLaederControll.ChangedcolorSelectedStatues(Colors.white);
    countersLaederControll.ChangedfillcolorSelectedStatues(
        AppColor.primaryAppbar);
  }

  void setSelectedCountres(CountersLaederControll countersLaederControll,
      CountersUser countreSelected) {
    List<CountersUser>? counters = countersLaederControll.counters;
    List<bool> selectedCounters = countersLaederControll.selectedCounters;
    selectedCounters = List.generate(counters!.length, (index) => false);
    int? indexSelected;
    counters.forEachIndexed((index, element) {
      if (element.id == countreSelected.id) {
        indexSelected = index;
      }
    });
    if (indexSelected != null) {
      selectedCounters[indexSelected!] = true;
    }
    countersLaederControll.setSelecteCounters(selectedCounters);
  }
}
