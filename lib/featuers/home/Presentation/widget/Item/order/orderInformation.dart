import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ican/core/compnated/DafultOrderInformation.dart';
import 'package:ican/featuers/home/Presentation/controol/OrderControll.dart';

class OrderInformation extends StatelessWidget {
  const OrderInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Ordercontroll>(
        id: Ordercontroll.orderDatiles,
        builder: (ordercontroll) => SliverMainAxisGroup(slivers: [
              !ordercontroll.lodingOrderDatiles
                  ? DafultOrderInformation(
                      orderDatiles: ordercontroll.orderDatilesData!,
                    )
                  : const SliverFillRemaining(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
            ]));
  }
}
