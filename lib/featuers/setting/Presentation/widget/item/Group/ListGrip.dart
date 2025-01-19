import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:ican/core/Loction/textApp.dart';
import 'package:ican/core/Models/UserModels.dart';
import 'package:ican/core/compnated/DafultListwithtext.dart';
import 'package:ican/core/compnated/item.dart';
import 'package:ican/core/services/hivenServices.dart';
import 'package:ican/core/utlies/Modules/ModulesHome.dart';
import 'package:ican/core/utlies/appimage.dart';
import 'package:ican/core/utlies/enum/enumPermation.dart';
import 'package:ican/core/utlies/mathed.dart';
import 'package:ican/core/utlies/textStyle.dart';
import 'package:ican/featuers/AppBar/Presentation/controll/SearchControll.dart';
import 'package:ican/featuers/home/Presentation/controol/groupControll.dart';
import 'package:ican/featuers/home/Presentation/models/GroupUser.dart';
import 'package:ican/featuers/setting/Presentation/Controller/GroupControol.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ListSGruop extends StatelessWidget {
  const ListSGruop({super.key});

  @override
  Widget build(BuildContext context) {
    final GroupSControol groupSControol = Get.find();
    HivenServices hivenServices = Get.find();
    User? user = hivenServices.userbox.get(HivenServices.user);

    return SliverMainAxisGroup(slivers: [
      SliverToBoxAdapter(
          child: user!.permation.contains(enumPermation.addGroup.label)
              ? Align(
                  child: ItemInformationAddGroup(
                  titel: AppText.addGroup.tr,
                  iconNameStart: AppImageName.group,
                  onTap: () {
                    groupSControol.changedIndexModulesGroup(1);
                  },
                ))
              : SizedBox.shrink()),
      SliverToBoxAdapter(
        child: SizedBox(
          height: 30,
        ),
      ),
      ListInformationGroup(
        user: user,
      ),
    ]);
  }
}

class ListInformationGroup extends StatelessWidget {
  const ListInformationGroup({super.key, required this.user});
  final User user;

  @override
  Widget build(BuildContext context) {
    final GroupSControol groupSControol = Get.find();
    final GroupControll groupControll = Get.find();
    groupControll.getLocalGroup();

    return GetBuilder<GroupControll>(
      id: GroupControll.groupList,
      builder: (controller) => SliverSkeletonizer(
          enabled: controller.loding,
          child: GetBuilder<SearchControll>(
              id: SearchControll.saerch,
              builder: (searchControll) {
                List<GroupUser> groupUser = [];
                List<GroupUser> groupNew = [];

                groupUser = searchControll.searchGroup(
                    groupControll, searchControll, groupNew, groupUser);

                return DafultListInformationWithText(
                  emptyMassges: "لاتوجد مجموعات بعد",
                  count: groupUser.length,
                  height: 350,
                  titels: (int index) {
                    return moudelsTitelGroup(groupUser[index]);
                  },
                  titelsIconName: modulesIconNameGroup2,
                  //titel: AppText.details.tr,
                  subtitel:
                      user.permation.contains(enumPermation.editGroup.label)
                          ? AppText.edit.tr
                          : "",
                  titel: null,
                  onTapSubTitle: (index) {
                    if (user.permation
                        .contains(enumPermation.editGroup.label)) {
                      groupSControol.setIdGroup(groupUser[index].id);
                      // updataGroup(controller.groupData[index].id);
                      groupSControol.changedIndexModulesGroup(2);
                      // groupSControol.updataGroup();
                    }
                  },
                  onTapTitle: (index) {},
                );
              })),
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
