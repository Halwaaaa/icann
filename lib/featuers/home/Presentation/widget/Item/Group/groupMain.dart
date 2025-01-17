import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ican/featuers/home/Presentation/controol/groupControll.dart';

class GroupMain extends StatelessWidget {
  const GroupMain({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GroupControll>(
        init: GroupControll(),
        id: GroupControll.group,
        builder: (groupControll) {
          groupControll.getLocalGroup();
          return groupControll
              .itemMoudlesGroup[groupControll.indexModulesGroup];
        });
  }
}
