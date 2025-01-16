import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ican/core/utlies/Modules/MoudulesOrder.dart';
import 'package:ican/featuers/home/Presentation/controol/OrderControll.dart';
import 'package:ican/core/compnated/DafultGrid.dart';

class GirdMain extends StatelessWidget {
  const GirdMain({super.key});

  @override
  Widget build(BuildContext context) {
    final Ordercontroll ordercontroll = Get.find();

    return DafultGrid(
      title: moudlesLabelOrderStauts,
      titel1: ordercontroll.titel,
      onTap: (index) {
        ordercontroll.changedIndexGrid(index);
        ordercontroll.changedIndexOrder(1);
      },
    );
  }
}
