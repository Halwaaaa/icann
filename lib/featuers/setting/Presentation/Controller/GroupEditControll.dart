import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ican/core/Loction/textApp.dart';
import 'package:ican/core/compnated/Dialog.dart';
import 'package:ican/core/utlies/color.dart';
import 'package:ican/core/utlies/textStyle.dart';
import 'package:ican/featuers/mainLayout/Presentation/Controll/mainLayoutcontroll.dart';
import 'package:ican/featuers/setting/Presentation/widget/Drop/DropdownOfAddUsers.dart';
import 'package:ican/featuers/setting/Presentation/widget/Drop/DropdownOfEditUsers%20.dart';

class GroupEditControll extends GetxController
    with GetTickerProviderStateMixin {
  static String groupedit = 'groupedit';
  static String editBoutton = 'editBoutton';
  static String groupNameEdit = 'groupName';
  static String groupLeaderEdit = 'groupLeader';
  static String dropDownUserEdit = 'groupLeader';
  static String groupUserEdit = 'groupUser';
  static String editUserToGroup = 'EditUserToGroup';
  static String editUserToGroupBefore = 'EditUserToGroupBefore';
  late AnimationController animationController;
  late AnimationController animationControllerEditPages;
  late Animation<double> animation;
  late Animation<double> animationPages;
  late Animation<Offset> position;
  late Animation<Offset> positionPages;

  late Animation<double> opacity;
  late Animation<double> opacityPages;
  late FocusNode focusNodeLeaderGroup;
  late FocusNode focusNodeNameGroup;
  late int indexModulesGroup;
  late bool isDropdownVisibleEditUsers;
  late bool isTapNameGroup;
  late bool isTapLederGroup;
  late bool isTapUser;
  late bool isHaveSelcted;
  late bool istapEdit;
  late bool istapEditErorr;
  late bool istapEditDane;
  late TextEditingController textNameGroup;
  late TextEditingController textLeaderGroup;
  late List<bool> selectedUserEdit;
  late List<String> selectedUserBefore = [];
  late List<int> indexSelectedUserBefore = [];
  final GlobalKey dropdownKeyEditUsers = GlobalKey();
  OverlayEntry? overlayEntryEditUsers;
  @override
  void onInit() {
    indexModulesGroup = 0;
    isTapNameGroup = false;
    isTapLederGroup = false;
    istapEditDane = false;
    isTapUser = false;
    istapEdit = false;
    isHaveSelcted = false;
    istapEditErorr = false;
    textLeaderGroup = TextEditingController();
    textNameGroup = TextEditingController();

    selectedUserEdit = List.filled(nameUsers.length, false);

    focusNodeLeaderGroup = FocusNode();
    focusNodeNameGroup = FocusNode();
    animatedDrop();
    animatedPages();
    super.onInit();
  }

  @override
  void onClose() {
    animationController.dispose();
    animationControllerEditPages.dispose();
    textLeaderGroup.dispose();
    focusNodeLeaderGroup.dispose();
    focusNodeNameGroup.dispose();
    textNameGroup.dispose();
    super.onClose();
  }

  void animatedPages() {
    animationControllerEditPages = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    animationPages = CurvedAnimation(
      parent: animationControllerEditPages,
      curve: Curves.linear,
    );
    positionPages =
        Tween<Offset>(begin: const Offset(0.0, 0.2), end: const Offset(0, 0))
            .animate(animationPages);
    opacityPages = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(animationPages);
  }

  void animatedDrop() {
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

  void tapGroupNameEdit(bool value) {
    isTapNameGroup = value;
    update([groupNameEdit]);
  }

  tapEdit(BuildContext context) {
    List<String> eroor = [];
    if (textLeaderGroup.text.isEmpty) {
      eroor.add(AppText.groupLeaderRequired.tr);
    }
    if (textNameGroup.text.isEmpty) {
      eroor.add(AppText.groupNameRequired.tr);
    }
    if (selectedUserBefore.isEmpty) {
      eroor.add(AppText.atLeastOneUserRequired.tr);
    }
    if (eroor.isNotEmpty) {
      istapEditErorr = true;
      istapEditDane = false;
      AwesomeDialog awesomeDialog = Dafultdialog.dailogErorr(context, eroor);
      awesomeDialog.show();
      update([editBoutton]);
    } else {
      AwesomeDialog awesomeDialog = Dafultdialog.dialogsucces(context);

      awesomeDialog.show();
      istapEditErorr = false;
      istapEditDane = true;
      update([editBoutton]);
    }
  }

  void selectedNewUser(bool value, int index) {
    selectedUserEdit[index] = value;

    update([editUserToGroup]);
  }

  void selectedBeforeEdit() {
    selectedUserBefore = [];
    indexSelectedUserBefore = [];
    selectedUserEdit.forEachIndexed(
      (index, element) {
        if (element == true) {
          selectedUserBefore.add(nameUsers[index]);
          indexSelectedUserBefore.add(index);
        }
      },
    );
    isHaveSelcted = selectedUserBefore.isNotEmpty;

    update([editUserToGroupBefore, editUserToGroup, groupUserEdit]);
  }

  removeSelectedBefore(
    int index,
  ) {
    selectedUserEdit[index] = false;
    selectedBeforeEdit();
  }

  void tapGroupLeadEdit(bool value) {
    isTapLederGroup = value;

    update([groupLeaderEdit]);
  }

  void tapGroupUserEdit(BuildContext context) {
    isTapUser = !isTapUser;
    final Mainlayoutcontroll mainlayoutcontroll = Get.find();

    if (isTapUser) {
      mainlayoutcontroll.changedCanGoToPages(false);
      openDropDownEditUsers(context);
    } else {
      mainlayoutcontroll.changedCanGoToPages(true);
      closeDropDownEditUsers();
    }

    update([groupUserEdit]);
  }

  void changedIndexModulesGroup(int index) {
    indexModulesGroup = index;
    update([groupedit]);
  }

  List<String> nameUsers = [
    "رانيا",
    "مصطفى",
    "محمد",
    "خالد",
    "ليث",
  ];

  void openDropDownEditUsers(BuildContext context) {
    focusNodeLeaderGroup.unfocus();
    focusNodeNameGroup.unfocus();

    overlayEntryEditUsers = showDropdownOfEditUsers(context);
    Overlay.of(context).insert(overlayEntryEditUsers!);
    startAnimated();
    selectedBeforeEdit();
  }

  void startAnimated() {
    animationController.reset();
    animationController.forward();
  }

  Future<void> closeDropDownEditUsers() async {
    animationController.reverse();
    await Future.delayed(
      const Duration(milliseconds: 200),
    );
    overlayEntryEditUsers?.remove();
    overlayEntryEditUsers = null;
    selectedBeforeEdit();
  }
}
