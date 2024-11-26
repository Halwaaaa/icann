import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: deprecated_member_use
class ControolHome extends GetxController with SingleGetTickerProviderMixin {
  late final AnimationController animationController;
  late final Animation<Offset> positionAnimation;
  late final Animation<double> fadeAnimation;

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

    update();
  }

  void startAnimation() {
    animationController.forward();
  }

  void initAnimtedGrid() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeIn),
    );
    positionAnimation = Tween<Offset>(
      begin: const Offset(0.0, 5), // يبدأ من الأسفل
      end: Offset.zero, // تبدأ الحركة من الأسفل
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeOut,
    ));
    startAnimation();
  }
}
