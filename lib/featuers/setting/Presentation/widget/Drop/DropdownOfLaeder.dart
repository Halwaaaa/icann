import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ican/core/utlies/color.dart';
import 'package:ican/featuers/AppBar/Presentation/controll/CounterControll.dart';
import 'package:ican/featuers/AppBar/Presentation/controll/SearchControll.dart';
import 'package:ican/core/compnated/DadfultBoutton.dart';
import 'package:ican/featuers/AppBar/Presentation/controll/custmorControll.dart';
import 'package:ican/featuers/setting/Presentation/Controller/GroupControol.dart';
import 'package:ican/featuers/setting/Presentation/Controller/LeaderGroupControll.dart';
import 'package:ican/featuers/setting/Presentation/Controller/countersLaederAndStaff.dart';
import 'package:skeletonizer/skeletonizer.dart';

OverlayEntry showDropdownOfAddLaeder(
  BuildContext context,
) {
  final GroupSControol groupSControol = Get.find();
  // print("${controller.counters}cccc");
  groupSControol.animationController.forward();
  final renderBox = groupSControol.dropdownKeyAddLeader.currentContext!
      .findRenderObject() as RenderBox;
  final position = renderBox.localToGlobal(Offset.zero);
  OverlayEntry overlayEntry = OverlayEntry(builder: (context) {
    return GetBuilder<LeaderGroupControll>(
      id: LeaderGroupControll.leaderGroup,
      builder: (leaderGroupControll) {
        groupSControol.setNameLaeder(leaderGroupControll.leaderListData);
        return Skeletonizer(
          enabled: leaderGroupControll.lodingLeaders,
          child: GetBuilder<GroupSControol>(
            id: GroupSControol.addLaederToGroup,
            builder: (counterControll) {
              return Positioned(
                  top: position.dy + 60,
                  left: position.dx,
                  bottom: 50,
                  width: renderBox.size.width,
                  child: AnimatedBuilder(
                      animation: counterControll.animationController,
                      builder: (context, child) => SlideTransition(
                            position: counterControll.position,
                            child: FadeTransition(
                              opacity: counterControll.opacity,
                              child: child,
                            ),
                          ),
                      child: SingleChildScrollView(
                          child: Align(
                              child: Material(
                                  color: Colors.transparent,
                                  child: Container(
                                      padding: const EdgeInsets.all(8.0),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(8),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.25),
                                            offset: const Offset(-4, 4),
                                            blurRadius: 4,
                                          ),
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.25),
                                            offset: const Offset(0, 4),
                                            blurRadius: 4,
                                          ),
                                        ],
                                      ),
                                      child: SingleChildScrollView(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10.0),
                                          child: Column(
                                              spacing: 20,
                                              mainAxisSize: MainAxisSize.min,
                                              children: List.generate(
                                                counterControll
                                                    .nameLaeder.length,
                                                (index) => DadfultBoutton(
                                                  ColorSelected: counterControll
                                                          .selectedLaeder[index]
                                                      ? Colors.white
                                                      : Colors.black,
                                                  selacted: counterControll
                                                      .selectedLaeder[index],
                                                  title: counterControll
                                                      .nameLaeder[index].name,
                                                  fillColor: counterControll
                                                          .selectedLaeder[index]
                                                      ? AppColor.primaryAppbar
                                                      : Colors.white,
                                                  colorBorder:
                                                      AppColor.primaryAppbar,
                                                  onTap: () {
                                                    // counterControll.ChangedTapCity();
                                                    counterControll
                                                        .selectedNewLaeder(
                                                      index,
                                                    );
                                                  },
                                                ),
                                              )),
                                        ),
                                      )))))));
            },
          ),
        );
      },
    );
  });

  return overlayEntry;
}
