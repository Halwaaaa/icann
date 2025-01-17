import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ican/core/utlies/color.dart';
import 'package:ican/featuers/AppBar/Presentation/controll/CounterControll.dart';
import 'package:ican/featuers/AppBar/Presentation/controll/SearchControll.dart';
import 'package:ican/core/compnated/DadfultBoutton.dart';
import 'package:ican/featuers/AppBar/Presentation/controll/Statecontroll.dart';
import 'package:ican/featuers/setting/Presentation/Controller/StateLaederControll.dart';
import 'package:skeletonizer/skeletonizer.dart';

OverlayEntry showDropdownOfStateLaeder(BuildContext context, bool isAdd) {
  final StateLaederControll controller = Get.find();
  final renderBox = isAdd
      ? controller.dropdownKeyStateAdd.currentContext!.findRenderObject()
          as RenderBox
      : controller.dropdownKeyState.currentContext!.findRenderObject()
          as RenderBox;
  final position = renderBox.localToGlobal(Offset.zero);
  OverlayEntry overlayEntry = OverlayEntry(
    builder: (context) {
      return GetBuilder<StateLaederControll>(
          id: StateLaederControll.stautesdrop,
          builder: (stateControll) {
            return Positioned(
              top: position.dy + 60,
              left: position.dx,
              bottom: 50,
              width: renderBox.size.width,
              child: AnimatedBuilder(
                animation: stateControll.animationController,
                builder: (context, child) => SlideTransition(
                  position: stateControll.position,
                  child: FadeTransition(
                    opacity: stateControll.opacity,
                    child: child,
                  ),
                ),
                child: Skeletonizer(
                  enabled: stateControll.looding,

                  //  CounterControll.counters == null,
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
                        child: SizedBox.expand(
                          child: ListView.builder(
                            itemCount: controller.stateItem.length,
                            itemBuilder: (context, index) {
                              return DadfultBoutton(
                                ColorSelected: !controller.selectedState[index]
                                    ? Colors.black
                                    : Colors.white,

                                // selacted: controller.selectedCitys[index],
                                title: //CounterControll.counters == null
                                    // ?
                                    controller.stateItem[index].name,
                                // : controller.counters![index].name,
                                fillColor: controller.selectedState[index]
                                    ? AppColor.primaryAppbar
                                    : Colors.white,
                                onTap: () {
                                  controller.ChangedTapCity();
                                  controller.selectedNewCity(
                                    index,
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          });
    },
  );
  return overlayEntry;
}
