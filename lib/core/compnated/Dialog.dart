import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ican/core/Loction/textApp.dart';
import 'package:ican/core/utlies/color.dart';
import 'package:ican/core/utlies/textStyle.dart';
import 'package:ican/featuers/mainLayout/Presentation/Controll/mainLayoutcontroll.dart';

class Dafultdialog {
  AwesomeDialog dialogsucces(BuildContext context, String massages) {
    Mainlayoutcontroll mainlayoutcontroll = Get.find();
    mainlayoutcontroll.changedLoding(false);

    mainlayoutcontroll.changedCanGoToPages(false);
    return AwesomeDialog(
        onDismissCallback: (type) {
          mainlayoutcontroll.changedCanGoToPages(true);
        },
        dismissOnTouchOutside: false,
        animType: AnimType.scale,
        dialogType: DialogType.success,
        context: context,
        btnOkColor: AppColor.primaryAppbar,
        btnOkText: AppText.yes.tr,
        btnOkOnPress: () {
          mainlayoutcontroll.changedCanGoToPages(true);
          // istapEditErorr = false;
          //navigator?.pop();
        },
        body: Text(
          massages,
          style: ApptextStyle.textStyleApp16,
        ));
  }

  AwesomeDialog dailogErorr(BuildContext context, List<String> eroor) {
    Mainlayoutcontroll mainlayoutcontroll = Get.find();

    mainlayoutcontroll.changedCanGoToPages(false);
    mainlayoutcontroll.changedLoding(false);

    return AwesomeDialog(
        animType: AnimType.scale,
        dialogType: DialogType.error,
        onDismissCallback: (type) {
          mainlayoutcontroll.changedCanGoToPages(true);
        },
        context: context,
        btnOkColor: AppColor.primaryAppbar,
        btnOkText: AppText.yes.tr,
        btnOkOnPress: () {
          mainlayoutcontroll.changedCanGoToPages(true);

          // istapEditErorr = false;
          //navigator?.pop();
        },
        body: Column(
          children: List.generate(eroor.length, (index) {
            return Text(
              eroor[index],
              style: ApptextStyle.textStyleApp16,
            );
          }),
        ));
  }

  AwesomeDialog dailogErorrLog(BuildContext context, List<String> eroor) {
    return AwesomeDialog(
        animType: AnimType.scale,
        dialogType: DialogType.error,
        onDismissCallback: (type) {},
        context: context,
        btnOkColor: AppColor.primaryAppbar,
        btnOkText: AppText.yes.tr,
        btnOkOnPress: () {
          // istapEditErorr = false;
          //navigator?.pop();
        },
        body: Column(
          children: List.generate(eroor.length, (index) {
            return Text(
              eroor[index],
              style: ApptextStyle.textStyleApp16,
            );
          }),
        ));
  }
}
