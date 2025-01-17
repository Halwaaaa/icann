import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ican/featuers/AppBar/Presentation/controll/SearchControll.dart';
import 'package:ican/featuers/home/Presentation/controol/groupControll.dart';
import 'package:ican/featuers/home/Presentation/models/GroupUser.dart';

abstract class Mathed {
  static SizedBox heightSmal() {
    return SizedBox(
      height: Get.height * 0.03,
    );
  }

  static double ResponcvMax(double value, double max) {
    if (value > max) return max;
    return value;
  }

  static double responcvMin(double value, double min) {
    if (value < min) return min;
    return value;
  }

  static double ResponcvImages(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    // التحقق إذا كانت شاشة تابلت أو جوال
    bool isTablet = screenWidth >= 600;

    // تحديد الأبعاد بناءً على نوع الجهاز
    double imageWidth =
        isTablet ? screenWidth * 0.05 : screenWidth * 0.08; // نسبة العرض
    double aspectRatio = 100 / 400; // نسبة العرض للطول
    double imageHeight = imageWidth / aspectRatio;
    return imageHeight;
  }

  static CountGrid(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    bool isTablet = screenWidth >= 600;

    int crossAxisCount = isTablet ? 3 : 2;
    double itemHeight = isTablet ? 250 : 200;
    double itemWidth = screenWidth / crossAxisCount;
  }

  List<GroupUser> searchGroup(
      GroupControll groupControll,
      SearchControll searchControll,
      List<GroupUser> groupNew,
      List<GroupUser> groupUser) {
    groupControll.groupData.forEachIndexed(
      (index, element) {
        if (element.name.contains(searchControll.searchController.text) ||
            element.leader_name
                .contains(searchControll.searchController.text) ||
            element.created_at.contains(searchControll.titleStartDate)) {
          groupNew.add(element);
        }
      },
    );
    if (groupNew.isEmpty) {
      groupUser = groupControll.groupData;
    } else {
      groupUser = groupNew;
      groupNew = [];
    }
    return groupUser;
  }
}
