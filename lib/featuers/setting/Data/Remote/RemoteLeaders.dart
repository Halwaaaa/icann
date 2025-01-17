import 'package:collection/collection.dart';
import 'package:flutter/widgets.dart';
import 'package:ican/core/compnated/Dialog.dart';
import 'package:ican/core/services/servicesDio.dart';
import 'package:ican/featuers/home/Presentation/models/OrderDatiles.dart';
import 'package:ican/featuers/home/Presentation/models/StatmentModels.dart';
import 'package:ican/featuers/setting/Presentation/Models/LeaderModels.dart';
import 'package:ican/featuers/setting/Presentation/Models/laederInfirmation.dart';

class RemoteLeadersAndStaff {
  RemoteLeadersAndStaff({required this.servicesDio});
  final ServicesDio servicesDio;

  Future<List<LeaderModels>?> getLeader() async {
    try {
      // إرسال طلب HTTP لاسترجاع الطلبات بناءً على حالة الطلب
      Map<String, dynamic>? response =
          await servicesDio.getRequestWithToken('leaders');

      // استخراج البيانات من الاستجابة
      List<dynamic>? responseData = response?['data'];
      List<LeaderModels> Leaders = [];

      if (responseData != null) {
        for (var element in responseData) {
          Leaders.add(LeaderModels.fromJson(element));
        }
      }

      // تحويل البيانات إلى كائنات OrderDatiles

      return Leaders;
    } catch (error) {
      print("leade" + error.toString());
      // إعادة الخطأ إذا كان مطلوبًا
      // rethrow;
    }

    return null;
  }

  Future<void> storeLaederAndStaff(
      Map<String, dynamic>? data, BuildContext context, bool isStaff) async {
    try {
      String path = isStaff ? 'staffs/store' : 'leaders/store';
      Map<String, dynamic>? response =
          await servicesDio.postRequest(path, data: data);

      Dafultdialog().dialogsucces(context, response?['message']).show();
    } catch (erorr) {
      Dafultdialog().dailogErorr(context, [erorr.toString()]).show();
    }
  }

  Future<void> updataLaederAndStaff(Map<String, dynamic>? data,
      BuildContext context, int id, bool isStaff) async {
    try {
      String path = isStaff ? 'staffs/update/$id' : 'leaders/update/$id';
      Map<String, dynamic>? response =
          await servicesDio.postRequest(path, data: data);

      Dafultdialog().dialogsucces(context, response?['message']).show();
    } catch (erorr) {
      Dafultdialog().dailogErorr(context, [erorr.toString()]).show();
    }
  }

  Future<LeaderWithDetails?> editLaederAndStaff(int id, bool isStaff) async {
    try {
      final String path = isStaff ? 'staffs/edit/$id' : 'leaders/edit/$id';
      Map<String, dynamic>? response =
          await servicesDio.getRequestWithToken(path);
      Map<String, dynamic> responseData = response!['data'];
      LeaderWithDetails leaderWithDetails = LeaderWithDetails(
        name: responseData['name'],
        username: responseData['username'],
        mobileNo: responseData['mobile_no'],
        password: responseData['password'],
        countryId: responseData['country_id'],
        stateId: responseData['state_id'],
        cityId: responseData['city_id'],
        address: responseData['address'],
        status: responseData['status'],
        note: responseData['note'],
      );

      return leaderWithDetails;

// Dafultdialog.dialogsucces(context, response?['message']).show();
    } catch (erorr) {
      print(erorr.toString());
      // Dafultdialog.dailogErorr(context, [erorr.toString()]).show();
    }
    return null;
    //  return null;
  }
}
