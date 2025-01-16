import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ican/core/Loction/textApp.dart';
import 'package:ican/core/compnated/DafultInformationOneRow.dart';
import 'package:ican/core/compnated/DafultListInformation.dart';
import 'package:ican/core/compnated/DafultListwithtext.dart';
import 'package:ican/core/compnated/item.dart';
import 'package:ican/core/utlies/Modules/ModulesHome.dart';
import 'package:ican/core/utlies/appimage.dart';
import 'package:ican/core/utlies/mathed.dart';
import 'package:ican/core/utlies/textStyle.dart';
import 'package:ican/featuers/setting/Presentation/Controller/GroupControol.dart';

class ListSGruop extends StatelessWidget {
  const ListSGruop({super.key});

  @override
  Widget build(BuildContext context) {
    final GroupSControol groupSControol = Get.find();
    return SliverMainAxisGroup(slivers: [
      SliverToBoxAdapter(
          child: Align(
              child: ItemInformationAddGroup(
        titel: AppText.addGroup.tr,
        iconNameStart: AppImageName.group,
        onTap: () {
          groupSControol.changedIndexModulesGroup(1);
        },
      ))),
      const ListInformationGroup(),
    ]);
  }
}

class ListInformationGroup extends StatelessWidget {
  const ListInformationGroup({super.key});

  @override
  Widget build(BuildContext context) {
    final GroupSControol groupSControol = Get.find();

    return DafultListInformationWithText(
      titels: moudelsTitelGroup,
      titelsIconName: modulesIconNameGroup2,
      //titel: AppText.details.tr,
      subtitel: AppText.edit.tr,
      titel: null,
      onTapSubTitle: () {
        groupSControol.changedIndexModulesGroup(2);
      },
      onTapTitle: () {},
    );
  }
}

class ItemInformationAddGroup extends StatelessWidget {
  const ItemInformationAddGroup(
      {super.key,
      required this.titel,
      required this.iconNameStart,
      this.onTap});
  final String titel;
  final String iconNameStart;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        spacing: 0,
        children: [
          const SizedBox(
            height: 10,
          ),
          Ietm(
              Item: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Image.asset(
                      iconNameStart,
                      height: 25,
                      width: 25,
                    ),
                  ),
                  Text(
                    titel,
                    style: ApptextStyle.textStyleApp24Selcted
                        .copyWith(fontSize: 20),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Transform.rotate(
                      angle: 3.14,
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        size: 25,
                      ),
                    ),
                  ),
                  // const Text("1466", style: ApptextStyle.textStyleApp16)
                ],
              ),
              heightOfShadowLeft: 90,
              wdith: Mathed.ResponcvMax(
                  MediaQuery.sizeOf(context).width * 0.9, 350)),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
