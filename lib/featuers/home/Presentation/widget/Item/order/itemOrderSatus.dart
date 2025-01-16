import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ican/featuers/home/Presentation/controol/OrderControll.dart';
import 'package:ican/featuers/home/Presentation/controol/controolHome.dart';

class OrderMain extends StatelessWidget {
  const OrderMain({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Ordercontroll>(
      init: Ordercontroll(),
      id: Ordercontroll.order,
      builder: (controllerOrder) => controllerOrder
          .itemMoudlesOrderSatuts[controllerOrder.indexModulesOrder],
    );
  }
}
