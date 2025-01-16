import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ican/featuers/home/Presentation/controol/custmorGrid.dart';

class CustomerMain extends StatelessWidget {
  const CustomerMain({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CustmorGridControll>(
        init: CustmorGridControll(),
        id: CustmorGridControll.cusmtor,
        builder: (custmorGridControll) {
          return custmorGridControll
              .itemMoudlesCustmor[custmorGridControll.indexModulesCustmor];
        });
  }
}
