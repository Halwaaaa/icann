import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ican/core/Loction/textApp.dart';
import 'package:ican/core/compnated/DadfultBoutton.dart';
import 'package:ican/core/utlies/appimage.dart';
import 'package:ican/core/utlies/color.dart';
import 'package:ican/core/utlies/textStyle.dart';
import 'package:ican/featuers/setting/Presentation/Controller/GroupControol.dart';

class AddGroup extends StatelessWidget {
  const AddGroup({super.key});

  @override
  Widget build(BuildContext context) {
    final GroupSControol groupSControol = Get.find();
    groupSControol.animationControllerGroup.forward();

    return SliverFillRemaining(
      fillOverscroll: false,
      hasScrollBody: false,
      child: AnimatedBuilder(
        animation: groupSControol.animationControllerGroup,
        builder: (context, child) => SlideTransition(
            position: groupSControol.positionGroup,
            child: FadeTransition(
                opacity: groupSControol.opacityGroup, child: child)),
        child: const AddGroupBoby(),
      ),
    );
  }
}

class AddGroupBoby extends StatelessWidget {
  const AddGroupBoby({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 400),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
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
                      controllerText: groupSControol.textLeadrGroup,
                      onTap: () {
                        groupSControol.tapGroupLeaderAdd(true);
                      },
                      onChanged: (value) {
                        if (value.isEmpty) {
                          groupSControol.tapGroupLeaderAdd(false);
                        } else {
                          groupSControol.tapGroupLeaderAdd(true);
                        }
                      },
                      isTextFormFiled: true,
                      focusNode: groupSControol.focusNodeLeaderGroup,
                      title: groupSControol.isTapLederGroup
                          ? ""
                          : AppText.groupLeader.tr,
                      colorBorder: groupSControol.isTapLederGroup
                          ? AppColor.primaryAppbar
                          : null,
                      ColorSelected: AppColor.primaryAppbar,
                      icon: Icon(
                        Icons.person,
                        color: groupSControol.isTapLederGroup
                            ? AppColor.primaryAppbar
                            : null,
                      ),
                    );
                  }),
              Text(
                AppText.users.tr,
                style: ApptextStyle.textStyleApp24Selcted
                    .copyWith(color: AppColor.primaryAppbar, fontSize: 27),
              ),
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
                          : AppColor.primaryAppbar,
                      fillColor: groupSControol.isHaveSelcted
                          ? AppColor.primaryAppbar
                          : Colors.white,
                      colorBorder: groupSControol.isTapUser
                          ? AppColor.primaryAppbar
                          : null,
                      icon: Transform.rotate(
                          angle:
                              groupSControol.isTapUser ? 3.14 / 2 : -3.14 / 2,
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: groupSControol.isHaveSelcted
                                ? Colors.white
                                : groupSControol.isTapUser
                                    ? AppColor.primaryAppbar
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
                  title: AppText.add.tr,
                  onTap: () {
                    groupSControol.istapAdd(context);
                  },
                  fillColor: groupSControol.isAddDone
                      ? Colors.white
                      : groupSControol.isAddErorr
                          ? Colors.white
                          : AppColor.Catrgray,
                  colorBorder: groupSControol.isAddDone
                      ? AppColor.primaryAppbar
                      : groupSControol.isAddErorr
                          ? Colors.redAccent
                          : Colors.white,
                  ColorSelected: groupSControol.isAddDone
                      ? AppColor.primaryAppbar
                      : groupSControol.isAddErorr
                          ? Colors.black
                          : Colors.white,
                ),
              ),
              // const SizedBox(
              //   height: 20,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
