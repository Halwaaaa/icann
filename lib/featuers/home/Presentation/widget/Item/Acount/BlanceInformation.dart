import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ican/core/Loction/textApp.dart';
import 'package:ican/core/compnated/DafultListInformation.dart';
import 'package:ican/core/compnated/DafultInformationOneRow.dart';
import 'package:ican/core/compnated/item.dart';
import 'package:ican/core/utlies/Modules/ModulesHome.dart';
import 'package:ican/core/utlies/color.dart';
import 'package:ican/core/utlies/mathed.dart';
import 'package:ican/core/utlies/textStyle.dart';
import 'package:ican/featuers/home/Presentation/controol/acountControll.dart';
import 'package:ican/featuers/home/Presentation/models/StatmentModels.dart';
import 'package:ican/featuers/home/Presentation/widget/Empty.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BlanceInformation extends StatelessWidget {
  const BlanceInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AcountControll>(
      id: AcountControll.statements,
      builder: (controller) {
        List<StatementModels> statemen = controller.statementData;
        return SliverMainAxisGroup(
          slivers: [
            statemen.isEmpty
                ? const Empty(
                    titel: "لايوجد رصيد حالي ",
                  )
                : SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    sliver: SliverSkeletonizer(
                      enabled: controller.lodingStatements,
                      child: SliverList.builder(
                        itemCount: 1,
                        itemBuilder: (context, index) => Column(children: [
                          Align(
                            child: DafultInformationOneRow(
                              titel: AppText.balance.tr,
                              // subTitel: '${statemen[index].totalAmount}',
                            ),
                          ),
                          Align(
                            child: DafultInformationOneRow(
                              titel: AppText.deliveredDues.tr,
                              //  subTitel: '${statemen[index].deliveryFee}',
                            ),
                          ),
                          Align(
                            child: DafultInformationOneRow(
                              titel: AppText.netAmount.tr,
                              // subTitel: '${statemen[index].netAmount}',
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          DafultSliverlist(
                            statementModels: statemen[index],
                          ),
                        ]),
                      ),
                    ),
                  ),
          ],
        );
      },
    );
  }
}

class DafultSliverlist extends StatelessWidget {
  const DafultSliverlist({
    super.key,
    required this.statementModels,
  });
  final StatementModels statementModels;

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: GestureDetector(
          onTap: () {
            // controolHome.ChangedIndexCustmor(
            //     controolHome.indexModulesCustmor + 1);
          },
          child: Ietm(
              heightOfShadowLeft: 320,
              wdith: Mathed.ResponcvMax(
                  MediaQuery.sizeOf(context).width * 0.8, 300),
              Item: Padding(
                  padding: const EdgeInsets.all(30),
                  child: DafultListInformation(
                      titel: modulesTitleAcount,
                      iconName: modulesIconNameAcount))),
        ));
  }
}
