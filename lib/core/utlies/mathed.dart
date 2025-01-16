import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

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
}
