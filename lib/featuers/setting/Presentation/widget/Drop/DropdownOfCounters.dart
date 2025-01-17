import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ican/core/utlies/color.dart';
import 'package:ican/featuers/AppBar/Presentation/controll/CounterControll.dart';
import 'package:ican/featuers/AppBar/Presentation/controll/SearchControll.dart';
import 'package:ican/core/compnated/DadfultBoutton.dart';
import 'package:ican/featuers/setting/Presentation/Controller/countersLaederAndStaff.dart';
import 'package:skeletonizer/skeletonizer.dart';

OverlayEntry showDropdownOfCountresLaeder(
    BuildContext context, List<bool> Selected, bool isAddOrder) {
  final CountersLaederControll controller = Get.find();
  // print("${controller.counters}cccc");

  final renderBox = isAddOrder
      ? controller.dropdownKeyCountersAddOrder.currentContext
          ?.findRenderObject() as RenderBox
      : controller.dropdownKeyCounters.currentContext!.findRenderObject()
          as RenderBox;
  final position = renderBox.localToGlobal(Offset.zero);
  OverlayEntry overlayEntry = OverlayEntry(
    builder: (context) {
      return GetBuilder<CountersLaederControll>(
          id: CountersLaederControll.cityCounters,
          builder: (counterControll) {
            //         print("${counterControll.counters}cccc");
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
                          border: Border.all(color: Colors.black, width: 1),
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
                        child: Skeletonizer(
                          enabled: counterControll.counters == null,
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: List.generate(
                                counterControll.counters == null
                                    ? counterControll.nameCounters.length
                                    : counterControll.counters!.length,
                                (index) => DadfultBoutton(
                                  ColorSelected:
                                      !counterControll.selectedCounters[index]
                                          ? Colors.black
                                          : Colors.white,
                                  selacted:
                                      counterControll.selectedCounters[index],
                                  title: counterControll.counters == null
                                      ? counterControll.nameCounters[index]
                                      : counterControll.counters![index].name,
                                  fillColor: Selected[index]
                                      ? AppColor.primaryAppbar
                                      : Colors.white,
                                  onTap: () {
                                    counterControll.ChangedTapCity();
                                    counterControll.selectedNewCity(
                                      index,
                                    );
                                  },
                                ),
                              )),
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
