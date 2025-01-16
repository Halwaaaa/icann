import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:ican/core/Loction/textApp.dart';
import 'package:ican/core/utlies/color.dart';
import 'package:ican/core/utlies/appimage.dart';
import 'package:ican/featuers/AppBar/Presentation/controll/CityControll.dart';
import 'package:ican/featuers/AppBar/Presentation/controll/SearchControll.dart';
import 'package:ican/featuers/AppBar/Presentation/controll/custmorControll.dart';
import 'package:ican/featuers/AppBar/Presentation/controll/satutsControll.dart';
import 'package:ican/core/compnated/DadfultBoutton.dart';
import 'package:ican/featuers/AppBar/Presentation/widget/Drop/DropShowDatePiker.dart';

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
              top: position.dy - 40,
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
    return Align(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 450,
        ),
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              border: const Border(
                top: BorderSide.none,
              ),
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
                          searchControll.CloseDropOfSearch();
                        },
                        icon: const Icon(Icons.close),
                      )),
                  GetBuilder<CityControll>(
                      init: CityControll(),
                      id: CityControll.City,
                      builder: (controller) {
                        return DadfultBoutton(
                          fillColor: controller.fillcolorSelected,
                          key1: controller.dropdownKeyCity,
                          onTap: () async {
                            await searchControll.closeTextFormFiled();
                            controller.ChangedTapCity();
                            controller.openCloseDropOfCity(
                              context,
                              controller,
                            );
                          },
                          selacted: controller.topCity,
                          title: controller.titelCity,
                          icon: Transform.rotate(
                            angle: !controller.topCity ? -3.14 / 2 : 3.14 / 2,
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
                  GetBuilder<SearchControll>(
                    id: SearchControll.startDate,
                    builder: (controller) {
                      // print(AppText.DateOfStart);
                      return DadfultBoutton(
                        key1: controller.dropdownKeyDate,
                        ColorSelected: AppColor.primaryAppbar,
                        title: controller.titleStartDate,
                        onTap: () {
                          controller.changedVisibel(false);
                          showDropShowDatePiker(context, true);
                        },
                        icon: const Icon(Icons.date_range_outlined),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GetBuilder<SearchControll>(
                    id: SearchControll.endDate,
                    builder: (controller) {
                      return DadfultBoutton(
                        ColorSelected: AppColor.primaryAppbar,
                        title: controller.titleEndDate,
                        onTap: () {
                          controller.changedVisibel(false);
                          showDropShowDatePiker(context, false);

                          //  showDropShowDatePiker(context);
                        },
                        icon: const Icon(Icons.date_range_outlined),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  DadfultBoutton(
                    title: AppText.orderNumber.tr,
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
                  DadfultBoutton(
                    isTextFormFiled: true,
                    onTap: () {
                      print("object");
                    },
                    keyboardType: TextInputType.name,
                    title: AppText.nameOfClinet.tr,
                    focusNode: searchControll.focusNodeNameClient,
                    ColorSelected: AppColor.primaryAppbar,
                    icon: Image.asset(
                      AppImageName.profile,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  DadfultBoutton(
                      isTextFormFiled: true,
                      focusNode: searchControll.focusNodeNumberClient,
                      keyboardType: TextInputType.phone,
                      title: AppText.phoneOfClinet.tr,
                      ColorSelected: AppColor.primaryAppbar,
                      icon: const Icon(Icons.phone_in_talk)),
                  const SizedBox(
                    height: 20,
                  ),
                  GetBuilder<CustmorControll>(
                      init: CustmorControll(),
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
                            angle:
                                !controller.topCustmor ? -3.14 / 2 : 3.14 / 2,
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
          ),
        ),
      ),
    );
  }
}
