import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ican/core/Loction/textApp.dart';
import 'package:ican/core/compnated/DafultListInformation.dart';
import 'package:ican/core/compnated/item.dart';
import 'package:ican/core/utlies/Modules/ModulesHome.dart';
import 'package:ican/core/utlies/appimage.dart';
import 'package:ican/core/utlies/mathed.dart';
import 'package:ican/featuers/AppBar/Presentation/controll/SearchControll.dart';
import 'package:ican/featuers/home/Presentation/controol/controolHome.dart';
import 'package:ican/featuers/home/Presentation/controol/groupControll.dart';
import 'package:ican/featuers/home/Presentation/models/GroupUser.dart';
import 'package:ican/featuers/home/Presentation/widget/Empty.dart';
import 'package:ican/featuers/home/Presentation/widget/Item/itemInformtion.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ListGruop extends StatelessWidget {
  const ListGruop({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GroupControll>(
      id: GroupControll.groupList,
      builder: (groupControll) {
        return GetBuilder<SearchControll>(
          id: SearchControll.saerch,
          builder: (searchControll) {
            List<GroupUser> groupUser = [];
            List<GroupUser> groupNew = [];

            groupUser = searchControll.searchGroup(
                groupControll, searchControll, groupNew, groupUser);
            return SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                sliver: SliverMainAxisGroup(slivers: [
                  groupUser.isEmpty
                      ? Empty(titel: "لايوجد مجموعات بعد")
                      : SliverList.separated(
                          itemCount: groupUser.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                final ControolHome controolHome = Get.find();
                                controolHome
                                    .setIDGroupSlelcted(groupUser[index].id);
                                groupControll.changedIndexGroup(
                                    groupControll.indexModulesGroup + 1);
                                //  controolHome.tapCustmor(true, 0);
                              },
                              child: Skeletonizer(
                                enabled: groupControll.loding,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Ietm(
                                      heightOfShadowLeft: 250,
                                      wdith: Mathed.ResponcvMax(
                                          MediaQuery.sizeOf(context).width *
                                              0.9,
                                          400),
                                      index: index,
                                      Item: Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: DafultListInformation(
                                            titel: moudelsTitelGroup(
                                                groupUser[index]),
                                            iconName: modulesIconNameGroup,
                                          ))),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 20,
                          ),
                        ),
                ]));
          },
        );
      },
    );
  }
}
