import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ican/core/utlies/color.dart';
import 'package:ican/featuers/AppBar/Presentation/controll/CounterControll.dart';
import 'package:ican/featuers/AppBar/Presentation/controll/satutsControll.dart';
import 'package:ican/core/compnated/DadfultBoutton.dart';
import 'package:ican/featuers/AppBar/Presentation/widget/ShapOfDrop.dart';
import 'package:skeletonizer/skeletonizer.dart';

OverlayEntry showDropdownOfStauts(
  BuildContext context,
) {
  final SatutsControll controller = Get.find();
  final renderBox = controller.dropdownKeyStauts.currentContext!
      .findRenderObject() as RenderBox;
  final position = renderBox.localToGlobal(Offset.zero);
  OverlayEntry overlayEntry = OverlayEntry(
    builder: (context) {
      return Positioned(
          top: position.dy + 60,
          left: position.dx,
          width: renderBox.size.width,
          bottom: 20,
          child: GetBuilder<SatutsControll>(
              id: SatutsControll.status,
              builder: (satutsControll) {
                print(controller.stautesList);
                return AnimatedBuilder(
                  animation: satutsControll.animationController,
                  builder: (context, child) => SlideTransition(
                    position: satutsControll.position,
                    child: FadeTransition(
                        opacity: satutsControll.opacity, child: child),
                  ),
                  child: Skeletonizer(
                    enabled: controller.stautesList == null,
                    child: ShapOfDerop(
                      child: SingleChildScrollView(
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: List.generate(
                              controller.nameStautes.length,
                              (index) => DadfultBoutton(
                                ColorSelected: !controller.selectedStauts[index]
                                    ? Colors.black
                                    : Colors.white,

                                // selacted: controller.selectedCitys[index],
                                title: controller.nameStautes[index],
                                fillColor: controller.selectedStauts[index]
                                    ? AppColor.primaryAppbar
                                    : Colors.white,
                                onTap: () {
                                  controller.selectedNewStaut(index);
                                },
                              ),
                            )),
                      ),
                    ),
                  ),
                );
              }));
    },
  );
  return overlayEntry;
}
