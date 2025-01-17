import 'package:ican/core/services/servicesDio.dart';
import 'package:ican/featuers/AppBar/Data/Remote/RemtoeSarch.dart';
import 'package:ican/featuers/AppBar/Presentation/model/CustmorUser.dart';
import 'package:ican/featuers/home/Date/Remote/RemoteStore.dart';
import 'package:ican/featuers/home/Presentation/widget/Item/custmor/CousmtorList.dart';

class RemoteCustmor {
  final ServicesDio servicesDio;
  RemoteCustmor(this.servicesDio);

  Future<List<CustmorUser>?> getCustmor() async {
    // print("kkkkkkkkkkkkkkkkkkk");
    try {
      // Search search = Search(servicesDio);
      // search.getSaerch();
      RemoteStore remoteStore = RemoteStore(servicesDio);
      remoteStore.getWarehouse();

      Map<String, dynamic>? responcv =
          await servicesDio.getRequestWithToken('customers');
      final List<CustmorUser> custmorUser = [];
      List<dynamic> responcvData = responcv?['data'];
      // print(responcv);
      for (var element in responcvData) {
        custmorUser.add(CustmorUser.fromJson(element));
      }
      return custmorUser;
      //  print(custmorUser[0].name);
    } catch (erorr) {
      print("stafffff" + erorr.toString());
      //  return null;
    }
    return null;
  }
}
