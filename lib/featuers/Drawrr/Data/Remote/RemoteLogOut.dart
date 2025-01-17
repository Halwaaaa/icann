import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:ican/core/compnated/Dialog.dart';
import 'package:ican/core/compnated/dafultItem.dart';
import 'package:ican/core/services/hivenServices.dart';
import 'package:ican/core/services/servicesDio.dart';
import 'package:ican/core/utlies/route.dart';

class RemoteLogout {
  final ServicesDio servicesDio;
  RemoteLogout({
    required this.servicesDio,
  });
  Future<void> Logout(BuildContext context) async {
    print("object");
    try {
      Map<String, dynamic>? responcv = await servicesDio.postRequest('logout');
      print(responcv);

      if (responcv!['success'] == true) {
        Hive.deleteFromDisk();

        Get.offAllNamed(Routers.rLogin);
      }
    } catch (erorr) {
      Dafultdialog().dailogErorr(context, [erorr.toString()]).show();
      print(erorr.toString());
    }
  }
}
