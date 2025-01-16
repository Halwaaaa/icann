import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ican/core/utlies/color.dart';
import 'package:ican/featuers/AppBar/Presentation/controll/CityControll.dart';
import 'package:ican/featuers/AppBar/Presentation/controll/SearchControll.dart';
import 'package:ican/core/compnated/DadfultBoutton.dart';

OverlayEntry showDropdownOfCity(
  BuildContext context,
) {
  final CityControll controller = Get.find();
  final renderBox = controller.dropdownKeyCity.currentContext!
      .findRenderObject() as RenderBox;
  final position = renderBox.localToGlobal(Offset.zero);
  OverlayEntry overlayEntry = OverlayEntry(
    builder: (context) {
      return GetBuilder<CityControll>(builder: (cityControll) {
        return Positioned(
          top: position.dy + 60,
          left: position.dx,
          width: renderBox.size.width,
          child: AnimatedBuilder(
            animation: cityControll.animationController,
            builder: (context, child) => SlideTransition(
              position: cityControll.position,
              child: FadeTransition(
                opacity: cityControll.opacity,
                child: child,
              ),
            ),
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
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(
                        controller.nameCitys.length,
                        (index) => DadfultBoutton(
                          ColorSelected: !controller.selectedCitys[index]
                              ? Colors.black
                              : Colors.white,

                          // selacted: controller.selectedCitys[index],
                          title: controller.nameCitys[index],
                          fillColor: controller.selectedCitys[index]
                              ? AppColor.primaryAppbar
                              : Colors.white,
                          onTap: () {
                            controller.selectedNewCity(
                              index,
                            );
                          },
                        ),
                      )),
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
