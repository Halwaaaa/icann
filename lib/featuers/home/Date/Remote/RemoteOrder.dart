import 'package:collection/collection.dart';
import 'package:ican/core/services/servicesDio.dart';
import 'package:ican/featuers/AppBar/Presentation/model/CountersUser.dart';
import 'package:ican/featuers/AppBar/Presentation/model/StateUser.dart';
import 'package:ican/featuers/home/Presentation/models/orderModels.dart';
import 'package:ican/featuers/home/Presentation/widget/Item/order/itemOrderSatus.dart';

class RemoteOrder {
  RemoteOrder({required this.servicesDio});
  final ServicesDio servicesDio;
  Future<List<OrderModels>?> getOrderByidGroup(
      int idOrderStautes, int idGroup) async {
    try {
      Map<String, dynamic>? responcv = await servicesDio.getRequestWithToken(
          'orders/status/$idOrderStautes?group_id=$idGroup');

      List<dynamic> responcvData = responcv?['data'];
      List<OrderModels>? order = [];
      responcvData.forEachIndexed((index, element) async {
        order.add(OrderModels.fromJson(element));
        //   CountersUser countersUser = CountersUser.fromJson(element);
        //   countres.add(countersUser);
      });
      return order;
    } catch (erorr) {
      print(erorr.toString());
      //rethrow;
    }
    return null;
  }

  Future<List<OrderModels>?> getOrder(int idOrderStautes) async {
    try {
      Map<String, dynamic>? responcv = await servicesDio
          .getRequestWithToken('orders/status/$idOrderStautes');

      List<dynamic> responcvData = responcv?['data'];
      List<OrderModels>? order = [];
      responcvData.forEachIndexed((index, element) async {
        order.add(OrderModels.fromJson(element));
        //   CountersUser countersUser = CountersUser.fromJson(element);
        //   countres.add(countersUser);
      });
      return order;
    } catch (erorr) {
      print(erorr.toString());
      //rethrow;
    }
    return null;
  }
}
  // Future<void> showOerderByGroup(int id) async {

  // Map<String, dynamic>? responcv = await servicesDio
  //         .getRequestWithToken('groups/show/$id');

  //     List<dynamic> responcvData = responcv?['data'];
  //     List<OrderModels>? order = [];
  //     responcvData.forEachIndexed((index, element) async {
  //       order.add(OrderModels.fromJson(element));
  //       //   CountersUser countersUser = CountersUser.fromJson(element);
  //       //   countres.add(countersUser);
  //     });
  //     return order;
  //   } catch (erorr) {
  //     print(erorr.toString());
  //     //rethrow;
  //   }
  //   return null;
  // }

