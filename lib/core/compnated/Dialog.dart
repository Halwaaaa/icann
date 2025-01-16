import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ican/core/Loction/textApp.dart';
import 'package:ican/core/utlies/color.dart';
import 'package:ican/core/utlies/textStyle.dart';

class Dafultdialog {
  static AwesomeDialog dialogsucces(BuildContext context) {
    return AwesomeDialog(
        animType: AnimType.scale,
        dialogType: DialogType.success,
        context: context,
        btnOkColor: AppColor.primaryAppbar,
        btnOkText: AppText.yes.tr,
        btnOkOnPress: () {
          // istapEditErorr = false;
          //navigator?.pop();
        },
        body: Text(
          AppText.updateSuccessful.tr,
          style: ApptextStyle.textStyleApp16,
        ));
  }

  static AwesomeDialog dailogErorr(BuildContext context, List<String> eroor) {
    return AwesomeDialog(
        animType: AnimType.scale,
        dialogType: DialogType.error,
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
