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
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: CustomScrollView(slivers: [
        const AppBarHome(),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          sliver: SliverToBoxAdapter(
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
        GetBuilder<controolHome>(builder: (controller) {
          print("11");
          return SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: AnimatedBuilder(
                animation: controller.animationController,
                builder: (context, child) => GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 20,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemBuilder: (context, index) {
                    return Test(
                      index: index,
                    );
                  },
                ),
              ),
            ),
          );
        })
      ]),
    );
  }
}
