import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ican/core/Loction/translations.dart';
import 'package:ican/core/compnated/CustomPageTransition.dart';
import 'package:ican/core/utlies/route.dart';

void main() {
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
