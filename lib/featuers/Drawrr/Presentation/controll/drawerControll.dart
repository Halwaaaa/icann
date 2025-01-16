import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerControllMain extends GetxController
    with GetSingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final GlobalKey<DrawerControllerState> drawerKey =
      GlobalKey<DrawerControllerState>();

  void openDrawer() {
    scaffoldKey.currentState?.openDrawer();
    //update();
  }
}
