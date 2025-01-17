import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ican/core/Loction/textApp.dart';
import 'package:ican/core/Models/UserModels.dart';
import 'package:ican/core/compnated/DafultListwithtext.dart';
import 'package:ican/core/services/hivenServices.dart';
import 'package:ican/core/utlies/Modules/ModulesHome.dart';
import 'package:ican/core/utlies/Modules/MoudulesSetting.dart';
import 'package:ican/core/utlies/appimage.dart';
import 'package:ican/core/utlies/enum/enumPermation.dart';
import 'package:ican/featuers/AppBar/Presentation/controll/SearchControll.dart';
import 'package:ican/featuers/home/Presentation/controol/custmorGrid.dart';
import 'package:ican/featuers/home/Presentation/models/CustmorAllUser.dart';
import 'package:ican/featuers/home/Presentation/widget/Empty.dart';
// ignore: unused_import
import 'package:ican/featuers/home/Presentation/widget/grid/custmor/custmorGrid.dart';
import 'package:ican/featuers/setting/Presentation/Controller/LeaderGroupControll.dart';
import 'package:ican/featuers/setting/Presentation/Controller/settingControll.dart';
import 'package:ican/featuers/setting/Presentation/Models/LeaderModels.dart';
import 'package:ican/featuers/setting/Presentation/widget/itemInformationsetting.dart';
import 'package:skeletonizer/skeletonizer.dart';

class LeadergroupAndStafflist extends StatelessWidget {
  const LeadergroupAndStafflist({super.key});

  @override
  Widget build(BuildContext context) {
    final LeaderGroupControll leaderGroupControll = Get.find();
    final SettingControll settingControll = Get.find();
    HivenServices hivenServices = Get.find();

    User? user = hivenServices.userbox.get(HivenServices.user);
    bool addStaff = settingControll.isStiff! &&
        user!.permation.contains(enumPermation.addStaff.label);
    bool addLeader = !settingControll.isStiff! &&
        user!.permation.contains(enumPermation.addLeaders.label);

    return SliverMainAxisGroup(slivers: [
      addStaff
          ? AddStaffAndLeader(
              title: "اضافة موظفين",
            )
          : SliverToBoxAdapter(),
      addLeader
          ? AddStaffAndLeader(
              title: AppText.addGroupLeader.tr,
            )
          : SliverToBoxAdapter(),
      const SliverToBoxAdapter(
        child: SizedBox(
          height: 30,
        ),
      ),
      const ListInformationGroup(),
    ]);
  }
}

class AddStaffAndLeader extends StatelessWidget {
  const AddStaffAndLeader({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    final LeaderGroupControll leaderGroupControll = Get.find();

    return SliverToBoxAdapter(
      child: ItemInformationSetting(
          onTap: () {
            leaderGroupControll.changedIndexModulesLeaderGroup(1, true);
          },
          titel: title,
          //  settingControll.isStiff
          //     ? "اضافة موظفين"
          //     : AppText.addGroupLeader.tr,
          iconNameStart: AppImageName.addGroupLeader),
    );
  }
}

class ListInformationGroup extends StatelessWidget {
  const ListInformationGroup({super.key});

  @override
  Widget build(BuildContext context) {
    final SettingControll settingControll = Get.find();
    final CustmorAndStaffControll custmorAndStaffControll = Get.find();
    bool isStaff = settingControll.isStiff!;
    settingControll.isStiff!
        ? custmorAndStaffControll.getLocalCustmor(false)
        : null;

    return GetBuilder<CustmorAndStaffControll>(
        id: CustmorAndStaffControll.custmorListA,
        builder: (custmorGridControll) {
          return GetBuilder<LeaderGroupControll>(
            id: LeaderGroupControll.leaderGroup,
            builder: (leaderGroupControll) {
              return GetBuilder<SearchControll>(
                id: SearchControll.saerch,
                builder: (saerchControol) {
                  List<CustmorAlluser> StaffUser = [];
                  List<LeaderModels> leaderUser = [];
                  List<LeaderModels> leaderNew = [];
                  List<CustmorAlluser> StaffNew = [];
                  if (isStaff) {
                    StaffUser = saerchControol.searchCoustmorAndStaff(
                        custmorGridControll,
                        saerchControol,
                        StaffNew,
                        StaffUser);
                  } else {
                    leaderUser = saerchControol.searchLeader(
                        leaderGroupControll,
                        saerchControol,
                        leaderNew,
                        leaderUser);
                  }
                  return SliverSkeletonizer(
                      enabled: isStaff
                          ? custmorGridControll.loding
                          : leaderGroupControll.lodingLeaders,
                      child: isStaff
                          ? StaffUser.isEmpty
                              ? Empty(titel: 'لم يتم اضافة موظفين بعد')
                              : listLaederAndSaiff(
                                  isStaff: isStaff,
                                  id: (index) => StaffUser[index].id,
                                  titel: (index) {
                                    return moudelsTitelCustmor(
                                        StaffUser[index]);
                                  },
                                  iconName: modulesIconNameCustmor,
                                  count: StaffUser.length,
                                )
                          : leaderUser.isEmpty
                              ? Empty(titel: 'لم يتم اضافة رؤساء مجموعات بعد ')
                              : listLaederAndSaiff(
                                  isStaff: isStaff,
                                  id: (index) => leaderUser[index].id,
                                  count: leaderUser.length,
                                  iconName: modulesIconNameLeaderGroup,
                                  titel: (index) => modulesTitelLeaderGroup(
                                      leaderUser[index]),
                                ));
                },
              );
            },
          );
        });
  }
}

class listLaederAndSaiff extends StatelessWidget {
  const listLaederAndSaiff({
    super.key,
    required this.isStaff,
    required this.titel,
    required this.iconName,
    required this.count,
    required this.id,
  });

  final bool isStaff;
  final List<String> Function(int index) titel;
  final int Function(int index) id;
  final List<String> iconName;
  final int count;

  @override
  Widget build(BuildContext context) {
    HivenServices hivenServices = Get.find();
    User? user = hivenServices.userbox.get(HivenServices.user);
    bool editStaff =
        isStaff && user!.permation.contains(enumPermation.editStaff.label);
    bool editLeader =
        !isStaff && user!.permation.contains(enumPermation.editLeaders.label);

    return DafultListInformationWithText(
      count: count,
      //isStaff ?StaifModels.length: leaderModels.length,
      titels: (int index) {
        return titel(index);

        //  isStaff? moudelsTitelCustmor(StaifModels[index]): modulesTitelLeaderGroup(leaderModels[index]);
      },
      titelsIconName: iconName,
      //isStaff?modulesIconNameCustmor: modulesIconNameLeaderGroup,
      //titel: AppText.details.tr,
      subtitel: editLeader || editStaff ? AppText.edit.tr : "",

      titel: null,
      onTapSubTitle: (index) {
        // print("object");
        //  print(controller.leaderListData[0].id);
        if (editLeader || editStaff) {
          final LeaderGroupControll leaderGroupControll = Get.find();
          leaderGroupControll.setIdUpDataLaeder(id(index));
          leaderGroupControll.changedIndexModulesLeaderGroup(2, false);
        }
      },
      onTapTitle: (index) {},
    );
  }
}
