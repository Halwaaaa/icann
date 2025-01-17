import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ican/core/Loction/textApp.dart';
import 'package:ican/core/compnated/DafultListwithtext.dart';
import 'package:ican/core/compnated/item.dart';
import 'package:ican/core/utlies/Modules/ModulesHome.dart';
import 'package:ican/core/utlies/Modules/MoudulesOrder.dart';
import 'package:ican/core/utlies/color.dart';
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

          return SliverMainAxisGroup(slivers: [
            Outcome(),
            DafultListInformationWithText(
              count: orderData.length,
              looding: isSearchSelected
                  ? ordercontroll.lodingOrder || searchControll.lodingOrderSarch
                  : ordercontroll.lodingOrder,
              titels: (int index) {
                return orderListTitel(orderData[index]);
              },
              onTapSubTitle: (index) {
                final ControolHome controolHome = Get.find();

                if (controolHome.indexModulesMain == 3) {
                  final AppBarControll appBarControll = Get.find();
                  appBarControll.changedTitelAppBar("الردوود");
                  ordercontroll.setIdOrder(orderData[index].id);
                  ordercontroll.changedIndexOrder(2);
                }
              },
              titelsIconName: orderListIconName,
              titel: AppText.details.tr,
              subtitel: AppText.responses.tr,
              onTapTitle: (index) {
                final AppBarControll appBarControll = Get.find();
                appBarControll.changedTitelAppBar(AppText.receiptDetails.tr);
                ordercontroll.getLocalOrderDatiles(orderData[index].id);
                ordercontroll.changedIndexOrder(3);
              },
            ),
          ]);
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
