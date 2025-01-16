import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ican/core/Loction/textApp.dart';
import 'package:ican/core/utlies/appimage.dart';
import 'package:ican/core/utlies/color.dart';
import 'package:ican/core/utlies/mathed.dart';
import 'package:ican/core/utlies/route.dart';
import 'package:ican/core/utlies/textStyle.dart';
import 'package:ican/featuers/Drawrr/Presentation/controll/drawerControll.dart';
import 'package:ican/featuers/Drawrr/Presentation/widget/ItemDrawer.dart';

class DrawerView extends StatelessWidget {
  const DrawerView({super.key});

  @override
  Widget build(BuildContext context) {
    final DrawerControllMain drawerControllMain = Get.find();
    final double width = MediaQuery.sizeOf(context).width;
    final double height = MediaQuery.sizeOf(context).height;
    return Drawer(
      width: Mathed.ResponcvMax(width * .75, 700),
      backgroundColor: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            height: Mathed.responcvMin(height * .3, 200),
            decoration: const BoxDecoration(
                color: AppColor.primaryAppbar,
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(50))),
            child: Image.asset(
              AppImageName.logo,
              height: Mathed.responcvMin(height * .2, 150),
              color: Colors.white,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ItemDrawrer(
                    titel: AppText.home.tr,
                    nameIcon: AppImageName.home,
                  ),
                  ItemDrawrer(
                    titel: AppText.settings.tr,
                    nameIcon: AppImageName.settings,
                  ),
                  ItemDrawrer(
                    titel: AppText.logout.tr,
                    nameIcon: AppImageName.logout,
                    onTap: () {
                      AwesomeDialog(
                              context: context,
                              animType: AnimType.scale,
                              dialogType: DialogType.warning,

                              //   dialogBackgroundColor: AppColor.primaryAppbar,
                              title: AppText.confirmLogout.tr,
                              titleTextStyle: ApptextStyle.textStyleApp32,
                              btnOkOnPress: () {},
                              btnCancelOnPress: () {},
                              btnOk: BtonAw(
                                titel: AppText.yes.tr,
                              ),
                              btnCancel: BtonAw(
                                titel: AppText.no.tr,
                                backgroundColor: AppColor.primaryAppbar,
                              ),
                              btnCancelText: AppText.no.tr)
                          .show();
                    },
                  ),
                  ItemDrawrer(
                    onTap: () {
                      Get.toNamed(Routers.rAboutApp);
                    },
                    titel: AppText.aboutApp.tr,
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                spacing: 5,
                children: [
                  Flexible(
                      child: FittedBox(
                          child: Text(
                    AppText.allRightsReserved.tr,
                    style: ApptextStyle.textStyleApp16,
                  ))),
                  Text(
                    "2025",
                    style: ApptextStyle.textStyleApp16
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    width: 5,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class BtonAw extends StatelessWidget {
  const BtonAw({super.key, required this.titel, this.backgroundColor});
  final String titel;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: backgroundColor,
      label: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Text(titel,
            style: ApptextStyle.textStyleApp32.copyWith(fontSize: 20)),
      ),
    );
  }
}
