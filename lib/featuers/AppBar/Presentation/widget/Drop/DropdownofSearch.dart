import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:ican/core/Loction/textApp.dart';
import 'package:ican/core/utlies/color.dart';
import 'package:ican/core/utlies/appimage.dart';
import 'package:ican/featuers/AppBar/Presentation/controll/CounterControll.dart';
import 'package:ican/featuers/AppBar/Presentation/controll/SearchControll.dart';
import 'package:ican/featuers/AppBar/Presentation/controll/custmorControll.dart';
import 'package:ican/featuers/AppBar/Presentation/controll/satutsControll.dart';
import 'package:ican/core/compnated/DadfultBoutton.dart';
import 'package:ican/featuers/AppBar/Presentation/widget/countersAndState.dart';
import 'package:ican/featuers/AppBar/Presentation/widget/Drop/DropShowDatePiker.dart';
import 'package:ican/featuers/AppBar/Presentation/widget/ShapOfDrop.dart';
import 'package:ican/featuers/AppBar/Presentation/widget/StartAndEndDate.dart';
import 'package:ican/featuers/AppBar/Presentation/widget/TextFormForNameAndNumberClient.dart';

OverlayEntry showDropdownOfSearch(BuildContext context1) {
  SearchControll searchControll = Get.find();
  final renderBox = searchControll.dropdownKeySearch.currentContext!
      .findRenderObject() as RenderBox;
  final position = renderBox.localToGlobal(Offset.zero);
  OverlayEntry overlayEntry = OverlayEntry(
    builder: (context) {
      return GetBuilder<SearchControll>(
          id: SearchControll.dropSearch,
          builder: (searchControll) {
            return Positioned(
              top: position.dy - 80,
              right: MediaQuery.sizeOf(context).width * 0.1,
              left: MediaQuery.sizeOf(context).width * 0.1,
              bottom: 50,
              child: AnimatedBuilder(
                  animation: searchControll.animationController,
                  child: DobyDropOfSearch(
                    searchControll: searchControll,
                  ),
                  builder: (context, child) {
                    return SlideTransition(

                        // scale: searchControll.animation.value,
                        position: searchControll.position,
                        child: FadeTransition(
                          opacity: searchControll.opacity,
                          child: child,
                        ));
                  }),
            );
          });
    },
  );
  return overlayEntry;
}

class DobyDropOfSearch extends StatelessWidget {
  const DobyDropOfSearch({
    super.key,
    required this.searchControll,
  });
  final SearchControll searchControll;

  @override
  Widget build(BuildContext context) {
    return ShapOfDerop(
      child: SingleChildScrollView(
        controller: searchControll.scrollController,
        physics: searchControll.isScroll
            ? const AlwaysScrollableScrollPhysics()
            : const NeverScrollableScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () {
                    searchControll.setSearch(false);
                    searchControll.CloseDropOfSearch();
                  },
                  icon: const Icon(Icons.close),
                )),
            countersAndState(searchControll: searchControll),
            const StartAndEndEnd(),
            const SizedBox(
              height: 20,
            ),
            DadfultBoutton(
              title: AppText.orderNumber.tr,
              controllerText: searchControll.numberOrderController,
              focusNode: searchControll.focusNodeNumberOrder,
              isTextFormFiled: true,
              keyboardType: TextInputType.number,
              ColorSelected: AppColor.primaryAppbar,
              icon: Image.asset(
                AppImageName.orderNumber,
                height: 25,
                // fit: BoxFit.scaleDown,
                width: 25,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormForNameAndNumberClient(searchControll: searchControll),
            Custmorselected(searchControll: searchControll),
            const SizedBox(
              height: 20,
            ),
            GetBuilder<SatutsControll>(
                init: SatutsControll(),
                id: SatutsControll.status,
                builder: (controller) {
                  return DadfultBoutton(
                    fillColor: controller.fillcolorSelected,
                    key1: controller.dropdownKeyStauts,
                    onTap: () async {
                      await searchControll.closeTextFormFiled();

                      controller.ChangedTapCity();
                      controller.openCloseDropOfCity(
                        context,
                      );
                    },
                    selacted: controller.topStats,
                    title: controller.titelStauts,
                    icon: Transform.rotate(
                      angle: !controller.topStats ? -3.14 / 2 : 3.14 / 2,
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: controller.colorSelected == Colors.white
                            ? Colors.white
                            : null,
                      ),
                    ),
                    ColorSelected: controller.colorSelected,
                  );
                }),
            const SizedBox(
              height: 20,
            ),
            DadfultBoutton(
                onTap: () {
                  searchControll.tapSarch(context);
                },
                fillColor: AppColor.Catrgray,
                ColorSelected: Colors.white,
                title: AppText.search.tr,
                icon: null),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class Custmorselected extends StatelessWidget {
  const Custmorselected({
    super.key,
    required this.searchControll,
  });

  final SearchControll searchControll;

  @override
  Widget build(BuildContext context) {
    Get.put(CustmorControll(), permanent: true);
    return GetBuilder<CustmorControll>(
        // init: CustmorControll(),
        id: CustmorControll.custmor,
        builder: (controller) {
          return DadfultBoutton(
            fillColor: controller.fillcolorSelected,
            key1: controller.dropdownKeyCustmor,
            onTap: () async {
              await searchControll.closeTextFormFiled();
              controller.ChangedTapCity();
              controller.openCloseDropOfCity(
                context,
              );
              // FocusScope.of(context).dispose();
            },
            selacted: controller.topCustmor,
            title: controller.titelSatuts,
            icon: Transform.rotate(
              angle: !controller.topCustmor ? -3.14 / 2 : 3.14 / 2,
              child: Icon(
                Icons.arrow_forward_ios,
                color: controller.colorSelected == Colors.white
                    ? Colors.white
                    : null,
              ),
            ),
            ColorSelected: controller.colorSelected,
          );
        });
  }
}
