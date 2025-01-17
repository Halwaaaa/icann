import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:ican/core/compnated/DadfultBoutton.dart';
import 'package:ican/core/utlies/color.dart';
import 'package:ican/featuers/AppBar/Presentation/controll/SearchControll.dart';
import 'package:ican/featuers/AppBar/Presentation/widget/Drop/DropShowDatePiker.dart';

class StartAndEndEnd extends StatelessWidget {
  const StartAndEndEnd({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GetBuilder<SearchControll>(
          id: SearchControll.startDate,
          builder: (controller) {
            // print(AppText.DateOfStart);
            return DadfultBoutton(
              key1: controller.dropdownKeyDate,
              ColorSelected: AppColor.primaryAppbar,
              title: controller.titleStartDate,
              onTap: () {
                controller.changedVisibel(false);
                showDropShowDatePiker(context, true);
              },
              icon: const Icon(Icons.date_range_outlined),
            );
          },
        ),
        const SizedBox(
          height: 20,
        ),
        GetBuilder<SearchControll>(
          id: SearchControll.endDate,
          builder: (controller) {
            return DadfultBoutton(
              ColorSelected: AppColor.primaryAppbar,
              title: controller.titleEndDate,
              onTap: () {
                controller.changedVisibel(false);
                showDropShowDatePiker(context, false);

                //  showDropShowDatePiker(context);
              },
              icon: const Icon(Icons.date_range_outlined),
            );
          },
        ),
      ],
    );
  }
}
