import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ican/core/compnated/Dialog.dart';
import 'package:ican/core/services/servicesDio.dart';
import 'package:ican/featuers/AppBar/Presentation/model/CustmorUser.dart';
import 'package:ican/featuers/home/Presentation/models/CustmorAllUser.dart';
import 'package:ican/featuers/home/Presentation/models/GroupSotreModles.dart';
import 'package:ican/featuers/home/Presentation/models/GroupUser.dart';
import 'package:ican/featuers/home/Presentation/widget/Item/custmor/CousmtorList.dart';
import 'package:ican/featuers/mainLayout/Presentation/Controll/mainLayoutcontroll.dart';

class RemoteGroup {
  final ServicesDio servicesDio;
  RemoteGroup(this.servicesDio);

  Future<List<GroupUser>?> getGroup() async {
    try {
      Map<String, dynamic>? responcv =
          await servicesDio.getRequestWithToken('groups');
      final List<GroupUser> groupUser = [];
      List<dynamic> responcvData = responcv?['data'];
      for (var element in responcvData) {
        groupUser.add(GroupUser.fromJson(element));
      }
      return groupUser;
      //  print(custmorUser[0].name);
    } catch (erorr) {
      print("group" + erorr.toString());
      return null;
    }
  }

  Future<GroupsotreModles?> getGroupById(int id) async {
    try {
      Map<String, dynamic>? responcv =
          await servicesDio.getRequestWithToken('groups/edit/$id');
      Map<String, dynamic> responcvData = responcv?['data'];
      GroupsotreModles groupUser = GroupsotreModles(
          leader_id: responcvData['leader_id'],
          name: responcvData['name'],
          users: responcvData['users']);

      return groupUser;
      //  print(custmorUser[0].name);
    } catch (erorr) {
      print(erorr.toString());
    }
    return null;
  }

  Future<void> sorteGroup(
    Map<String, dynamic>? g,
    BuildContext context,
  ) async {
    try {
      Map<String, dynamic>? responcv =
          await servicesDio.postRequest('groups/store', data: g);
      Dafultdialog().dialogsucces(context, responcv?['message']).show();
    } catch (erorr) {
      Dafultdialog().dailogErorr(context, [erorr.toString()]).show();
    }
  }

  Future<void> upDataGroup(
      Map<String, dynamic>? g, BuildContext context, int id) async {
    try {
      Map<String, dynamic>? responcv =
          await servicesDio.postRequest('groups/update/$id', data: g);
      Dafultdialog().dialogsucces(context, responcv?['message']).show();
    } catch (erorr) {
      Dafultdialog().dailogErorr(context, [erorr.toString()]).show();
    }
  }
}
