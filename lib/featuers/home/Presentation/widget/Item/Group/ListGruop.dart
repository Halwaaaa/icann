import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ican/core/Loction/textApp.dart';
import 'package:ican/core/compnated/DafultListInformation.dart';
import 'package:ican/core/compnated/item.dart';
import 'package:ican/core/utlies/Modules/ModulesHome.dart';
import 'package:ican/core/utlies/appimage.dart';
import 'package:ican/core/utlies/mathed.dart';
import 'package:ican/featuers/home/Presentation/controol/controolHome.dart';
import 'package:ican/featuers/home/Presentation/controol/groupControll.dart';
import 'package:ican/featuers/home/Presentation/widget/Item/itemInformtion.dart';

class ListGruop extends StatelessWidget {
  const ListGruop({super.key});

  @override
  Widget build(BuildContext context) {
    final GroupControll groupControll = Get.find();
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      sliver: SliverList.separated(
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              groupControll
                  .changedIndexGroup(groupControll.indexModulesGroup + 1);
              //  controolHome.tapCustmor(true, 0);
            },
            child: Align(
              alignment: Alignment.center,
              child: Ietm(
                  heightOfShadowLeft: 250,
                  wdith: Mathed.ResponcvMax(
                      MediaQuery.sizeOf(context).width * 0.9, 400),
                  index: index,
                  Item: Padding(
                      padding: const EdgeInsets.all(10),
                      child: DafultListInformation(
                        titel: moudelsTitelGroup,
                        iconName: modulesIconNameGroup,
                      ))),
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
