import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ican/core/Loction/translations.dart';
import 'package:ican/core/compnated/CustomPageTransition.dart';
import 'package:ican/core/services/hivenServices.dart';
import 'package:ican/core/services/servicesDio.dart';
import 'package:ican/core/services/t.dart';
import 'package:ican/core/utlies/route.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  NotificationsHelper().initNotifications();
  NotificationsHelper().getAccessToken();
  
  NotificationsHelper().sendNotifications(
      body: "lll",
      fcmToken:
          "eZpiji0ZQ_6UAMLfkX9GWv:APA91bHsbdv1VtqjsP5mI_x8NG89E8WUniLX6HL1pu3tCroeNb0sOaawiT3Vyj2LrZy2jZVvthdSVONQoOWFAKWuGltLpmjJwe9qskvmGLorwQn7ZVzW4ro",
      title: "ff",
      userId: "fff",
      type: "s");

  NotificationsHelper().handleBackgroundNotifications();

  await Get.putAsync<HivenServices>(() async {
    return HivenServices().init();
  });
  await Get.putAsync<ServicesDio>(() async {
    return ServicesDio();
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      defaultTransition: Transition.upToDown,
      customTransition: MyCustomTransition(),
      translations: TranslationsApp(),
      debugShowCheckedModeBanner: false,
      getPages: Routers.router,
      locale: const Locale('ar'),
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        dialogBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)
            .copyWith(surface: Colors.white)
            .copyWith(surface: Colors.white),
      ),
    );
  }
}
