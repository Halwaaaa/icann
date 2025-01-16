import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ican/core/utlies/color.dart';

abstract class ApptextStyle {
  static const TextStyle textStyleApp16 = TextStyle(
    color: AppColor.Catrgray,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle textStyleApp20 = TextStyle(
    color: AppColor.gray,
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle textStyleApp13 = TextStyle(
    color: Colors.white,
    fontSize: 13,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle textStyleApp32 = TextStyle(
    color: Colors.black,
    fontSize: 25,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle textStyleApp24Selcted = TextStyle(
    color: AppColor.Catrgray,
    fontSize: 24,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle textStyleApp24UnSelcted = TextStyle(
    color: Colors.black,
    fontSize: 24,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle textStyleApp22 = TextStyle(
    color: AppColor.primary,
    fontSize: 22,
    fontWeight: FontWeight.w700,
  );
}
