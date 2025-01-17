import 'package:flutter/cupertino.dart';
import 'package:get/get_navigation/src/routes/custom_transition.dart';

class MyCustomTransition extends CustomTransition {
  @override
  Widget buildTransition(
      BuildContext context,
      Curve? curve,
      Alignment? alignment,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    var slideAnimation = Tween<Offset>(
      begin: const Offset(0.0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: animation,
      curve: curve ?? Curves.easeInOut,
    ));

    var fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: animation,
      curve: curve ?? Curves.easeInOut,
    ));

    return SlideTransition(
      position: slideAnimation,
      child: child,
    );
  }
}
