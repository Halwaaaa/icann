import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:ican/core/compnated/DadfultBoutton.dart';
import 'package:ican/featuers/setting/Presentation/Controller/countersLaederAndStaff.dart';
import 'package:ican/featuers/setting/Presentation/Controller/settingControll.dart';

class stautes extends StatelessWidget {
  const stautes({
    super.key,
    required this.isAdd,
    // required this.leaderGroupControll,
  });
  final bool isAdd;

  //final LeaderGroupControll leaderGroupControll;
  @override
  Widget build(BuildContext context) {
    final SettingControll settingControll = Get.find();

    return GetBuilder<CountersLaederControll>(
      id: CountersLaederControll.statuesLaeder,
      builder: (controller) => DadfultBoutton(
        fillColor: controller.fillcolorSelectedStatues,
        key1: isAdd
            ? controller.dropdownKeySatuesAdd
            : controller.dropdownKeySatuyes,
        ColorSelected: controller.colorSelectedStatues,
        selacted: controller.topStautes,
        title: controller.titelStautes,
        onTap: () async {
          settingControll.scrollToIndex(7);
          await Future.delayed(const Duration(milliseconds: 100));

          // await searchControll.closeTextFormFiled();
          controller.ChangedTapStautes();
          controller.openCloseDropOfStautes(context, isAdd);
        },
        icon: Transform.rotate(
          angle: !controller.topStautes ? -3.14 / 2 : 3.14 / 2,
          child: Icon(
            Icons.arrow_forward_ios,
            color: controller.colorSelectedStatues == Colors.white
                ? Colors.white
                : null,
          ),
        ),
      ),
    );
  }
}
