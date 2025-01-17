import 'dart:async';
import 'dart:math';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ican/core/Loction/textApp.dart';
import 'package:ican/core/compnated/Dialog.dart';
import 'package:ican/core/services/hivenServices.dart';
import 'package:ican/core/services/servicesDio.dart';
import 'package:ican/core/utlies/color.dart';
import 'package:ican/featuers/AppBar/Data/Locale/LocalCustmor.dart';
import 'package:ican/featuers/AppBar/Data/Locale/LocaleCountres.dart';
import 'package:ican/featuers/AppBar/Data/Remote/RemoteCustmor.dart';
import 'package:ican/featuers/AppBar/Presentation/controll/AppbarControll.dart';
import 'package:ican/featuers/AppBar/Presentation/controll/custmorControll.dart';
import 'package:ican/featuers/AppBar/Presentation/model/CustmorUser.dart';
import 'package:ican/featuers/home/Date/Remote/RemoteGroup.dart';
import 'package:ican/featuers/home/Presentation/controol/groupControll.dart';
import 'package:ican/featuers/home/Presentation/models/GroupSotreModles.dart';
import 'package:ican/featuers/home/Presentation/models/GroupUser.dart';
import 'package:ican/featuers/home/Presentation/widget/Item/Group/ListGruop.dart';
import 'package:ican/featuers/home/Presentation/widget/Item/Group/groupMain.dart';
import 'package:ican/featuers/mainLayout/Presentation/Controll/mainLayoutcontroll.dart';
import 'package:ican/featuers/setting/Presentation/Controller/LeaderGroupControll.dart';
import 'package:ican/featuers/setting/Presentation/Models/LeaderModels.dart';
import 'package:ican/featuers/setting/Presentation/widget/Drop/DropdownOfAddUsers.dart';
import 'package:ican/featuers/setting/Presentation/widget/Drop/DropdownOfLaeder.dart';
import 'package:ican/featuers/setting/Presentation/widget/item/Group/ListGrip.dart';
import 'package:ican/featuers/setting/Presentation/widget/item/Group/addGroup.dart';
import 'package:ican/featuers/setting/Presentation/widget/item/GroupLeaderAndStaiff/LeaderGroupAndStaffAdd.dart';

class GroupSControol extends GetxController with GetTickerProviderStateMixin {
  static String group = 'group';
  static String tapAdd = 'tapAdd';
  static String groupNameAdd = 'groupName';
  static String groupLeaderAdd = 'groupLeader';
  static String dropDownUserAdd = 'groupLeader';
  static String groupUserAdd = 'groupUser';
  static String addUserToGroup = 'addUserToGroup';
  static String addLaederToGroup = 'addLaederToGroup';
  static String addUserToGroupBefore = 'addUserToGroupBefore';
  static String upDataGroup = 'upDataGroup';

  late FocusNode focusNodeNameGroup;
  late AnimationController animationController;
  late AnimationController animationControllerGroup;
  late Animation<double> animation;
  late Animation<double> animationGroup;
  late Animation<double> animationLaeder;
  late Animation<Offset> position;
  late Animation<Offset> positionGroup;
  late Animation<double> opacity;
  late Animation<double> opacityGroup;
  late FocusNode focusNodeLeaderGroup;
  late TextEditingController textNameGroup;
  late TextEditingController textLeadrGroup;
  late int indexModulesGroup;
  late bool isDropdownVisibleAddUsers;
  late bool isDropdownVisibleAddLaeder;
  late bool isTapNameGroup;
  late bool lodingUpData;
  late bool isTapLederGroup;
  late bool lodingTap;
  late String titleLaeder;
  late int? idLeader;
  late bool isTapUser;
  late bool isHaveSelcted;
  late bool isHaveSelctedLaeder;
  late List<bool> selectedUser;
  late List<bool> selectedLaeder;
  late AppBarControll appBarControll;
  late Mainlayoutcontroll mainlayoutcontroll;
  late List<CustmorUser> selectedUserBefore = [];
  late List<int> indexSelectedUserBefore = [];
  late List<CustmorUser> nameCustmor;
  late List<LeaderModels> nameLaeder;
  late int? idGroupData;
  late int? idUpdataLaedr;

