import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ican/featuers/chooselanguage/controller/local_controller.dart';
import 'package:ican/featuers/chooselanguage/widget/custimbuttonlang.dart';

class Language extends GetView<LocaleController> {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("language".tr,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall), //Choose Language
              const SizedBox(height: 20),
              CustomButtonLang(
                  textbutton: "Ar",
                  onPressed: () {
                    controller.changeLang("ar");
                    Get.toNamed('/login');
                  }),
              CustomButtonLang(
                  textbutton: "En",
                  onPressed: () {
                    controller.changeLang("en");
                    Get.toNamed('/login');
                  }),
            ],
          )),
    );
  }
}
