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

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      defaultTransition: Transition.cupertinoDialog,
      customTransition: CustomPageTransition(),
      translations: TranslationsApp(),
      debugShowCheckedModeBanner: false,
      getPages: Routers.router,
      locale: const Locale('ar'),
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)
            .copyWith(background: const Color.fromRGBO(236, 224, 209, 1)),
      ),
    );
  }
}
