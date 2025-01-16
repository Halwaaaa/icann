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

OverlayEntry showDropdownOfAddUsers(
  BuildContext context,
) {
  final GroupSControol groupSControol = Get.find();
  final renderBox = groupSControol.dropdownKeyAddUsers.currentContext!
      .findRenderObject() as RenderBox;
  final position = renderBox.localToGlobal(Offset.zero);
  OverlayEntry overlayEntry = OverlayEntry(
    builder: (context) {
      return Positioned(
        top: position.dy + 60,
        left: position.dx,
        width: renderBox.size.width,
        bottom: 20,
        child: GetBuilder<GroupSControol>(
          id: GroupSControol.dropDownUserAdd,
          builder: (groupSControol) => AnimatedBuilder(
            animation: groupSControol.animationController,
            builder: (context, child) => SlideTransition(
              position: groupSControol.position,
              child:
                  FadeTransition(opacity: groupSControol.opacity, child: child),
            ),
            child: const BobyAddDrop(),
          ),
        ),
      );
    },
  );
  return overlayEntry;
}

class BobyAddDrop extends StatelessWidget {
  const BobyAddDrop({
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
                  GetBuilder<GroupSControol>(
                    id: GroupSControol.addUserToGroupBefore,
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
                  GetBuilder<GroupSControol>(
                    id: GroupSControol.addUserToGroup,
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
                                      groupSControol: controller,
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
    required this.groupSControol,
    required this.index,
  });
  final GroupSControol groupSControol;
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
          value: groupSControol.selectedUser[index],
          onChanged: (value) {
            value == null ? null : groupSControol.selectedNewUser(value, index);
          },
          title: Center(
            child: Text(
              groupSControol.nameUsers[index],
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
