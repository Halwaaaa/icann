import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ican/core/services/hivenServices.dart';
import 'package:ican/core/utlies/appimage.dart';

import 'package:ican/core/utlies/route.dart';
import 'package:ican/featuers/login/Presentation/view/loginView.dart';
import 'package:ican/featuers/mainLayout/Presentation/View/mainLayout.dart';
import 'package:page_transition/src/enum.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HivenServices hivenServices = Get.find();

    return Scaffold(
        body: AnimatedSplashScreen(
            duration: 1000,
            nextRoute: hivenServices.userbox.get(HivenServices.user) == null
                ? Routers.rLogin
                : Routers.rMainLoyout,
            pageTransitionType: PageTransitionType.fade,
            splash: Center(
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                      image: AssetImage(AppImageName.logo),
                      fit: BoxFit.fitHeight,
                      alignment: Alignment.center,
                    )),
                //  child: Image.asset('assets/images/logo.gif'),
              ),
            ),
            nextScreen: hivenServices.userbox.get(HivenServices.user) == null
                ? LoginView()
                : MainlayoutView(),
            splashTransition: SplashTransition.scaleTransition,
            splashIconSize: 200,
            //  pageTransitionType: PageTransitionType.scale,
            backgroundColor: Colors.white));
  }
}
