import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ican/core/utlies/appimage.dart';
import 'package:ican/core/utlies/color.dart';
import 'package:ican/featuers/AppBar/Presentation/controll/CounterControll.dart';
import 'package:ican/featuers/AppBar/Presentation/controll/custmorControll.dart';
import 'package:ican/featuers/AppBar/Presentation/controll/satutsControll.dart';
import 'package:ican/core/compnated/DadfultBoutton.dart';
import 'package:ican/featuers/AppBar/Presentation/model/CustmorUser.dart';
import 'package:ican/featuers/home/Presentation/controol/groupControll.dart';
import 'package:ican/featuers/home/Presentation/widget/grid/custmor/custmorGrid.dart';
import 'package:ican/featuers/setting/Presentation/Controller/GroupControol.dart';
import 'package:skeletonizer/skeletonizer.dart';

OverlayEntry showDropdownOfAddUsers(
  BuildContext context,
  List<CustmorUser> selectedUserBefore,
  List<int> indexSelectedUserBefore,
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
        //  bottom: 20,
        child: GetBuilder<GroupSControol>(
          id: GroupSControol.dropDownUserAdd,
          builder: (groupSControol) {
            return AnimatedBuilder(
              animation: groupSControol.animationController,
              builder: (context, child) => SlideTransition(
                position: groupSControol.position,
                child: FadeTransition(
                    opacity: groupSControol.opacity, child: child),
              ),
              child: BobyAddDrop(
                groupSControol: groupSControol,
                indexSelectedUserBefore: indexSelectedUserBefore,
                selectedUserBefore: selectedUserBefore,
              ),
            );
          },
        ),
      );
    },
  );
  return overlayEntry;
}

class BobyAddDrop extends StatelessWidget {
  const BobyAddDrop({
    super.key,
    required this.groupSControol,
    required this.selectedUserBefore,
    required this.indexSelectedUserBefore,
  });
  final GroupSControol groupSControol;
  final List<CustmorUser> selectedUserBefore;
  final List<int> indexSelectedUserBefore;

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
            child: GetBuilder<CustmorControll>(
              id: CustmorControll.custmorList,
              builder: (custmorControll) {
                return SingleChildScrollView(
                  child: Skeletonizer(
                    enabled: custmorControll.loding,
                    child: Column(
                      children: [
                        GetBuilder<GroupSControol>(
                          id: GroupSControol.addUserToGroupBefore,
                          builder: (controller) {
                            controller
                                .setNameCustmor(custmorControll.nameCustmor);
                            return Column(
                                children: List.generate(
                              selectedUserBefore.length,
                              (index) {
                                return DadfultBoutton(
                                  isEndIcon: false,
                                  onTap: () {
                                    controller.removeSelectedBefore(
                                      indexSelectedUserBefore[index],
                                    );
                                  },
                                  title: selectedUserBefore[index].name,
                                  icon: Image.asset(
                                    AppImageName.close,
                                    height: 25,
                                  ),
                                );
                              },
                            ));
                          },
                        ),
                        GetBuilder<GroupSControol>(
                          id: GroupSControol.addUserToGroup,
                          builder: (controller) => Column(
                              spacing: 0,
                              mainAxisSize: MainAxisSize.min,
                              children: List.generate(
                                controller.nameCustmor.length,
                                (index) {
                                  return indexSelectedUserBefore.contains(index)
                                      ? const SizedBox.shrink()
                                      : Padding(
                                          padding:
                                              const EdgeInsets.only(top: 20),
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
                );
              },
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
              groupSControol.nameCustmor[index].name,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
