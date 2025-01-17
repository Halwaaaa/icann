import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:ican/core/compnated/DadfultBoutton.dart';
import 'package:ican/featuers/AppBar/Presentation/controll/CounterControll.dart';
import 'package:ican/featuers/AppBar/Presentation/controll/SearchControll.dart';
import 'package:ican/featuers/AppBar/Presentation/controll/Statecontroll.dart';
import 'package:ican/featuers/AppBar/Presentation/controll/custmorControll.dart';

class countersAndState extends StatelessWidget {
  const countersAndState({
    super.key,
    required this.searchControll,
  });

  final SearchControll searchControll;

  @override
  Widget build(BuildContext context) {
    Get.put(CounterControll(), permanent: true);
    return GetBuilder<CounterControll>(
        // init: CounterControll(),
        id: CounterControll.City,
        builder: (counterControll) {
          return Column(
            children: [
              DadfultBoutton(
                fillColor: counterControll.fillcolorSelected,
                key1: counterControll.dropdownKeyCity,
                onTap: () async {
                  await searchControll.closeTextFormFiled();
                  counterControll.ChangedTapCity();
                  counterControll.openCloseDropOfCity(
                    context,
                  );
                },
                selacted: counterControll.topCity,
                title: counterControll.titelCity,
                icon: Transform.rotate(
                  angle: !counterControll.topCity ? -3.14 / 2 : 3.14 / 2,
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: counterControll.colorSelected == Colors.white
                        ? Colors.white
                        : null,
                  ),
                ),
                ColorSelected: counterControll.colorSelected,
              ),
              counterControll.showStautes
                  ? const SizedBox(
                      height: 20,
                    )
                  : const SizedBox.shrink(),
              counterControll.showStautes
                  ? GetBuilder<StateControll>(
                      init: StateControll(),
                      id: StateControll.stautes,
                      builder: (controller) {
                        ///  controller.CloseDropOfCity();
                        return DadfultBoutton(
                          fillColor: counterControll.showTitel
                              ? Colors.white
                              : controller.fillcolorSelected,
                          key1: controller.dropdownKeyState,
                          onTap: () async {
                            controller
                                .statesOfCounters(counterControll.indexCountre);
                            //                   await searchControll.closeTextFormFiled();
                            controller.ChangedTapCity();
                            controller.openCloseDropOfCity(
                              context,
                            );
                          },
                          selacted: controller.topSatet,
                          title: counterControll.showTitel ||
                                  controller.fillcolorSelected == Colors.white
                              ? counterControll.titelState
                              : controller.titelState,
                          icon: Transform.rotate(
                            angle: counterControll.showTitel
                                ? 3.14 / 2
                                : !controller.topSatet
                                    ? -3.14 / 2
                                    : 3.14 / 2,
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: counterControll.showTitel
                                  ? Colors.black
                                  : controller.colorSelected == Colors.white
                                      ? Colors.white
                                      : null,
                            ),
                          ),
                          ColorSelected: counterControll.showTitel
                              ? Colors.black
                              : controller.colorSelected,
                        );
                      })
                  : const SizedBox.shrink(),
              const SizedBox(
                height: 20,
              ),
            ],
          );
        });
  }
}
