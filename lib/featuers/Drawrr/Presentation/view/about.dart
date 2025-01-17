import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ican/core/Loction/textApp.dart';
import 'package:ican/core/utlies/Modules/MoudlesDrawer.dart';
import 'package:ican/core/utlies/textStyle.dart';
import 'package:ican/featuers/AppBar/Presentation/view/aooBarAbout.dart';
import 'package:ican/featuers/AppBar/Presentation/widget/shapOfAbout.dart';
import 'package:ican/featuers/AppBar/Presentation/controll/AppbarControll.dart';
import 'package:ican/featuers/Drawrr/Presentation/widget/ItemAbout.dart';

class AboutApp extends StatelessWidget {
  const AboutApp({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.sizeOf(context).height;
    final double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
        body:
            // TweenAnimationBuilder(
            //     duration: const Duration(milliseconds: 1000),
            //     curve: Curves.linear,
            //     tween: Tween<double>(begin: 0.4, end: 1.0),
            //     builder: (context, value, child) => Opacity(
            //           opacity: value,
            //           child: child,
            //         ),
            //     child:
            CustomScrollView(
      slivers: [
        GetBuilder<AppBarControll>(
            id: AppBarControll.titelAppbar1,
            builder: (controller) {
              return AppBarAbout(
                appBarControll: controller,
              );
            }),
        GetBuilder<AppBarControll>(
            id: AppBarControll.appbar,
            builder: (controller) {
              return ShapOfAbout(
                appBarControll: controller,
              );
            }),
        SliverToBoxAdapter(
          child: SizedBox(
            height: height * .1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  width: width * 0.1,
                ),
                Flexible(
                  child: Text(
                    AppText.builtBy.tr,
                    style: ApptextStyle.textStyleApp24Selcted
                        .copyWith(fontSize: 22),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  width: width * 0.1,
                ),
              ],
            ),
          ),
        ),
        SliverList(
            delegate: SliverChildListDelegate.fixed(List.generate(4, (index) {
          return ItemAbout(
            iconName: modulesAboutIconName[index],
            titel: modulesAboutTitel[index],
          );
        }))),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 100,
          ),
        )
        //const SliverFillRemaining(),
      ],
    ));
    // ),
    // );
  }
}
