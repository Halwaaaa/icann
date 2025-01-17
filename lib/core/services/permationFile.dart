import 'dart:io';

import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:permission_handler/permission_handler.dart';

class PermsionFilesServers {
  static Future<void> requestStoragePermission() async {
    if (Platform.isAndroid) {
      // طلب إذن التخزين على Android
      PermissionStatus status = await Permission.storage.request();
      await handePermsion(status);
    } else if (Platform.isIOS) {
      // طلب إذن الوصول إلى مكتبة الصور على iOS
      PermissionStatus status = await Permission.photos.request();
      await handePermsion(status);
    }

    //  openAppSettings();
  }

  static Future<void> handePermsion(PermissionStatus status) async {
    print(status.isProvisional);
    if (status == PermissionStatus.permanentlyDenied) {
      throw PermissionStatuspermanentlyDenied(
          'م رفض إذن الوصول للملفات بشكل دائم. يرجى الذهاب إلى إعدادات التطبيق لتغيير الأذونات');
    }
    if (status == PermissionStatus.denied) {
      PermissionStatus status = await Permission.storage.request();

      if (status != PermissionStatus.granted) {
        throw PermissionStatuspermanentlyDenied(
            'م رفض إذن الوصول للملفات بشكل دائم. يرجى الذهاب إلى إعدادات التطبيق لتغيير الأذونات');
      }
    }
  }
}

class PermissionStatuspermanentlyDenied implements Exception {
  final String message;
  PermissionStatuspermanentlyDenied(this.message);

  @override
  String toString() {
    return message;
  }
}
