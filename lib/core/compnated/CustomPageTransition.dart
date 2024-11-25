// ignore_for_file: avoid_renaming_method_parameters

import 'package:flutter/cupertino.dart';
import 'package:get/get_navigation/src/routes/custom_transition.dart';

class CustomPageTransition extends CustomTransition {
  @override
  Widget buildTransition(
      BuildContext context,
      Curve? curve,
      Alignment? alignment,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    return ScaleTransition(
      scale: CurvedAnimation(
        parent: animation,
        curve: Curves.elasticOut, // تأثير يشبه Spring
      ),
      child: FadeTransition(
        opacity: animation,
        child: child,
      ),
    );
  }
  // @override
  // Widget buildTransi(BuildContext context, CurvedAnimation animation, CurvedAnimation alignment, Widget child) {
  //   return ScaleTransition(
  //     scale: CurvedAnimation(
  //       parent: animation,
  //       curve: Curves.elasticOut, // تأثير يشبه Spring
  //     ),
  //     child: FadeTransition(
  //       opacity: animation,
  //       child: child,
  //     ),
  //   );
  // }
}
