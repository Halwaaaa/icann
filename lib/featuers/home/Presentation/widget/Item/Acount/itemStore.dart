import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ican/core/Loction/textApp.dart';
import 'package:ican/core/compnated/DafultInformationOneClomun.dart';
import 'package:ican/core/compnated/DafultListInformation.dart';
import 'package:ican/core/compnated/item.dart';
import 'package:ican/core/utlies/Modules/ModulesHome.dart';
import 'package:ican/core/utlies/appimage.dart';
import 'package:ican/core/utlies/mathed.dart';
import 'package:ican/featuers/home/Presentation/controol/acountControll.dart';

class StoreList extends StatelessWidget {
  const StoreList({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AcountControll>(
        id: AcountControll.store,
        builder: (acountControll) {
          return SliverMainAxisGroup(slivers: [
            SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                delegate: SliverChildListDelegate([
                  DafultInformationOneClomun(
                    onTap: () => acountControll.changedSelectedStoe(0),
                    titel: AppText.store.tr,
                    iconName: AppImageName.profile,
                    isSlected: acountControll.indexSelectedStore == 0,
                  ),
                  DafultInformationOneClomun(
                    onTap: () {
                      //  print("kk")
                      // ;

                      acountControll.changedSelectedStoe(1);
                    },
                    titel: AppText.additionLists.tr,
                    iconName: AppImageName.additionLists,
                    isSlected: acountControll.indexSelectedStore == 1,
                  ),
                  DafultInformationOneClomun(
                    titel: AppText.withdrawalLists.tr,
                    onTap: () {
                      acountControll.changedSelectedStoe(2);
                    },
                    iconName: AppImageName.withdrawalLists,
                    isSlected: acountControll.indexSelectedStore == 2,
                  ),
                ])),
            SliverPadding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                sliver: SliverList.separated(
                    separatorBuilder: (context, index) => const SizedBox(
                          height: 20,
                        ),
                    itemBuilder: (context, index) {
                      return Align(
                          alignment: Alignment.center,
                          child: GestureDetector(
                            onTap: () {
                              // custmorGridControll.changedIndexCustmor(1);
                            },
                            child: Ietm(
                              heightOfShadowLeft: 300,
                              wdith: Mathed.ResponcvMax(
                                  MediaQuery.sizeOf(context).width * 0.9, 400),
                              Item: Padding(
                                padding: const EdgeInsets.all(30),
                                child: DafultListInformation(
                                    titel:
                                        acountControll.indexSelectedStore == 0
                                            ? modulesProduct
                                            : moduleTitelStroe,
                                    iconName:
                                        acountControll.indexSelectedStore == 0
                                            ? modulesProductNameIcon
                                            : moduleIconNameStroe),
                              ),
                            ),
                          ));
                    }))
          ]);
        });
  }
}