  late bool lodingGroup;
  final GlobalKey dropdownKeyAddUsers = GlobalKey();
  final GlobalKey dropdownKeyAddLeader = GlobalKey();
  late Color colorSelected;
  late Color fillcolorSelected;

  OverlayEntry? overlayEntryAddUsers;
  OverlayEntry? overlayEntryAddLaeder;
  Timer? t;

  @override
  void onInit() {
    indexModulesGroup = 0;

    textLeadrGroup = TextEditingController();
    textNameGroup = TextEditingController();
    init();

    focusNodeLeaderGroup = FocusNode();
    focusNodeNameGroup = FocusNode();
    ainmatedDroup();
    ainmatedPaged();
    isDropdownVisibleAddUsers = true;
    isDropdownVisibleAddLaeder = true;
    super.onInit();
  }

  void init() {
    idUpdataLaedr = null;
    nameCustmor = nameCustmorDafult;
    nameLaeder = nameLaederDafult;
    isTapNameGroup = false;
    isTapLederGroup = false;
    textNameGroup.clear();
    isTapUser = false;
    isHaveSelcted = false;
    titleLaeder = AppText.laeder.tr;
    colorSelected = AppColor.primaryAppbar;
    fillcolorSelected = Colors.white;
    initLaeder(nameLaeder.length);
    selectedUser = List.filled(nameCustmor.length, false);
    idGroupData = null;
    lodingUpData = false;
    lodingGroup = true;
    idLeader = null;

    isHaveSelctedLaeder = false;
    lodingTap = false;
  }

  void initLaeder(int lenght) {
    selectedLaeder = List.filled(lenght, false);
    colorSelected = AppColor.primaryAppbar;
    fillcolorSelected = Colors.white;
  }

  void setIdGroup(int id) {
    idGroupData = id;
  }

  void setNameCustmor(List<CustmorUser> n) {
    nameCustmor = n;
  }

  void setNameLaeder(List<LeaderModels> n) {
    if (nameLaeder == nameLaederDafult) {
      nameLaeder = n;
      initLaeder(n.length);
    }

    //update([addLaederToGroup]);
  }

  @override
  void onReady() {
    appBarControll = Get.find();
    mainlayoutcontroll = Get.find();
    appBarControll.changedTitelAppBar(AppText.group.tr);
    Get.put(LeaderGroupControll(), permanent: true);
    Get.put(GroupControll(), permanent: true);
    super.onReady();
  }

  List<CustmorUser> nameCustmorDafult = [
    CustmorUser(id: 0, name: "ddd"),
    CustmorUser(id: 1, name: "ddddsd"),
    CustmorUser(id: 2, name: 'ddssfff'),
  ];
  List<LeaderModels> nameLaederDafult = [
    LeaderModels(
        id: 1,
        name: "ddddddddd",
        mobileNo: "ssss",
        createdAt: "zz",
        groupName: "zz"),
  ];

