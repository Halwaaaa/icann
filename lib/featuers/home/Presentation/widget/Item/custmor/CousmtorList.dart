import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ican/core/Loction/textApp.dart';
import 'package:ican/core/compnated/DafultListInformation.dart';
import 'package:ican/core/compnated/item.dart';
import 'package:ican/core/utlies/appimage.dart';
import 'package:ican/core/utlies/mathed.dart';
import 'package:ican/featuers/AppBar/Presentation/controll/SearchControll.dart';
import 'package:ican/featuers/home/Presentation/controol/controolHome.dart';
import 'package:ican/featuers/home/Presentation/controol/custmorGrid.dart';
import 'package:ican/featuers/home/Presentation/models/CustmorAllUser.dart';
import 'package:ican/featuers/home/Presentation/widget/Empty.dart';
import 'package:ican/featuers/home/Presentation/widget/Item/itemInformtion.dart';
import 'package:ican/core/utlies/Modules/ModulesHome.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CousmtorList extends StatelessWidget {
  const CousmtorList({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CustmorAndStaffControll>(
      id: CustmorAndStaffControll.custmorListA,
      builder: (custmorGridControll) => SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        sliver: GetBuilder<SearchControll>(
          id: SearchControll.saerch,
          builder: (searchControll) {
            List<CustmorAlluser> custmorUser = [];
            List<CustmorAlluser> custmorNew = [];
            custmorUser = searchControll.searchCoustmorAndStaff(
                custmorGridControll, searchControll, custmorNew, custmorUser);

            //      saerch(
            //        custmorUser, searchControll, custmorNew, custmorGridControll);

            return SliverMainAxisGroup(slivers: [
              custmorUser.isEmpty
                  ? Empty(titel: "لاتوجد عناصر لعرضها")
                  : SliverList.separated(
                      itemCount: custmorUser.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            // custmorGridControll.setIdGroup(custmorNew[index].id);
                            // custmorGridControll.changedIndexCustmor(1);
                          },
                          child: Skeletonizer(
                            enabled: custmorGridControll.loding,
                            child: Align(
                              alignment: Alignment.center,
                              child: Ietm(
                                  isSelected: true,
                                  heightOfShadowLeft: 200,
                                  wdith: Mathed.ResponcvMax(
                                      MediaQuery.sizeOf(context).width * 0.9,
                                      600),
                                  index: index,
                                  Item: Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: DafultListInformation(
                                      titel: moudelsTitelCustmor(
                                          custmorUser[index]),
                                      iconName: modulesIconNameCustmor,
                                    ),
                                  )),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 20,
                      ),
                    ),
            ]);
          },
        ),
      ),
    );
  }
}
