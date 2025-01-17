import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ican/featuers/home/Presentation/controol/countingControll.dart';

class CountingMain extends StatelessWidget {
  const CountingMain({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AcountingControll>(
      init: AcountingControll(),
      id: AcountingControll.counting,
      builder: (controllerCounting) => controllerCounting
          .itemMoudlesCounting[controllerCounting.indexCountingMoudels],
    );
  }
}
