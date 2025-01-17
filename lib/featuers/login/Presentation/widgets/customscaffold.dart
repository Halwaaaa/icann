import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ican/core/utlies/appimage.dart';
import 'package:ican/core/utlies/color.dart';
import 'package:ican/featuers/login/Presentation/controll/loginControll.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({super.key, this.child});
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    final LoginControll loginControll = Get.find();
    return Scaffold(
      //loginControll.backgroundColor.value,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Image.asset(
            AppImageName.loginbg,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          SafeArea(
            child: child!,
          ),
          Positioned.fill(
              child: GetBuilder<LoginControll>(
                  id: LoginControll.loginLoding,
                  builder: (logincontroll) => Visibility(
                        visible: loginControll.loginStart,
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                              sigmaX: 5.0, sigmaY: 5.0), // تأثير التغبيش
                          child: Container(
                            color: Colors.black.withOpacity(0.4),

                            child: const Center(
                              child: CircularProgressIndicator(
                                //value: 20,
                                //value: 0.2,
                                color: AppColor.primaryAppbar,
                              ),
                            ), // لون شفاف
                          ),
                        ),
                      )))
        ],
      ),
    );
  }
}
