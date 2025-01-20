import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ican/core/compnated/item.dart';
import 'package:ican/core/utlies/Modules/MoudulesResponses.dart';
import 'package:ican/core/utlies/color.dart';
import 'package:ican/core/utlies/mathed.dart';
import 'package:ican/core/utlies/textStyle.dart';
import 'package:ican/featuers/Responses/Presentation/Modles/ResponsesModels.dart';
import 'package:ican/featuers/Responses/Presentation/controll/ResponsesControll.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ResponsesView extends StatelessWidget {
  const ResponsesView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.replace(ResponsesControll());

    return GetBuilder<ResponsesControll>(
      init: ResponsesControll(),
      id: ResponsesControll.responsesAll,
      builder: (responsesControll) {
        final bool isLoding = responsesControll.lodingResponses;
        print(responsesControll.responsesDataAll);
        return SliverMainAxisGroup(
          slivers: [
            responsesControll.responsesDataAll?.length == 0
                ? SliverFillRemaining(
                    child: Center(
                      child: Text(
                        "لايوجد ردود حاليا",
                        style: ApptextStyle.textStyleApp24Selcted.copyWith(
                            color: AppColor.navyBlue,
                            fontSize: 22,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  )
                : SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    sliver: SliverList.separated(
                      itemCount: isLoding
                          ? MoudulesResponsesDafult.length
                          : responsesControll.responsesDataAll?.length,
                      itemBuilder: (context, index) {
                        ResponsesModels responsesModels = isLoding
                            ? MoudulesResponsesDafult[index]
                            : responsesControll.responsesDataAll![index];

                        return LayoutBuilder(
                          builder: (context, constraints) {
                            return GestureDetector(
                              onTap: () {},
                              child: Skeletonizer(
                                enabled: responsesControll.lodingResponses,
                                child: Align(
                                    alignment: Alignment.center,
                                    child: Ietm(
                                      heightOfShadowLeft: 300 +
                                          responsesControll.getTextHeight(
                                            responsesModels.response,
                                            ApptextStyle.textStyleApp20
                                                .copyWith(
                                              color: AppColor.primaryAppbar,
                                              fontWeight: FontWeight.w900,
                                            ),
                                            Mathed.ResponcvMax(
                                              MediaQuery.sizeOf(context).width *
                                                  0.9,
                                              400,
                                            ),
                                          ),
                                      wdith: Mathed.ResponcvMax(
                                        MediaQuery.sizeOf(context).width * 0.9,
                                        400,
                                      ),
                                      index: index,
                                      Item: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 10),
                                        child: Column(
                                          spacing: 10,
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            const SizedBox(height: 10),
                                            // Text(
                                            //   "${responsesModels.}الرقم ",
                                            //   textAlign: TextAlign.center,
                                            //   style: ApptextStyle.textStyleApp13
                                            //       .copyWith(color: AppColor.primaryAppbar),
                                            // ),
                                            Text(
                                              "الرد",
                                              style: ApptextStyle.textStyleApp16
                                                  .copyWith(
                                                color: AppColor.primaryAppbar,
                                                fontWeight: FontWeight.w900,
                                              ),
                                            ),
                                            Text(
                                              responsesModels.response,
                                              style: ApptextStyle.textStyleApp16
                                                  .copyWith(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            Text(
                                              responsesModels.createdAt,
                                              textAlign: TextAlign.end,
                                              style: ApptextStyle.textStyleApp13
                                                  .copyWith(
                                                      color: AppColor
                                                          .primaryAppbar),
                                            ),
                                            RwoBox(
                                              titel: "العميل",
                                              titelValue: responsesModels
                                                      .customerReading ==
                                                  1,
                                              subtitel: "المندوب",
                                              subtitelValue: responsesModels
                                                      .delegateReading ==
                                                  1,
                                            ),
                                            RwoBox(
                                              titel: "موظف العمل",
                                              titelValue: responsesModels
                                                      .staffReading ==
                                                  1,
                                              subtitel: "المتابعة المركزية",
                                              subtitelValue: responsesModels
                                                      .centralReading ==
                                                  1,
                                            ),
                                            RwoBox(
                                              titel: "متابعة الفرع",
                                              titelValue: responsesModels
                                                      .followBranchReading ==
                                                  1,
                                            ),
                                            Text(
                                              "الاسم: ${responsesModels.createdBy} ",
                                              textAlign: TextAlign.center,
                                              style: ApptextStyle.textStyleApp13
                                                  .copyWith(
                                                      color: AppColor
                                                          .primaryAppbar),
                                            )
                                          ],
                                        ),
                                      ),
                                    )),
                              ),
                            );
                          },
                        );
                      },
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 20,
                      ),
                    ),
                  ),
          ],
        );
      },
    );
  }
}

class RwoBox extends StatelessWidget {
  const RwoBox({
    super.key,
    required this.titel,
    required this.titelValue,
    this.subtitel,
    this.subtitelValue,
  });
  final String titel;
  final bool titelValue;
  final String? subtitel;
  final bool? subtitelValue;
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Row(
              spacing: 5,
              children: [
                Flexible(
                  flex: 5,
                  child: Text(
                    titel,
                    style: ApptextStyle.textStyleApp13.copyWith(
                        color: AppColor.primaryAppbar,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Flexible(
                  child: Checkbox(
                    value: titelValue,
                    activeColor: AppColor.Catrgray,
                    onChanged: (value) {},
                  ),
                ),
              ],
            ),
          ),
          subtitel != null
              ? Flexible(
                  child: Row(
                    spacing: 5,
                    children: [
                      Flexible(
                        flex: 5,
                        child: Text(
                          subtitel!,
                          // maxLines: 1,
                          style: ApptextStyle.textStyleApp13
                              .copyWith(color: AppColor.primaryAppbar),
                        ),
                      ),
                      Flexible(
                        child: Checkbox(
                          value: subtitelValue,
                          activeColor: AppColor.Catrgray,
                          onChanged: (value) {},
                        ),
                      ),
                    ],
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
