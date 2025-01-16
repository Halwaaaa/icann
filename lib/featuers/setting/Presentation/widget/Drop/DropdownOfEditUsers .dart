import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ican/core/utlies/appimage.dart';
import 'package:ican/core/utlies/color.dart';
import 'package:ican/featuers/AppBar/Presentation/controll/CityControll.dart';
import 'package:ican/featuers/AppBar/Presentation/controll/satutsControll.dart';
import 'package:ican/core/compnated/DadfultBoutton.dart';
import 'package:ican/featuers/home/Presentation/controol/groupControll.dart';
import 'package:ican/featuers/setting/Presentation/Controller/GroupControol.dart';
import 'package:ican/featuers/setting/Presentation/Controller/GroupEditControll.dart';

OverlayEntry showDropdownOfEditUsers(
  BuildContext context,
) {
  final GroupEditControll groupEditControll = Get.find();
  final renderBox = groupEditControll.dropdownKeyEditUsers.currentContext!
      .findRenderObject() as RenderBox;
  final position = renderBox.localToGlobal(Offset.zero);
  OverlayEntry overlayEntry = OverlayEntry(
    builder: (context) {
      return Positioned(
        top: position.dy + 60,
        left: position.dx,
        width: renderBox.size.width,
        bottom: 20,
        
        child: GetBuilder<GroupEditControll>(
          id: GroupEditControll.dropDownUserEdit,
          builder: (groupEditControll) => AnimatedBuilder(
            animation: groupEditControll.animationController,
            builder: (context, child) => SlideTransition(
              position: groupEditControll.position,
              child: FadeTransition(
                  opacity: groupEditControll.opacity, child: child),
            ),
            child: const BobyEditDrop(),
          ),
        ),
      );
    },
  );
  return overlayEntry;
}

class BobyEditDrop extends StatelessWidget {
  const BobyEditDrop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Material(
        color: Colors.transparent,
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 450,
            maxHeight: 400,
          ),
          child: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  offset: const Offset(-4, 4),
                  blurRadius: 4,
                ),
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  offset: const Offset(0, 4),
                  blurRadius: 4,
                ),
              ],
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  GetBuilder<GroupEditControll>(
                    id: GroupEditControll.editUserToGroupBefore,
                    builder: (controller) => Column(
                        children: List.generate(
                      controller.selectedUserBefore.length,
                      (index) {
                        return DadfultBoutton(
                          isEndIcon: false,
                          onTap: () {
                            controller.removeSelectedBefore(
                              controller.indexSelectedUserBefore[index],
                            );
                          },
                          title: controller.selectedUserBefore[index],
                          icon: Image.asset(
                            AppImageName.close,
                            height: 25,
                          ),
                        );
                      },
                    )),
                  ),
                  GetBuilder<GroupEditControll>(
                    id: GroupEditControll.editUserToGroup,
                    builder: (controller) => Column(
                        spacing: 0,
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(
                          controller.nameUsers.length,
                          (index) {
                            return controller.indexSelectedUserBefore
                                    .contains(index)
                                ? const SizedBox.shrink()
                                : Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: SlectedUserAdd(
                                      index: index,
                                      groupEditControll: controller,
                                    ),
                                  );
                          },
                        )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SlectedUserAdd extends StatelessWidget {
  const SlectedUserAdd({
    super.key,
    required this.groupEditControll,
    required this.index,
  });
  final GroupEditControll groupEditControll;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      color: Colors.white,
      shape: const ContinuousRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
        side: BorderSide(color: AppColor.primaryAppbar, width: 1),
      ),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: CheckboxListTile(
          checkColor: Colors.white,
          activeColor: Colors.black,
          //fillColor: const WidgetStatePropertyAll(Colors.white),
          value: groupEditControll.selectedUserEdit[index],
          onChanged: (value) {
            value == null
                ? null
                : groupEditControll.selectedNewUser(value, index);
          },
          title: Center(
            child: Text(
              groupEditControll.nameUsers[index],
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
