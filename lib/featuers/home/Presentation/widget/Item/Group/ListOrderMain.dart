import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ican/core/Loction/textApp.dart';
import 'package:ican/core/compnated/DafultListwithtext.dart';
import 'package:ican/core/utlies/Modules/ModulesHome.dart';
import 'package:ican/core/utlies/Modules/MoudulesOrder.dart';
import 'package:ican/featuers/AppBar/Presentation/controll/AppbarControll.dart';
import 'package:ican/featuers/home/Presentation/controol/OrderControll.dart';

class ListOrderMain extends StatelessWidget {
  const ListOrderMain({super.key});

  @override
  Widget build(BuildContext context) {
    final Ordercontroll ordercontroll = Get.find();
    return DafultListInformationWithText(
      titels: orderListTitel,
      onTapSubTitle: () {},
      titelsIconName: orderListIconName,
      titel: AppText.details.tr,
      subtitel: AppText.responses.tr,
      onTapTitle: () {
        final AppBarControll appBarControll = Get.find();
        appBarControll.changedTitelAppBar(AppText.receiptDetails.tr);
        ordercontroll.changedIndexOrder(2);
      },
    );
  }
}
