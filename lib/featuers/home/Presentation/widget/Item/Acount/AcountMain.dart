import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:ican/featuers/home/Presentation/controol/acountControll.dart';

class AcountMain extends StatelessWidget {
  const AcountMain({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AcountControll>(
      init: AcountControll(),
      id: AcountControll.acount,
      builder: (acountControll) =>
          acountControll.itemMoudlesAcount[acountControll.indexAcountMoudels],
    );
  }
}
