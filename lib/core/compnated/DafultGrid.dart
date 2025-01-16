import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:ican/core/utlies/Modules/ModulesHome.dart';
import 'package:ican/core/utlies/Modules/MoudulesOrder.dart';
import 'package:ican/featuers/home/Presentation/controol/OrderControll.dart';
import 'package:ican/featuers/home/Presentation/controol/controolHome.dart';
import 'package:ican/core/compnated/gridCategories.dart';

class DafultGrid extends StatelessWidget {
  const DafultGrid(
      {super.key,
      required this.title,
      required this.onTap,
      this.icon1,
      this.isText = true,
      required this.titel1});
  final List<String> title;
  final List<String>? icon1;
  final Function(int) onTap;
  final String? titel1;
  final bool isText;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    bool isTablet = screenWidth >= 600;

    int crossAxisCount = isTablet ? 3 : 2;
    double itemHeight = isTablet ? 200 : 150;
    double itemWidth = screenWidth / crossAxisCount - 35;
    List<String> titel = title;
    List<String> icon = icon1 ?? List.filled(titel.length, titel1 ?? "00");

    return GridCategories(
        titel: titel,
        icon: icon,
        isText: isText,
        itemWidth: itemWidth,
        itemHeight: itemHeight,
        onTap: (index) {
          onTap(index);
          // ordercontroll.changedIndexOrder(1);
        },
        crossAxisCount: crossAxisCount);
  }
}
