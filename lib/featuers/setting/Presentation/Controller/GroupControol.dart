import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ican/core/Loction/textApp.dart';
import 'package:ican/core/compnated/Dialog.dart';
import 'package:ican/featuers/AppBar/Presentation/controll/AppbarControll.dart';
import 'package:ican/featuers/home/Presentation/widget/Item/Group/ListGruop.dart';
import 'package:ican/featuers/mainLayout/Presentation/Controll/mainLayoutcontroll.dart';
import 'package:ican/featuers/setting/Presentation/widget/Drop/DropdownOfAddUsers.dart';
import 'package:ican/featuers/setting/Presentation/widget/item/Group/AditGroup.dart';
import 'package:ican/featuers/setting/Presentation/widget/item/Group/ListGrip.dart';
import 'package:ican/featuers/setting/Presentation/widget/item/Group/addGroup.dart';

class GroupSControol extends GetxController with GetTickerProviderStateMixin {
  static String group = 'group';
  static String tapAdd = 'tapAdd';
  static String groupNameAdd = 'groupName';
  static String groupLeaderAdd = 'groupLeader';
  static String dropDownUserAdd = 'groupLeader';
  static String groupUserAdd = 'groupUser';
  static String addUserToGroup = 'addUserToGroup';
  static String addUserToGroupBefore = 'addUserToGroupBefore';

  late FocusNode focusNodeNameGroup;
  late AnimationController animationController;
  late AnimationController animationControllerGroup;
  late Animation<double> animation;
  late Animation<double> animationGroup;
  late Animation<Offset> position;
  late Animation<Offset> positionGroup;
  late Animation<double> opacity;
  late Animation<double> opacityGroup;
  late FocusNode focusNodeLeaderGroup;
  late TextEditingController textNameGroup;
  late TextEditingController textLeadrGroup;
  late int indexModulesGroup;
  late bool isDropdownVisibleAddUsers;
  late bool isTapNameGroup;
  late bool isTapLederGroup;
  late bool isAddErorr;
  late bool isAddDone;
  late bool isTapUser;
  late bool isHaveSelcted;
  late List<bool> selectedUser;
  late AppBarControll appBarControll;
  late List<String> selectedUserBefore = [];
  late List<int> indexSelectedUserBefore = [];
  final GlobalKey dropdownKeyAddUsers = GlobalKey();
  OverlayEntry? overlayEntryAddUsers;

  @override
  void onInit() {
    indexModulesGroup = 0;
    isTapNameGroup = false;
    isTapLederGroup = false;
    isTapUser = false;
    isHaveSelcted = false;
    isAddDone = false;
    isAddErorr = false;
    textLeadrGroup = TextEditingController();
    textNameGroup = TextEditingController();
    selectedUser = List.filled(nameUsers.length, false);

    focusNodeLeaderGroup = FocusNode();
    focusNodeNameGroup = FocusNode();
    ainmatedDroup();
    ainmatedPaged();
    isDropdownVisibleAddUsers = true;
    super.onInit();
  }

  @override
  void onReady() {
    appBarControll = Get.find();
    appBarControll.changedTitelAppBar(AppText.group.tr);
    super.onReady();
  }

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

  void selectedBeforeAdd() {
    selectedUserBefore = [];
    indexSelectedUserBefore = [];
    selectedUser.forEachIndexed(
      (index, element) {
        if (element == true) {
          selectedUserBefore.add(nameUsers[index]);
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
    final Mainlayoutcontroll mainlayoutcontroll = Get.find();

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
    appBarControll.changedTitelAppBar(nameAppbar[index]);
    indexModulesGroup = index;
    update([group]);
  }

  List<String> nameUsers = [
    "رانيا",
    "مصطفى",
    "محمد",
    "خالد",
    "ليث",
  ];
  List<String> nameAppbar = [
    AppText.group.tr,
    AppText.addGroup.tr,
    AppText.editGroup.tr,
  ];

  List<Widget> itemModulesGroup = [
    const ListSGruop(),
    const AddGroup(),
    const EditGroup()
  ];

  void openDropDownAddUsers(BuildContext context) {
    focusNodeLeaderGroup.unfocus();
    focusNodeNameGroup.unfocus();
    overlayEntryAddUsers = showDropdownOfAddUsers(context);
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

  istapAdd(BuildContext context) {
    List<String> eroor = [];
    if (textLeadrGroup.text.isEmpty) {
      eroor.add(AppText.groupLeaderRequired.tr);
    }
    if (textNameGroup.text.isEmpty) {
      eroor.add(AppText.groupNameRequired.tr);
    }
    if (selectedUserBefore.isEmpty) {
      eroor.add(AppText.atLeastOneUserRequired.tr);
    }
    if (eroor.isNotEmpty) {
      isAddErorr = true;
      isAddDone = false;
      update([tapAdd]);

      AwesomeDialog awesomeDialog = Dafultdialog.dailogErorr(context, eroor);

      awesomeDialog.show();
    } else {
      AwesomeDialog awesomeDialog = Dafultdialog.dialogsucces(context);

      awesomeDialog.show();
      isAddErorr = false;
      isAddDone = true;
      update([tapAdd]);
    }
  }
}
