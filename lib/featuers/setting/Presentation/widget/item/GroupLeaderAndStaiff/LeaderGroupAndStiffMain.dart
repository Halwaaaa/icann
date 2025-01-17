import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ican/featuers/setting/Presentation/Controller/LeaderGroupControll.dart';
import 'package:ican/featuers/setting/Presentation/widget/item/GroupLeaderAndStaiff/LeaderGroupAndStaffAdd.dart';

class LeaderGroupAndStaiffMain extends StatelessWidget {
  const LeaderGroupAndStaiffMain({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LeaderGroupControll>(
      init: LeaderGroupControll(),
      id: LeaderGroupControll.leaderGroup,
      builder: (leaderGroupcontroller) =>
          //testli()
          //  const LeaderGroupAdd(),

          leaderGroupcontroller.itemModulesLeaderGroup[
              leaderGroupcontroller.indexmodulesLeaderGroup],
    );
  }
}
