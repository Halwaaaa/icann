import 'package:collection/collection.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ican/core/services/servicesDio.dart';
import 'package:ican/featuers/home/Presentation/models/wareList.dart';
import 'package:ican/featuers/home/Presentation/models/warehousesModels.dart';

class RemoteStore {
  final ServicesDio servicesDio;
  RemoteStore(this.servicesDio);
  Future<List<Warehousesmodels>?> getWarehouse() async {
    try {
      Map<String, dynamic>? responcv =
          await servicesDio.getRequestWithToken('warehouses');
      List<dynamic> responcvData = responcv?['data'];
      List<Warehousesmodels>? ware = [];
      responcvData.forEachIndexed((index, element) async {
        ware.add(Warehousesmodels.fromMap(element));
        //   CountersUser countersUser = CountersUser.fromJson(element);
        //   countres.add(countersUser);
      });
      return ware;
    } catch (eerr) {
      print("RemoteStore" + eerr.toString());
    }
    return null;
  }

  Future<List<WareList>?> getList(bool isWithdraw) async {
    try {
      String path = isWithdraw ? "lists/withdraw" : "lists/add";
      Map<String, dynamic>? responcv =
          await servicesDio.getRequestWithToken(path);
      List<dynamic> responcvData = responcv?['data'];
      print(responcvData);
      List<WareList>? ware = [];
      responcvData.forEachIndexed((index, element) async {
        ware.add(WareList.fromJson(element));
        //   CountersUser countersUser = CountersUser.fromJson(element);
        //   countres.add(countersUser);
      });
      return ware;
    } catch (eerr) {
      print("RemoteWare" + eerr.toString());
    }
    return null;
  }
}
