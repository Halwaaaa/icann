import 'dart:convert';
import 'dart:math';

import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:ican/core/Models/UserModels.dart';
import 'package:ican/core/services/hivenServices.dart';
import 'package:ican/core/services/servicesDio.dart';
import 'package:ican/core/utlies/route.dart';

class LocalLogin {
  HivenServices hivenServices = Get.find();

  void storeUserData(Map<String, dynamic>? jsonResponse) async {
    try {
      print(jsonResponse);

      if (jsonResponse?['success'] == true) {
        final Map<String, dynamic> userData = jsonResponse?['data'];

        // تحويل JSON إلى كائن User
        final User user = User.fromJson(userData);
        final Box<User> box = await Hive.openBox<User>(HivenServices.user);

        box.delete(HivenServices.user); // تخزين الكائن في Hive
        box.put(HivenServices.user, user);
        //   ServicesDio().init(hivenServices);
        // box.get(user);
        //   HivenServices().init();

        // استرجاع البيانات مباشرة بعد التخزين
        ///   getUserData(box);
        final ServicesDio servicesDio = Get.find();
        servicesDio.onInit();

        Get.offAndToNamed(Routers.rMainLoyout);
      } else {}
    } catch (erorr) {
      print(erorr.toString());
    }
    // إغلاق Hive بعد التعامل مع البيانات
  }

  Future<User?> getUserData(Box<dynamic> box) async {
    dynamic user = await box.get(HivenServices.user);
    try {
      return user as User;
    } catch (erorr) {
      print(erorr);
    }

    if (user != null) {
      print("User ID: ${user.id}");
      print("User Name: ${user.name}");
      print("User Email: ${user.email}");
      print("User Type: ${user.userType}");
      print("User Token: ${user.token}");
    } else {
      print("No user data found.");
    }
    return null;
  }

  void Logout() {}
}
