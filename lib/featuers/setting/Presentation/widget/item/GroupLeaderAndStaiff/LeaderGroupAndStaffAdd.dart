import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ican/core/Loction/textApp.dart';
import 'package:ican/core/compnated/DadfultBoutton.dart';
import 'package:ican/core/utlies/Modules/MoudulesSetting.dart';
import 'package:ican/core/utlies/appimage.dart';
import 'package:ican/core/utlies/color.dart';
import 'package:ican/featuers/AppBar/Presentation/controll/Statecontroll.dart';
import 'package:ican/featuers/setting/Presentation/Controller/LeaderGroupControll.dart';
import 'package:ican/featuers/setting/Presentation/Controller/StateLaederControll.dart';
import 'package:ican/featuers/setting/Presentation/Controller/countersLaederAndStaff.dart';
import 'package:ican/featuers/setting/Presentation/widget/item/GroupLeaderAndStaiff/LeaderGroupAndStaffList.dart';
import 'package:ican/featuers/setting/Presentation/widget/item/Stautes.dart';
import 'package:ican/featuers/setting/Presentation/widget/item/countersAndStateLaeder.dart';
import 'package:skeletonizer/skeletonizer.dart';

class LeaderGroupAndStaffadd extends StatelessWidget {
  const LeaderGroupAndStaffadd({super.key, required this.isAdd});
  final bool isAdd;

  @override
  Widget build(BuildContext context) {
    final LeaderGroupControll leaderGroupControll = Get.find();
    final CountersLaederControll countersLaederControll = Get.find();
    countersLaederControll.getLocale(true);
    leaderGroupControll.animationControllerAdd.reset();
    leaderGroupControll.animationControllerAdd.forward();
    return
        //
        SliverSafeArea(
      sliver: SliverFillRemaining(
        hasScrollBody: false,
        fillOverscroll: true,
        child: AnimatedBuilder(
          animation: leaderGroupControll.animationControllerAdd,
          builder: (context, child) => FadeTransition(
            opacity: leaderGroupControll.opacityAdd,
            child: SlideTransition(
              position: leaderGroupControll.positionAdd,
              child: child,
            ),
          ),
          child: GetBuilder<StateLaederControll>(
            id: isAdd ? null : StateLaederControll.stauteEdit,
            builder: (stateLaederControll) =>
                GetBuilder<CountersLaederControll>(
              id: isAdd ? null : CountersLaederControll.cityEdit,
              builder: (countersLaederControll) {
                isAdd
                    ? null
                    : leaderGroupControll
                        .remoteEditLaeder(leaderGroupControll.idUpDtataLaeder!);
                return GetBuilder<LeaderGroupControll>(
                    id: isAdd
                        ? LeaderGroupControll.leaderGroupTextFormAdd
                        : LeaderGroupControll.leaderGroupTextFormEdit,
                    builder: (leaderGroupControll) {
                      return SingleChildScrollView(
                        child: Skeletonizer(
                          enabled:
                              isAdd ? false : leaderGroupControll.lodingEdit,
                          child: BobyLeaderGroupAdd(
                            leaderGroupControll: leaderGroupControll,
                          ),
                        ),
                      );
                    });
              },
            ),
          ),
        ),
      ),
    );
  }
}

class BobyLeaderGroupAdd extends StatelessWidget {
  const BobyLeaderGroupAdd({
    super.key,
    required this.leaderGroupControll,
  });
  final LeaderGroupControll leaderGroupControll;

  @override
  Widget build(BuildContext context) {
    // SystemNavigator.pop();
    return WillPopScope(
      onWillPop: () async {
        print("object");
        return false;
      },
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Align(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),
            child: SizedBox(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
                child: Column(
                  spacing: 20,
                  children: [
                    Column(
                      spacing: 20,
                      children: [
                        TextAddLaeder(
                          leaderGroupControll: leaderGroupControll,
                          index: 0,
                          keyboardType: TextInputType.name,
                          textEditingController:
                              leaderGroupControll.textControllersNameAll,
                        ),
                        TextAddLaeder(
                          keyboardType: TextInputType.name,
                          leaderGroupControll: leaderGroupControll,
                          index: 1,
                          textEditingController:
                              leaderGroupControll.textControllersUserNmae,
                        ),
                        TextAddLaeder(
                          keyboardType: TextInputType.visiblePassword,
                          leaderGroupControll: leaderGroupControll,
                          index: 2,
                          textEditingController:
                              leaderGroupControll.textControllersPassworde,
                        ),
                        TextAddLaeder(
                          keyboardType: TextInputType.phone,
                          leaderGroupControll: leaderGroupControll,
                          index: 3,
                          textEditingController:
                              leaderGroupControll.textControllersPhone,
                        ),
                        TextAddLaeder(
                          keyboardType: TextInputType.streetAddress,
                          leaderGroupControll: leaderGroupControll,
                          index: 4,
                          textEditingController:
                              leaderGroupControll.textControllersaddress,
                        ),
                      ],
                    ),
                    const CountersAndStateLaeder(
                      isAddorder: false,
                    ),
                    stautes(
                      isAdd: false,
                    ),
                    TextAddLaeder(
                      leaderGroupControll: leaderGroupControll,
                      index: 6,
                      textEditingController:
                          leaderGroupControll.textControllersNotes,
                    ),
                    DadfultBoutton(
                      onTap: () {
                        leaderGroupControll.tapAddLaedr(context);
                      },
                      title: leaderGroupControll.indexmodulesLeaderGroup == 1
                          ? AppText.add.tr
                          : AppText.edit.tr,
                      ColorSelected: Colors.white,
                      fillColor: AppColor.Catrgray,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TextAddLaeder extends StatelessWidget {
  const TextAddLaeder({
    super.key,
    required this.leaderGroupControll,
    required this.index,
    required this.textEditingController,
    this.keyboardType,
  });
  final TextInputType? keyboardType;

  final LeaderGroupControll leaderGroupControll;
  final int index;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return DadfultBoutton(
      keyboardType: keyboardType,
      onTap: () {
        leaderGroupControll.scrollToIndex(index);
      },
      focusNode: leaderGroupControll.textFoucsNodeAdd[index],
      isTextFormFiled: true,
      controllerText: textEditingController,
      title: leaderGroupControll.iSFoucesAdd[index]
          ? ""
          : modulesTitelTextFormForLeader[index],
      ColorSelected: leaderGroupControll.iSFoucesAdd[index]
          ? AppColor.primaryAppbar
          : AppColor.Catrgray,
      colorBorder: leaderGroupControll.iSFoucesAdd[index]
          ? AppColor.primaryAppbar
          : AppColor.Catrgray,
      icon: ModulesiconTextFormForAddLeader[index],
    );
  }
}
