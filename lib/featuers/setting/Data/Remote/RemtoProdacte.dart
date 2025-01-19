import 'package:ican/core/services/servicesDio.dart';
import 'package:ican/featuers/setting/Presentation/Models/prodect.dart';

class RemtoProdacte {
  final ServicesDio servicesDio;
  RemtoProdacte(this.servicesDio);
  Future<List<ProdectModels>?> getPordacte() async {
    try {
      Map<String, dynamic>? response =
          await servicesDio.getRequestWithToken('orders/data');
      List<dynamic>? responseData = response?['data'];
      // print(response);
      List<ProdectModels> prodect = [];

      if (responseData != null) {
        for (var element in responseData) {
          prodect.add(ProdectModels.fromJson(element));
        }
      }
      // print(responseData);
      return prodect;
    } catch (erorr) {
      print("pr" + erorr.toString());
    }
    return null;
  }
}
