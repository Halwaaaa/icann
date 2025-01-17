import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ican/featuers/home/Presentation/controol/custmorGrid.dart';

class CustomerMain extends StatelessWidget {
  const CustomerMain({super.key, required this.isCustmor});
  final bool isCustmor;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CustmorAndStaffControll>(
        init: CustmorAndStaffControll(),
        id: CustmorAndStaffControll.cusmtor,
        builder: (custmorAndStaffControll) {
          custmorAndStaffControll.getLocalCustmor(isCustmor);
          return custmorAndStaffControll
              .itemMoudlesCustmor[custmorAndStaffControll.indexModulesCustmor];
        });
  }
}
