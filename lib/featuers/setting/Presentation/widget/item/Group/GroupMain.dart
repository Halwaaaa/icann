import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ican/featuers/home/Presentation/controol/groupControll.dart';
import 'package:ican/featuers/setting/Presentation/Controller/GroupControol.dart';

class GroupSMain extends StatelessWidget {
  const GroupSMain({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GroupSControol>(
      init: GroupSControol(),
      id: GroupSControol.group,
      builder: (groupcontroller) =>
          groupcontroller.itemModulesGroup[groupcontroller.indexModulesGroup],
    );
  }
}
