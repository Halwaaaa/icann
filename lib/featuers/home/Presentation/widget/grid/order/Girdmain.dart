import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ican/core/utlies/Modules/MoudulesOrder.dart';
import 'package:ican/featuers/home/Presentation/controol/OrderControll.dart';
import 'package:ican/core/compnated/DafultGrid.dart';
import 'package:skeletonizer/skeletonizer.dart';

class GirdMain extends StatelessWidget {
  const GirdMain({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Ordercontroll>(
      id: Ordercontroll.orderStautes,
      builder: (ordercontroll) => DafultGrid(
        isloding: ordercontroll.lodingOrderStautes,
        title: ordercontroll.orderStautesData
            .map(
              (e) => e.name,
            )
            .toList(),
        Subtitel: ordercontroll.orderStautesData
            .map(
              (e) => e.orders.toString(),
            )
            .toList(),
        onTap: (index) {
          ordercontroll.changedIndexGrid(index);
          ordercontroll.changedIndexOrder(1);
        },
      ),
    );
  }
}
