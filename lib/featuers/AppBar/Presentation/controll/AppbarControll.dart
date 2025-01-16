import 'package:get/get.dart';
import 'package:ican/core/Loction/textApp.dart';
import 'package:ican/core/utlies/Modules/ModulesHome.dart';

class AppBarControll extends GetxController {
  late bool isAppBarDone = false;
  late String titelAppBar;
  @override
  void onInit() {
    titelAppBar = modulesCategoryAppbar[0];

    super.onInit();
  }

  void changedTitelAppBar(String titel) {
    titelAppBar = titel;
    update([titelAppbar1]);
  }

  void ChangedisAppBarDone(bool value) {
    isAppBarDone = value;
    update([appbar]);
  }

  static String appbar = 'appBar';
  static String titelAppbar1 = 'titelAppbar';
}
