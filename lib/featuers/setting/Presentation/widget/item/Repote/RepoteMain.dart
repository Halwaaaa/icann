import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ican/featuers/setting/Presentation/Controller/RepoteControol.dart';

class RepoteMain extends StatelessWidget {
  const RepoteMain({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RepoteControol>(
      init:RepoteControol(),
      id: RepoteControol.repote,
      builder: (repoteControol) {
        return repoteControol
            .itemModulesReppote[repoteControol.indexModulesRepote];
      },
    );
  }
}
