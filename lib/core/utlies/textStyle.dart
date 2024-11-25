import 'package:flutter/cupertino.dart';
import 'package:ican/core/utlies/color.dart';

abstract class ApptextStyle {
  static const TextStyle textStyleApp24 = TextStyle(
      color: AppColor.colorSplachTitle,
      fontSize: 24,
      fontWeight: FontWeight.w700);

  static const TextStyle textStyleApp14 = TextStyle(
      color: Color.fromRGBO(68, 68, 68, 0.6),
      fontSize: 14,
      fontWeight: FontWeight.w400);
  static const TextStyle textStyleApp18 = TextStyle(
    color: AppColor.colorBlack,
    fontSize: 18,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle textStyleApp22 = TextStyle(
    color: AppColor.colorBlack,
    fontSize: 22,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle textStyleApp12 = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 0.2),
    fontSize: 12,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle textStyleAppCategoryUnSelcted = TextStyle(
      color: AppColor.colorBlack, fontSize: 14, fontWeight: FontWeight.w500);
  static const TextStyle textStyleAppCategorySelcted = TextStyle(
      color: AppColor.dafultColor, fontSize: 17, fontWeight: FontWeight.w700);
  static const TextStyle textStyleApp10 = TextStyle(
      color: Color.fromRGBO(0, 0, 0, 0.6),
      fontSize: 10,
      fontWeight: FontWeight.w500);
  static const TextStyle textStyleAppCategory16 = TextStyle(
      color: AppColor.colorBlack, fontSize: 16, fontWeight: FontWeight.w500);
}