  void ainmatedDroup() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.linear,
    );
    position =
        Tween<Offset>(begin: const Offset(0.0, 0.2), end: const Offset(0, 0))
            .animate(animation);
    opacity = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(animation);
  }

  void ainmatedPaged() {
    animationControllerGroup = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    animationGroup = CurvedAnimation(
      parent: animationControllerGroup,
      curve: Curves.linear,
    );

    positionGroup =
        Tween<Offset>(begin: const Offset(0.0, 0.2), end: const Offset(0, 0))
            .animate(animationGroup);
    opacityGroup = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(animationGroup);
  }

  @override
  onClose() {
    t?.cancel();
    textLeadrGroup.dispose();
    textNameGroup.dispose();
    animationController.dispose();
    animationControllerGroup.dispose();
    super.onClose();
  }

  bool onwillPop() {
    changedIndexModulesGroup(indexModulesGroup - 1);
    return false;
  }

  void tapGroupNameAdd(bool value) {
    isTapNameGroup = value;
    update([groupNameAdd]);
  }

  void selectedNewUser(bool value, int index) {
    selectedUser[index] = value;

    update([addUserToGroup]);
  }

  toggleDropdown(bool value) {
    isDropdownVisibleAddLaeder = value;
    update([addLaederToGroup]);
  }

  void selectedNewLaeder(int index) {
    // selectedLaeder[index] = value;
    bool value = selectedLaeder[index];
    selectedLaeder = List.filled(nameLaeder.length, false);
    selectedLaeder[index] = !value;
    if (!value) {
      //  showStautes = true;
      // showTitel = true;
      isHaveSelctedLaeder = true;
      titleLaeder = nameLaeder[index].name;
      idLeader = nameLaeder[index].id;

      changedfillcolorSelected(AppColor.primaryAppbar);
      changedcolorSelected(Colors.white);
      changedTitieLaeder(
        nameLaeder[index].name,
      );
      closeDropOfLaeder();
    } else {
      isHaveSelctedLaeder = false;
      idLeader = null;
      changedTitieLaeder(
        AppText.laeder.tr,
      );
      changedfillcolorSelected(Colors.white);
      changedcolorSelected(AppColor.primaryAppbar);
    }
    closeDropOfLaeder();
  }

  changedfillcolorSelected(Color newColor) {
    fillcolorSelected = newColor;
  }

  changedcolorSelected(Color newColor) {
    colorSelected = newColor;
    update([groupLeaderAdd]);
  }

  void openCloseDropOfLaeder(
    BuildContext context,
  ) {
    if (isDropdownVisibleAddLaeder) {
      openDropOfLaeder(
        context,
      );
    } else {
      closeDropOfLaeder();
    }
  }

  void openDropOfLaeder(
    BuildContext context,
  ) {
    changedcolorSelected(Colors.black);
    toggleDropdown(false);

    overlayEntryAddLaeder = showDropdownOfAddLaeder(context);

    Overlay.of(context).insert(overlayEntryAddLaeder!);
    print("object");
    tapGroupLeaderAdd(true);
    update([addLaederToGroup]);

    //animationControllerGroup.reset();
    //animationControllerGroup.forward();
  }

  Future<void> closeDropOfLaeder() async {
    changedcolorSelected(AppColor.primaryAppbar);

    tapGroupLeaderAdd(false);

    animationController.reverse();
    await Future.delayed(const Duration(milliseconds: 400));

    overlayEntryAddLaeder?.remove();
    overlayEntryAddLaeder = null;
    toggleDropdown(true);
  }

  void selectedBeforeAdd() {
    selectedUserBefore = [];
    indexSelectedUserBefore = [];
    selectedUser.forEachIndexed(
      (index, element) {
        if (element == true) {
          selectedUserBefore.add(nameCustmor[index]);
          indexSelectedUserBefore.add(index);
        }
      },
    );
    isHaveSelcted = selectedUserBefore.isNotEmpty;

    update([addUserToGroupBefore, addUserToGroup, groupUserAdd]);
  }

  removeSelectedBefore(
    int index,
  ) {
    selectedUser[index] = false;
    selectedBeforeAdd();
  }

  void tapGroupLeaderAdd(bool value) {
    isTapLederGroup = value;

    update([groupLeaderAdd]);
  }

  void tapGroupUserAdd(BuildContext context) {
    isTapUser = !isTapUser;

    if (isTapUser) {
      mainlayoutcontroll.changedCanGoToPages(false);
      openDropDownAddUsers(context);
    } else {
      mainlayoutcontroll.changedCanGoToPages(true);
      closeDropDownAddUsers();
    }

    update([groupUserAdd]);
  }

  void changedIndexModulesGroup(int index) {
    if (index == 1) {
      init();
    }
    appBarControll.changedTitelAppBar(nameAppbar[index]);

    indexModulesGroup = index;
    update([group]);
  }

  List<String> nameAppbar = [
    AppText.group.tr,
    AppText.addGroup.tr,
    AppText.editGroup.tr,
  ];

  List<Widget> itemModulesGroup = [
    const ListSGruop(),
    const AddGroup(
      isAdd: true,
    ),
    const AddGroup(
      isAdd: false,
    ),
  ];

  void openDropDownAddUsers(BuildContext context) {
    focusNodeLeaderGroup.unfocus();
    focusNodeNameGroup.unfocus();

    overlayEntryAddUsers = showDropdownOfAddUsers(
        context, selectedUserBefore, indexSelectedUserBefore);
    Overlay.of(context).insert(overlayEntryAddUsers!);
    startAnimated();
    selectedBeforeAdd();
  }

  void startAnimated() {
    animationController.reset();
    animationController.forward();
  }

  Future<void> closeDropDownAddUsers() async {
    animationController.reverse();
    await Future.delayed(
      const Duration(milliseconds: 200),
    );
    overlayEntryAddUsers?.remove();
    overlayEntryAddUsers = null;

    selectedBeforeAdd();
  }

  istapAdd(BuildContext context, bool isAdd) async {
    mainlayoutcontroll.changedLoding(true);
    List<int> idUser = selectedUserBefore
        .map(
          (e) => e.id,
        )
        .toList();

    ServicesDio servicesDio = Get.find();
    RemoteGroup remoteGroup = RemoteGroup(servicesDio);
    GroupsotreModles groupsotreModles = GroupsotreModles(
        name: textNameGroup.text, leader_id: idLeader, users: idUser);
    isAdd
        ? await remoteGroup
            .sorteGroup(groupsotreModles.toJson(), context)
            .then((f) {
            mainlayoutcontroll.changedLoding(false);
          })
        : await remoteGroup
            .upDataGroup(groupsotreModles.toJson(), context, idUpdataLaedr!)
            .then((f) {
            mainlayoutcontroll.changedLoding(false);
          });
  }

  void changedTitieLaeder(String name) {
    titleLaeder = name;
    update([groupLeaderAdd]);
  }

  Future<void> updataGroup(int id) async {
    lodingUpData = true;
    idUpdataLaedr = id;

    final CustmorControll custmorControll = Get.find();
    final LeaderGroupControll leaderGroupControll = Get.find();
    if (!custmorControll.loding && !leaderGroupControll.lodingLeaders) {
      ServicesDio servicesDio = Get.find();

      RemoteGroup remoteGroup = RemoteGroup(servicesDio);

      GroupsotreModles? groupsotreModles = await remoteGroup.getGroupById(id);
      if (groupsotreModles != null) {
        nameLaeder = leaderGroupControll.leaderListData;
        initUpataLaeder(groupsotreModles);
        selectedUserBefore = [];
        indexSelectedUserBefore = [];
        nameCustmor = custmorControll.nameCustmor;
        selectedUser = List.filled(nameCustmor.length, false);
        textNameGroup.text = groupsotreModles.name ?? "";

        groupsotreModles.users?.forEach(
          (element) {
            int u = element as int;
            nameCustmor.forEachIndexed(
              (index, element) {
                if (element.id == u) {
                  print(index);
                  selectedUserBefore.add(element);
                  indexSelectedUserBefore.add(index);
                  selectedUser[index] = true;
                }
              },
            );
          },
        );
        for (var element in selectedUserBefore) {
          print(element.name);
        }
        lodingUpData = false;
        isHaveSelcted = selectedUserBefore.isNotEmpty;
        update(
            [upDataGroup, addUserToGroupBefore, addUserToGroup, groupUserAdd]);
        // textLeadrGroup = true;
      }
    }
  }

  void initUpataLaeder(GroupsotreModles o) {
    LeaderModels? leaderModels;
    int? indexl;
    nameLaeder.forEachIndexed(
      (index, element) {
        if (element.id == o.leader_id!) {
          leaderModels = element;
          indexl = index;
        }
      },
    );
    {}

    titleLaeder = leaderModels?.name ?? AppText.laeder.tr;

    selectedLaeder = List.filled(nameLaeder.length, false);
    idLeader = o.leader_id;
    if (indexl != null) {
      selectedLaeder[indexl!] = true;
      colorSelected = Colors.white;
      isHaveSelctedLaeder = true;
      fillcolorSelected = AppColor.primaryAppbar;
    } else {
      isHaveSelctedLaeder = false;
      colorSelected = AppColor.primaryAppbar;
      fillcolorSelected = Colors.white;
    }
  }
}
