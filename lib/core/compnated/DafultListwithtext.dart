import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ican/core/Loction/textApp.dart';
import 'package:ican/core/compnated/DafultListInformation.dart';
import 'package:ican/core/compnated/item.dart';
import 'package:ican/core/utlies/appimage.dart';
import 'package:ican/core/utlies/color.dart';
import 'package:ican/core/utlies/mathed.dart';
import 'package:ican/core/utlies/textStyle.dart';
import 'package:ican/featuers/home/Presentation/controol/OrderControll.dart';
import 'package:ican/featuers/home/Presentation/widget/Empty.dart';
import 'package:ican/featuers/home/Presentation/widget/Item/itemInformtion.dart';
import 'package:skeletonizer/skeletonizer.dart';

class DafultListInformationWithText extends StatelessWidget {
  const DafultListInformationWithText(
      {super.key,
      this.titel,
      required this.onTapTitle,
      this.subtitel,
      required this.onTapSubTitle,
      required this.titels,
      this.height,
      this.looding,
      required this.titelsIconName,
      this.count = 5});
  final String? titel;
  final List<String> Function(int index) titels;
  final List<String> titelsIconName;

  final String? subtitel;

  final Function(int index) onTapTitle;
  final Function(int index) onTapSubTitle;
  final double? height;
  final bool? looding;
  final int count;

  @override
  Widget build(BuildContext context) {
    return SliverMainAxisGroup(slivers: [
      count == 0
          ? Empty(titel: 'لايوجد طلبات')
          : SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              sliver: SliverList.separated(
                itemCount: count,
                itemBuilder: (context, index) {
                  return Skeletonizer(
                    enabled: looding ?? false,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: GestureDetector(
                        onTap: () {
                          // controolHome.ChangedIndexCustmor(
                          //     controolHome.indexModulesCustmor + 1);
                        },
                        child: Ietm(
                            heightOfShadowLeft: height ?? 300,
                            wdith: Mathed.ResponcvMax(
                                MediaQuery.sizeOf(context).width * 0.9, 350),
                            index: index,
                            Item: Padding(
                              padding: const EdgeInsets.all(30),
                              child: Column(
                                spacing: 20,
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                //            crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  //Text("data"),
                                  DafultListInformation(
                                      titel: titels(index),
                                      iconName: titelsIconName),

                                  ItemSpacerInformation(
                                    onTapSubTitle: () {
                                      onTapSubTitle(index);
                                    },
                                    onTapTitle: () {
                                      onTapTitle(index);
                                    },
                                    titel: titel ?? "",
                                    subTitel: subtitel ?? "",
                                  ),
                                ],
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
            ),
    ]);
  }
}

class ItemSpacerInformation extends StatelessWidget {
  const ItemSpacerInformation(
      {super.key,
      required this.subTitel,
      required this.titel,
      this.onTapTitle,
      this.onTapSubTitle});
  final String titel;
  final String subTitel;
  final Function()? onTapTitle;
  final Function()? onTapSubTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
            child: FittedBox(
                child: GestureDetector(
          onTap: onTapTitle,
          child: Text(titel,
              style: ApptextStyle.textStyleApp16.copyWith(
                  fontWeight: FontWeight.w700, color: AppColor.primaryAppbar)),
        ))),
        Flexible(
            fit: FlexFit.loose,
            child: FittedBox(
                child: GestureDetector(
              onTap: onTapSubTitle,
              child: Text(subTitel,
                  style: ApptextStyle.textStyleApp16.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppColor.primaryAppbar)),
            ))),
      ],
    );
  }
}
