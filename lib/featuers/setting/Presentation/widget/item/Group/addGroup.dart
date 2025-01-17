import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:ican/core/Loction/textApp.dart';
import 'package:ican/core/compnated/DadfultBoutton.dart';
import 'package:ican/core/utlies/appimage.dart';
import 'package:ican/core/utlies/color.dart';
import 'package:ican/core/utlies/textStyle.dart';
import 'package:ican/featuers/AppBar/Presentation/controll/custmorControll.dart';
import 'package:ican/featuers/home/Presentation/controol/groupControll.dart';
import 'package:ican/featuers/setting/Presentation/Controller/GroupControol.dart';
import 'package:ican/featuers/setting/Presentation/Controller/LeaderGroupControll.dart';
import 'package:ican/featuers/setting/Presentation/Controller/countersLaederAndStaff.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AddGroup extends StatelessWidget {
  const AddGroup({super.key, required this.isAdd});
  final bool isAdd;

  @override
  Widget build(BuildContext context) {
    final GroupSControol groupSControol = Get.find();
    groupSControol.animationControllerGroup.reset();
    groupSControol.animationControllerGroup.forward();

    final CustmorControll custmorControll = Get.find();
    custmorControll.getLocaleCustmor();
    final LeaderGroupControll leaderGroupControll = Get.find();
    leaderGroupControll.getLocalLeader();

    return SliverFillRemaining(
      fillOverscroll: false,
      hasScrollBody: false,
      child: AnimatedBuilder(
        animation: groupSControol.animationControllerGroup,
        builder: (context, child) => SlideTransition(
            position: groupSControol.positionGroup,
            child: FadeTransition(
                opacity: groupSControol.opacityGroup, child: child)),
        child: GetBuilder<LeaderGroupControll>(
          id: isAdd ? null : LeaderGroupControll.leaderGroup,
          builder: (controller) => Skeletonizer(
            enabled: isAdd ? false : controller.lodingLeaders,
            child: GetBuilder<CustmorControll>(
                id: isAdd ? null : CustmorControll.custmorList,
                builder: (controller) {
                  // groupSControol.setNameCustmor(controller.nameCustmor);
                  return Skeletonizer(
                      enabled: isAdd ? false : controller.loding,
                      child: AddGroupBoby(
                        isAdd: isAdd,
                      ));
                }),
          ),
        ),
      ),
    );
  }
}

class AddGroupBoby extends StatelessWidget {
  const AddGroupBoby({
    super.key,
    required this.isAdd,
  });
  final bool isAdd;

  @override
  Widget build(BuildContext context) {
    final GroupSControol groupSControol = Get.find();

    isAdd ? null : groupSControol.updataGroup(groupSControol.idGroupData!);
    return Align(
      alignment: Alignment.center,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 400),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
          child: GetBuilder<GroupSControol>(
            id: isAdd ? null : GroupSControol.upDataGroup,
            builder: (controller) => Skeletonizer(
              enabled: isAdd ? false : controller.lodingUpData,
              child: Column(
                spacing: 20,
                children: [
                  GetBuilder<GroupSControol>(
                      id: GroupSControol.groupNameAdd,
                      builder: (groupSControol) {
                        return DadfultBoutton(
                          controllerText: groupSControol.textNameGroup,
                          onTap: () {
                            groupSControol.tapGroupNameAdd(true);
                          },
                          isTextFormFiled: true,
                          onChanged: (value) {
                            if (value.isEmpty) {
                              groupSControol.tapGroupNameAdd(false);
                            } else {
                              groupSControol.tapGroupNameAdd(true);
                            }
                          },
                          title: groupSControol.isTapNameGroup
                              ? ""
                              : AppText.groupName.tr,
                          ColorSelected: AppColor.primaryAppbar,
                          colorBorder: groupSControol.isTapNameGroup
                              ? AppColor.primaryAppbar
                              : null,
                          icon: Image.asset(
                            AppImageName.group,
                            color: groupSControol.isTapNameGroup
                                ? AppColor.primaryAppbar
                                : null,
                            height: 25,
                          ),
                        );
                      }),
                  GetBuilder<GroupSControol>(
                      id: GroupSControol.groupLeaderAdd,
                      builder: (groupSControol) {
                        return DadfultBoutton(
                          key1: groupSControol.dropdownKeyAddLeader,
                          //controllerText: groupSControol.textLeadrGroup,
                          onTap: () {
                            /// groupSControol.tapGroupLeaderAdd(true);
                            groupSControol.openCloseDropOfLaeder(context);
                          },
                          colorBorder: groupSControol.isTapLederGroup
                              ? AppColor.primaryAppbar
                              : AppColor.Catrgray,

                          isTextFormFiled: false,
                          // focusNode: groupSControol.focusNodeLeaderGroup,
                          title: groupSControol.titleLaeder,
                          fillColor: groupSControol.fillcolorSelected,
                          ColorSelected:
                              // Colors.amber,
                              groupSControol.isHaveSelctedLaeder
                                  ? Colors.white
                                  : groupSControol.colorSelected,
                          icon: Transform.rotate(
                              angle: groupSControol.isTapLederGroup
                                  ? 3.14 / 2
                                  : -3.14 / 2,
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: groupSControol.isHaveSelctedLaeder
                                    ? Colors.white
                                    : null,
                              )),
                        );
                      }),

                  GetBuilder<GroupSControol>(
                      id: GroupSControol.groupUserAdd,
                      builder: (groupSControol) {
                        return DadfultBoutton(
                          key1: groupSControol.dropdownKeyAddUsers,
                          onTap: () {
                            groupSControol.tapGroupUserAdd(context);
                          },
                          title: AppText.users.tr,
                          ColorSelected: groupSControol.isHaveSelcted
                              ? Colors.white
                              : groupSControol.isTapUser
                                  ? Colors.black
                                  : AppColor.primaryAppbar,
                          fillColor: groupSControol.isHaveSelcted
                              ? AppColor.primaryAppbar
                              : Colors.white,
                          colorBorder: groupSControol.isTapUser
                              ? AppColor.primaryAppbar
                              : null,
                          icon: Transform.rotate(
                              angle: groupSControol.isTapUser
                                  ? 3.14 / 2
                                  : -3.14 / 2,
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: groupSControol.isHaveSelcted
                                    ? Colors.white
                                    : null,
                              )),
                        );
                      }),
                  const Expanded(
                      child: SizedBox(
                    height: 50,
                  )),
                  GetBuilder<GroupSControol>(
                    id: GroupSControol.tapAdd,
                    builder: (groupSControol) => DadfultBoutton(
                        title: isAdd ? AppText.add.tr : AppText.edit.tr,
                        onTap: () {
                          groupSControol.istapAdd(context, isAdd);
                        },
                        fillColor: AppColor.primaryAppbar,

                        // colorBorder:AppColor.primaryAppbar,

                        ColorSelected: Colors.white),
                  ),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
