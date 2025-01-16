import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ican/core/utlies/color.dart';
import 'package:ican/featuers/AppBar/Presentation/controll/SearchControll.dart';

Future<void> showDropShowDatePiker(
  BuildContext context,
  bool isStart,
) async {
  SearchControll searchControll = Get.find();
  // إظهار DatePickerDialog عند النقر
  DateTime? selectedDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2000),
    lastDate: DateTime(2100),
    builder: (BuildContext context, Widget? child) {
      return Theme(
        data: Theme.of(context).copyWith(
          colorScheme: const ColorScheme.light(
              primary: AppColor.primaryAppbar,
              onPrimary: Colors.white,
              onSurface: Colors.black,
              surface: Colors.white),
          dialogTheme: DialogTheme(
            backgroundColor: Colors.white,
            elevation: 0, // تحديد ارتفاع الظل
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16), // تعديل الشكل (اختياري)
            ),
          ),
          textTheme: const TextTheme(
            bodyLarge: TextStyle(
              color: Colors.white, // لون النص عندما يتم تحديد التاريخ
              fontWeight: FontWeight.bold,
            ),
          ),
          dialogBackgroundColor: Colors.white,
        ),
        child: child!,
      );
    },
  );
  if (selectedDate != null) {
    String date =
        "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}";

    searchControll.changedVisibel(true);
    isStart
        ? searchControll.changedtitleStartDate(date)
        : searchControll.changedtitleEndDate(date);
  } else {
    searchControll.changedVisibel(true);
  }
}
