import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ican/core/compnated/dafultItem.dart';
import 'package:ican/core/compnated/item.dart';
import 'package:ican/core/utlies/Modules/ModulesHome.dart';
import 'package:ican/core/utlies/appimage.dart';
import 'package:ican/featuers/home/Presentation/controol/controolHome.dart';
import 'package:ican/core/compnated/itemCategories.dart';
import 'package:ican/featuers/home/Presentation/widget/Item/itemtest.dart';
import 'package:ican/featuers/home/Presentation/widget/Item/tasi.dart';
import 'package:skeletonizer/skeletonizer.dart';

class GridCategories extends StatelessWidget {
  const GridCategories(
      {super.key,
      required this.titel,
      required this.icon,
      required this.itemWidth,
      required this.itemHeight,
      required this.onTap,
      this.loding = false,
      required this.crossAxisCount,
      required this.isText});
  final List<String> titel;
  final List<String> icon;
  final double itemWidth;
  final Function(int index) onTap;
  final double itemHeight;
  final int crossAxisCount;
  final bool isText;
  final bool loding;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      sliver: SliverGrid.builder(
        itemCount: titel.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: itemWidth / itemHeight,
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 20,
            mainAxisSpacing: 30),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              onTap(index);
            },
            child: Skeletonizer(
              enabled: loding,
              child: Align(
                alignment: AlignmentDirectional.topStart,
                child: Ietm(
                  index: index,
                  heightOfShadowLeft: itemHeight,
                  wdith: itemWidth,
                  Item: ItemCategories(
                    index: index,
                    isText: isText,
                    titel: titel,
                    icon: icon,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
