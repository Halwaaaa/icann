import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ican/core/Loction/textApp.dart';
import 'package:ican/core/Models/UserModels.dart';
import 'package:ican/core/compnated/DafultListwithtext.dart';
import 'package:ican/core/compnated/item.dart';
import 'package:ican/core/services/hivenServices.dart';
import 'package:ican/core/utlies/Modules/ModulesHome.dart';
import 'package:ican/core/utlies/Modules/MoudulesOrder.dart';
import 'package:ican/core/utlies/color.dart';
import 'package:ican/core/utlies/enum/enumPermation.dart';
import 'package:ican/core/utlies/mathed.dart';
import 'package:ican/core/utlies/textStyle.dart';
import 'package:ican/featuers/AppBar/Presentation/controll/AppbarControll.dart';
import 'package:ican/featuers/AppBar/Presentation/controll/SearchControll.dart';
import 'package:ican/featuers/home/Presentation/controol/OrderControll.dart';
import 'package:ican/featuers/home/Presentation/controol/controolHome.dart';
import 'package:ican/featuers/home/Presentation/models/orderModels.dart';

class ListOrderMain extends StatelessWidget {
  const ListOrderMain({super.key});

  @override
  Widget build(BuildContext context) {
    HivenServices hivenServices = Get.find();
    User? user = hivenServices.userbox.get(HivenServices.user);

    return GetBuilder<SearchControll>(
      id: SearchControll.saerch,
      builder: (searchControll) => GetBuilder<Ordercontroll>(
        id: Ordercontroll.orderList,
        builder: (ordercontroll) {
          bool isSearchSelected = searchControll.isSearch;
          List<OrderModels> orderData = ordercontroll.orderData;
          if (isSearchSelected &&
              !ordercontroll.lodingOrder &&
              !searchControll.lodingOrderSarch) {
            List<int>? ids = [];
            ids = searchControll.resultSearch?.map((e) => e.id).toList();
            if (ids != null) {
              orderData = [];

              ordercontroll.orderData.forEach(
                (element) {
                  if (ids!.contains(element.id)) {
                    orderData.add(element);
                  }
                },
              );
            }
          }

          return SliverPadding(
            padding: EdgeInsets.only(bottom: 30),
            sliver: SliverMainAxisGroup(slivers: [
              Outcome(),
              DafultListInformationWithText(
                  count: orderData.length,
                  looding: isSearchSelected
                      ? ordercontroll.lodingOrder ||
                          searchControll.lodingOrderSarch
                      : ordercontroll.lodingOrder,
                  titels: (int index) {
                    return orderListTitel(orderData[index]);
                  },
                  onTapSubTitle: (index) {
                    final AppBarControll appBarControll = Get.find();
                    appBarControll.changedTitelAppBar("الردوود");
                    ordercontroll.setIdOrder(orderData[index].id);
                    ordercontroll.changedIndexOrder(2);
                  },
                  titelsIconName: orderListIconName,
                  titel:
                      user!.permation.contains(enumPermation.orderDetails.label)
                          ? AppText.details.tr
                          : null,
                  subtitel: AppText.responses.tr,
                  onTapTitle: (index) {
                    if (user.permation
                        .contains(enumPermation.orderDetails.label)) {
                      final AppBarControll appBarControll = Get.find();
                      appBarControll
                          .changedTitelAppBar(AppText.receiptDetails.tr);
                      ordercontroll.getLocalOrderDatiles(orderData[index].id);
                      ordercontroll.changedIndexOrder(3);
                    }
                    //////
                  }),
            ]),
          );
        },
      ),
    );
  }
}

class Outcome extends StatelessWidget {
  const Outcome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.all(20),
      sliver: SliverToBoxAdapter(
          child: Ietm(
              heightOfShadowLeft: 200,
              wdith: Mathed.ResponcvMax(
                  MediaQuery.sizeOf(context).width * 0.9, 350),
              //index: index,
              Item: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                      //textDirection: TextDirection.ltr,
                      spacing: 20,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      //            crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            itemOutcome(
                              titel: AppText.netAmount.tr,
                              subTitel: '0',
                            ),
                            itemOutcome(
                              titel: AppText.totalAmount.tr,
                              subTitel: '0',
                            ),
                            itemOutcome(
                              titel: AppText.deliveryFee.tr,
                              subTitel: '0',
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            itemOutcome(
                              titel: 'عدد الطلبات',
                              subTitel: '0',
                            ),
                            itemOutcome(
                              titel: AppText.numberOfPieces.tr,
                              subTitel: '0',
                            ),
                            itemOutcome(
                              titel: 'عدد النقاط',
                              subTitel: '0',
                            ),
                          ],
                        ),
                      ])))),
    );
  }
}

class itemOutcome extends StatelessWidget {
  const itemOutcome({
    super.key,
    required this.titel,
    required this.subTitel,
  });
  final String titel;
  final String subTitel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 10,
      children: [
        Text(
          titel,
          style: ApptextStyle.textStyleApp13.copyWith(color: AppColor.Catrgray),
        ),
        Center(
          child: Text(
            subTitel,
            style:
                ApptextStyle.textStyleApp16.copyWith(color: AppColor.Catrgray),
          ),
        )
      ],
    );
  }
}
