import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ican/core/Loction/textApp.dart';
import 'package:ican/core/compnated/DafultInformationOneClomun.dart';
import 'package:ican/core/compnated/DafultListInformation.dart';
import 'package:ican/core/compnated/DafultListwithtext.dart';
import 'package:ican/core/compnated/item.dart';
import 'package:ican/core/utlies/Modules/MoudulesSetting.dart';
import 'package:ican/core/utlies/appimage.dart';
import 'package:ican/core/utlies/mathed.dart';
import 'package:ican/featuers/home/Presentation/widget/Empty.dart';
import 'package:ican/featuers/setting/Presentation/Controller/RepoteControol.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ItemRpotelist extends StatelessWidget {
  const ItemRpotelist({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RepoteControol>(
      id: RepoteControol.repoteSelected,
      builder: (controller) {
        return SliverMainAxisGroup(
          slivers: [
            SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, mainAxisSpacing: 0),
                delegate: SliverChildListDelegate([
                  Align(
                    alignment: Alignment.topCenter,
                    child: DafultInformationOneClomun(
                      titel: AppText.deliveredReports.tr,
                      iconName: AppImageName.additionLists,
                      isSlected: controller.indexRepoteSelected == 0,
                      onTap: () {
                        controller.changedSelectedReptoe(0);
                      },
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: DafultInformationOneClomun(
                      titel: AppText.returnedReports.tr,
                      iconName: AppImageName.withdrawalLists,
                      isSlected: controller.indexRepoteSelected == 1,
                      onTap: () {
                        controller.changedSelectedReptoe(1);
                      },
                    ),
                  ),
                ])),
            RepoteInformation(
              repoteControol: controller,
            ),
          ],
        );
      },
    );
  }
}

class RepoteInformation extends StatelessWidget {
  const RepoteInformation({super.key, required this.repoteControol});
  final RepoteControol repoteControol;

  @override
  Widget build(BuildContext context) {
    final String erorr = repoteControol.indexRepoteSelected == 0
        ? 'لايوجد كشف واصل'
        : " لايوجد كشف راجع";
    return SliverMainAxisGroup(slivers: [
      repoteControol.statementData.isEmpty
          ? Empty(titel: erorr)
          : SliverSkeletonizer(
              enabled: repoteControol.lodingStatements,
              child: DafultListInformationWithText(
                count: repoteControol.statementData.length,
                height: 400,
                titels: (int index) {
                  return modulesTitelReport(
                      repoteControol.statementData[index]);
                },
                titelsIconName: modulesIconNameRepot,
                onTapSubTitle: (index) {
                  // repoteControol.changedIndexModulesRepot(1);
                },
                // titel: 'h',
                subtitel: "",
                onTapTitle: (index) {},
              ),
            ),
    ]);
  }
}
