import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: deprecated_member_use
class controolHome extends GetxController with SingleGetTickerProviderMixin {
  late final AnimationController animationController;
  late final Animation<double> gridAnimation;

  @override
  void onInit() {
    print("cccccccccccccccc");
    super.onInit();

    initAnimtedGrid();
  }

  List<bool> isSelctedCategay = [true, false, false, false];
  void ChangedSelctedCategay(int index) {
    isSelctedCategay = List.filled(4, false);
    isSelctedCategay[index] = true;
    startAnimation();

    update();
  }

  void startAnimation() {
    animationController.forward();
    update();
  }

  void initAnimtedGrid() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    gridAnimation = Tween<double>(
            begin: 0.1, // تبدأ الحركة من الأسفل
            end: 1.0 // تنتهي في موقعها الطبيعي
            )
        .animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeOut,
    ));
    startAnimation();
  }
}
