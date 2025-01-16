import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ican/core/utlies/color.dart';
import 'package:ican/featuers/AppBar/Presentation/controll/CityControll.dart';
import 'package:ican/featuers/AppBar/Presentation/controll/custmorControll.dart';
import 'package:ican/featuers/AppBar/Presentation/controll/satutsControll.dart';
import 'package:ican/core/compnated/DadfultBoutton.dart';

OverlayEntry DropdownOfCustmor(
  BuildContext context,
) {
  final CustmorControll custmorControll = Get.find();
  final renderBox = custmorControll.dropdownKeyCustmor.currentContext!
      .findRenderObject() as RenderBox;
  final position = renderBox.localToGlobal(Offset.zero);
  OverlayEntry overlayEntry = OverlayEntry(
    builder: (context) {
      return Positioned(
        top: position.dy + 60,
        left: position.dx,
        width: renderBox.size.width,
        bottom: 0,
        child: GetBuilder<CustmorControll>(builder: (custmorControll) {
          return AnimatedBuilder(
            animation: custmorControll.animationController,
            builder: (context, child) => FadeTransition(
              opacity: custmorControll.opacity,
              child: SlideTransition(
                position: custmorControll.position,
                child: FadeTransition(
                  opacity: custmorControll.opacity,
                  child: child,
                ),
              ),
            ),
            child: Align(
              child: Material(
                color: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 80),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: 450,
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
                              custmorControll.nameCustmor.length,
                              (index) => DadfultBoutton(
                                ColorSelected:
                                    !custmorControll.selectedCustmor[index]
                                        ? Colors.black
                                        : Colors.white,

                                // selacted: custmorControll.selectedCitys[index],
                                title: custmorControll.nameCustmor[index],
                                fillColor:
                                    custmorControll.selectedCustmor[index]
                                        ? AppColor.primaryAppbar
                                        : Colors.white,
                                onTap: () {
                                  custmorControll.selectedNewCumtor(index);
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
        }),
      );
    },
  );
  return overlayEntry;
}
