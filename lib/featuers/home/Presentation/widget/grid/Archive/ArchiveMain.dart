import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ican/core/utlies/Modules/MoudulesOrder.dart';
import 'package:ican/featuers/home/Presentation/controol/archiveControll.dart';
import 'package:ican/core/compnated/DafultGrid.dart';

class ArchiveGrid extends StatelessWidget {
  const ArchiveGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ArchiveControll archiveControll = Get.find();
    List<String> titel = archeiv;
    List<String> icon = List.filled(archeiv.length, "2");

    return DafultGrid(
      title: titel,
      onTap: (index) {
        archiveControll.changedAppBarTitel(index);
        archiveControll.changedArchiveIndex(1);
      },
    );

    // GridCategories(
    //   onTap: (index) {},
    //   isText: true,
    //   crossAxisCount: crossAxisCount,
    //   icon: icon,
    //   titel: titel,
    //   itemHeight: itemHeight,
    //   itemWidth: itemWidth,
    // );
  }
}
