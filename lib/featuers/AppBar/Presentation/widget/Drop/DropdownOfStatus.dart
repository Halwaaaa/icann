import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ican/core/utlies/color.dart';
import 'package:ican/featuers/AppBar/Presentation/controll/CityControll.dart';
import 'package:ican/featuers/AppBar/Presentation/controll/satutsControll.dart';
import 'package:ican/core/compnated/DadfultBoutton.dart';

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
          builder: (satutsControll) => AnimatedBuilder(
            animation: satutsControll.animationController,
            builder: (context, child) => SlideTransition(
              position: satutsControll.position,
              child:
                  FadeTransition(opacity: satutsControll.opacity, child: child),
            ),
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
            ),
          ),
        ),
      );
    },
  );
  return overlayEntry;
}
