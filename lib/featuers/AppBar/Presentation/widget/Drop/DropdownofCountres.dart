import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ican/core/utlies/color.dart';
import 'package:ican/featuers/AppBar/Presentation/controll/CounterControll.dart';
import 'package:ican/featuers/AppBar/Presentation/controll/SearchControll.dart';
import 'package:ican/core/compnated/DadfultBoutton.dart';
import 'package:skeletonizer/skeletonizer.dart';

OverlayEntry showDropdownOfCountres(
  BuildContext context,
) {
  final CounterControll controller = Get.find();
  // print("${controller.counters}cccc");

  final renderBox = controller.dropdownKeyCity.currentContext!
      .findRenderObject() as RenderBox;
  final position = renderBox.localToGlobal(Offset.zero);
  OverlayEntry overlayEntry = OverlayEntry(
    builder: (context) {
      return GetBuilder<CounterControll>(
          id: CounterControll.citydrop,
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
                                    ? counterControll.nameCitys.length
                                    : counterControll.counters!.length,
                                (index) => DadfultBoutton(
                                  ColorSelected:
                                      !counterControll.selectedCitys[index]
                                          ? Colors.black
                                          : Colors.white,
                                  selacted:
                                      counterControll.selectedCitys[index],
                                  title: counterControll.counters == null
                                      ? counterControll.nameCitys[index]
                                      : counterControll.counters![index].name,
                                  fillColor:
                                      counterControll.selectedCitys[index]
                                          ? AppColor.primaryAppbar
                                          : Colors.white,
                                  onTap: () {
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
