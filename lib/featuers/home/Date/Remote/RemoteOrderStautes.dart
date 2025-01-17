import 'package:ican/core/services/servicesDio.dart';
import 'package:ican/featuers/AppBar/Presentation/model/CustmorUser.dart';
import 'package:ican/featuers/home/Presentation/models/CustmorAllUser.dart';
import 'package:ican/featuers/home/Presentation/models/GroupUser.dart';
import 'package:ican/featuers/home/Presentation/models/OrderSatutes.dart';
import 'package:ican/featuers/home/Presentation/widget/Item/custmor/CousmtorList.dart';

class RemoteOrderStautes {
  final ServicesDio servicesDio;
  RemoteOrderStautes(this.servicesDio);

  Future<List<OrderSatutes>?> getOrderStautes() async {
    try {
      Map<String, dynamic>? responcv =
          await servicesDio.getRequestWithToken('order-statuses');
      final List<OrderSatutes> groupUser = [];
      List<dynamic> responcvData = responcv?['data'];
      for (var element in responcvData) {
        groupUser.add(OrderSatutes.fromJson(element));
      }
      return groupUser;
      //  print(custmorUser[0].name);
    } catch (erorr) {
      return null;
    }
  }

  Future<List<OrderSatutes>?> getOrderStautesByGroup(int id) async {
    try {
      Map<String, dynamic>? responcv =
          await servicesDio.getRequestWithToken('groups/show/$id');
      final List<OrderSatutes> groupUser = [];
      List<dynamic> responcvData = responcv?['data'];
      for (var element in responcvData) {
        groupUser.add(OrderSatutes.fromJson(element));
      }
      return groupUser;
      //  print(custmorUser[0].name);
    } catch (erorr) {
      return null;
    }
  }
}
