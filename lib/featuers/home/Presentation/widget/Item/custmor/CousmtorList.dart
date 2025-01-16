import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ican/core/Loction/textApp.dart';
import 'package:ican/core/compnated/DafultListInformation.dart';
import 'package:ican/core/compnated/item.dart';
import 'package:ican/core/utlies/appimage.dart';
import 'package:ican/core/utlies/mathed.dart';
import 'package:ican/featuers/home/Presentation/controol/controolHome.dart';
import 'package:ican/featuers/home/Presentation/controol/custmorGrid.dart';
import 'package:ican/featuers/home/Presentation/widget/Item/itemInformtion.dart';
import 'package:ican/core/utlies/Modules/ModulesHome.dart';

class CousmtorList extends StatelessWidget {
  const CousmtorList({super.key});

  @override
  Widget build(BuildContext context) {
    final CustmorGridControll custmorGridControll = Get.find();
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      sliver: SliverList.separated(
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              custmorGridControll.changedIndexCustmor(1);
            },
            child: Align(
              alignment: Alignment.center,
              child: Ietm(
                  heightOfShadowLeft: 200,
                  wdith: Mathed.ResponcvMax(
                      MediaQuery.sizeOf(context).width * 0.9, 400),
                  index: index,
                  Item: Padding(
                    padding: const EdgeInsets.all(30),
                    child: DafultListInformation(
                      titel: moudelsTitelCustmor,
                      iconName: modulesIconNameCustmor,
                    ),
                  )),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
          height: 20,
        ),
      ),
    );
  }
}
