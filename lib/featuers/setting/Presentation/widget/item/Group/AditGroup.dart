import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ican/core/Loction/textApp.dart';
import 'package:ican/core/compnated/DadfultBoutton.dart';
import 'package:ican/core/utlies/appimage.dart';
import 'package:ican/core/utlies/color.dart';
import 'package:ican/core/utlies/textStyle.dart';
import 'package:ican/featuers/setting/Presentation/Controller/GroupControol.dart';
import 'package:ican/featuers/setting/Presentation/Controller/GroupEditControll.dart';

class EditGroup extends StatelessWidget {
  const EditGroup({super.key});

  @override
  Widget build(BuildContext context) {
    final GroupEditControll groupEditControll = Get.put(GroupEditControll());
    groupEditControll.animationControllerEditPages.reset();
    groupEditControll.animationControllerEditPages.forward();
    return SliverFillRemaining(
      fillOverscroll: false,
      hasScrollBody: false,
      child: AnimatedBuilder(
        animation: groupEditControll.animationControllerEditPages,
        builder: (context, child) => SlideTransition(
          position: groupEditControll.positionPages,
          child: FadeTransition(
            opacity: groupEditControll.opacityPages,
            child: child,
          ),
        ),
        child: const BobyEditGroup(),
      ),
    );
  }
}

class BobyEditGroup extends StatelessWidget {
  const BobyEditGroup({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 400),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
          child: Column(
            spacing: 20,
            children: [
              GetBuilder<GroupEditControll>(
                  id: GroupEditControll.groupNameEdit,
                  builder: (groupEditControll) {
                    return DadfultBoutton(
                      onTap: () {
                        groupEditControll.tapGroupNameEdit(true);
                      },
                      isTextFormFiled: true,
                      controllerText: groupEditControll.textNameGroup,
                      onChanged: (value) {
                        if (value.isEmpty) {
                          groupEditControll.tapGroupNameEdit(false);
                        } else {
                          groupEditControll.tapGroupNameEdit(true);
                        }
                      },
                      title: groupEditControll.isTapNameGroup
                          ? ""
                          : AppText.groupName.tr,
                      ColorSelected: AppColor.primaryAppbar,
                      colorBorder: groupEditControll.isTapNameGroup
                          ? AppColor.primaryAppbar
                          : null,
                      icon: Image.asset(
                        AppImageName.group,
                        color: groupEditControll.isTapNameGroup
                            ? AppColor.primaryAppbar
                            : null,
                        height: 25,
                      ),
                    );
                  }),
              GetBuilder<GroupEditControll>(
                  id: GroupEditControll.groupLeaderEdit,
                  builder: (groupEditControll) {
                    return DadfultBoutton(
                      focusNode: groupEditControll.focusNodeLeaderGroup,
                      controllerText: groupEditControll.textLeaderGroup,
                      onTap: () {
                        groupEditControll.tapGroupLeadEdit(true);
                      },
                      onChanged: (value) {
                        if (value.isEmpty) {
                          groupEditControll.tapGroupLeadEdit(false);
                        } else {
                          groupEditControll.tapGroupLeadEdit(true);
                        }
                      },
                      isTextFormFiled: true,
                      title: groupEditControll.isTapLederGroup
                          ? ""
                          : AppText.groupLeader.tr,
                      colorBorder: groupEditControll.isTapLederGroup
                          ? AppColor.primaryAppbar
                          : null,
                      ColorSelected: AppColor.primaryAppbar,
                      icon: Icon(
                        Icons.person,
                        color: groupEditControll.isTapLederGroup
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
              GetBuilder<GroupEditControll>(
                  id: GroupEditControll.groupUserEdit,
                  builder: (groupEditControll) {
                    return DadfultBoutton(
                      focusNode: groupEditControll.focusNodeNameGroup,
                      key1: groupEditControll.dropdownKeyEditUsers,
                      onTap: () {
                        groupEditControll.tapGroupUserEdit(context);
                      },
                      title: AppText.users.tr,
                      ColorSelected: groupEditControll.isHaveSelcted
                          ? Colors.white
                          : AppColor.primaryAppbar,
                      fillColor: groupEditControll.isHaveSelcted
                          ? AppColor.primaryAppbar
                          : Colors.white,
                      colorBorder: groupEditControll.isTapUser
                          ? AppColor.primaryAppbar
                          : null,
                      icon: Transform.rotate(
                          angle: groupEditControll.isTapUser
                              ? 3.14 / 2
                              : -3.14 / 2,
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: groupEditControll.isHaveSelcted
                                ? Colors.white
                                : groupEditControll.isTapUser
                                    ? AppColor.primaryAppbar
                                    : null,
                          )),
                    );
                  }),
              const Expanded(
                  child: SizedBox(
                height: 50,
              )),
              GetBuilder<GroupEditControll>(
                  id: GroupEditControll.editBoutton,
                  builder: (groupEditControll) {
                    return DadfultBoutton(
                      title: AppText.edit.tr,
                      onTap: () {
                        groupEditControll.tapEdit(context);
                      },
                      fillColor: groupEditControll.istapEditDane
                          ? Colors.white
                          : groupEditControll.istapEditErorr
                              ? Colors.white
                              : AppColor.Catrgray,
                      colorBorder: groupEditControll.istapEditDane
                          ? AppColor.primaryAppbar
                          : groupEditControll.istapEditErorr
                              ? Colors.redAccent
                              : Colors.white,
                      ColorSelected: groupEditControll.istapEditDane
                          ? AppColor.primaryAppbar
                          : groupEditControll.istapEditErorr
                              ? Colors.black
                              : Colors.white,
                    );
                  }),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
