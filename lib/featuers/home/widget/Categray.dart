import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:ican/core/utlies/Modules.dart';
import 'package:ican/featuers/home/controol/controolHome.dart';
import 'package:ican/featuers/home/widget/itemCategray.dart';

class Categeay extends StatelessWidget {
  const Categeay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<controolHome>(builder: (controll) {
      return SizedBox(
        height: 60,
        width: double.infinity,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) => itemCatery(
            index: index,
            controll: controll,
          ),
          itemCount: ModulesCategory.length,
          separatorBuilder: (context, index) => const SizedBox(width: 20),
        ),
      );
    });
  }
}
