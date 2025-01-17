import 'package:flutter/cupertino.dart';
import 'package:ican/core/compnated/gridCategories.dart';

class DafultGrid extends StatelessWidget {
  const DafultGrid(
      {super.key,
      required this.title,
      required this.onTap,
      this.icon1,
      this.isloding,
      this.isText = true,
      this.Subtitel});
  final List<String> title;
  final List<String>? icon1;
  final Function(int) onTap;
  final List<String>? Subtitel;
  final bool isText;
  final bool? isloding;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    bool isTablet = screenWidth >= 600;

    int crossAxisCount = isTablet ? 3 : 2;
    double itemHeight = isTablet ? 200 : 170;
    double itemWidth = screenWidth / crossAxisCount - 35;
    List<String> titel = title;
    List<String> icon = icon1 ?? Subtitel ?? List.filled(titel.length, "0");

    return GridCategories(
        loding: isloding ?? false,
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
