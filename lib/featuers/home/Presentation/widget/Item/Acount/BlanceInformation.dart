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

class BlanceInformation extends StatelessWidget {
  const BlanceInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      sliver: SliverMainAxisGroup(slivers: [
        SliverToBoxAdapter(
          child: Align(
            child: DafultInformationOneRow(
              titel: AppText.balance.tr,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Align(
            child: DafultInformationOneRow(
              titel: AppText.deliveredDues.tr,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Align(
            child: DafultInformationOneRow(
              titel: AppText.netAmount.tr,
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 30,
          ),
        ),
        const DafultSliverlist(),
      ]),
    );
  }
}

class DafultSliverlist extends StatelessWidget {
  const DafultSliverlist({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemBuilder: (context, index) {
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
          ),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        height: 20,
      ),
    );
  }
}
