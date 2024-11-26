import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ican/core/utlies/mathed.dart';
import 'package:ican/featuers/home/controol/controolHome.dart';
import 'package:ican/featuers/home/widget/Categray.dart';
import 'package:ican/featuers/home/widget/SearchAndActeGory.dart';
import 'package:ican/featuers/home/widget/appBarHome.dart';
import 'package:ican/featuers/home/widget/itemtest.dart';
import 'package:ican/featuers/home/widget/titelHome.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final ControolHome controolHome = Get.find();

    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: CustomScrollView(slivers: [
        const AppBarHome(),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          sliver: SliverToBoxAdapter(
            child: AnimatedBuilder(
              animation: controolHome.animationController,
              builder: (context, child) => Opacity(
                opacity: controolHome.fadeAnimation.value,
                child: SlideTransition(
                  position: controolHome.positionAnimation,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TitleHome(),
                      // kkkk
                      Mathed.heightSmal(),
                      const SearchAndActeGory(),
                      Mathed.heightSmal(),
                      const Categeay(),
                      // Mathed.heightSmal(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        GetBuilder<ControolHome>(builder: (controller) {
          print("11");
          return SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            sliver: SliverGrid.builder(
              itemCount: 20,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
              itemBuilder: (context, index) {
                return Test(
                  index: index,
                );
              },
            ),
          );
        })
      ]),
    );
  }
}
