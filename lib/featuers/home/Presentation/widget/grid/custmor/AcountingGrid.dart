import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ican/core/utlies/Modules/ModulesHome.dart';
import 'package:ican/featuers/AppBar/Presentation/controll/custmorControll.dart';
import 'package:ican/featuers/home/Presentation/widget/grid/custmor/custmorGrid.dart';
import 'package:ican/core/compnated/DafultGrid.dart';

class CustmorAcountingGrid extends StatelessWidget {
  const CustmorAcountingGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return DafultGrid(
        title: moudelsAcounting,
        onTap: (index) {
          // custmorGridControll.changedIndexCustmorAcouting(1);
        },
        titel1: "ssd");
  }
}
