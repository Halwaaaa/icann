import 'package:ican/core/services/servicesDio.dart';
import 'package:ican/featuers/AppBar/Presentation/model/CustmorUser.dart';
import 'package:ican/featuers/home/Presentation/models/CustmorAllUser.dart';
import 'package:ican/featuers/home/Presentation/widget/Item/custmor/CousmtorList.dart';

class RemoteAllcustmor {
  final ServicesDio servicesDio;
  RemoteAllcustmor(this.servicesDio);

  Future<List<CustmorAlluser>?> getCustmor(bool isCustmor) async {
    try {
      String path = isCustmor ? 'customers' : 'staffs';
      Map<String, dynamic>? responcv =
          await servicesDio.getRequestWithToken(path);
      final List<CustmorAlluser> custmorUser = [];
      List<dynamic> responcvData = responcv?['data'];
      for (var element in responcvData) {
        custmorUser.add(CustmorAlluser.fromJson(element));
      }
      return custmorUser;
      //  print(custmorUser[0].name);
    } catch (erorr) {
      return null;
    }
  }

  Future<List<CustmorAlluser>?> getCustmorById(int IdGroup) async {
    try {
      Map<String, dynamic>? responcv =
          await servicesDio.getRequestWithToken('staffs');
      final List<CustmorAlluser> custmorUser = [];
      List<dynamic> responcvData = responcv?['data'];
      for (var element in responcvData) {
        custmorUser.add(CustmorAlluser.fromJson(element));
      }
      return custmorUser;
      //  print(custmorUser[0].name);
    } catch (erorr) {
      return null;
    }
  }
}
