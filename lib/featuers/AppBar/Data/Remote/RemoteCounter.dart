import 'package:collection/collection.dart';
import 'package:ican/core/services/servicesDio.dart';
import 'package:ican/featuers/AppBar/Presentation/model/CountersUser.dart';

class RemoteCounter {
  RemoteCounter({required this.servicesDio});
  final ServicesDio servicesDio;

  Future<List<CountersUser>?> getCounters() async {
    try {
      Map<String, dynamic>? responcv =
          await servicesDio.getRequestWithToken('locations/countries');

      List<dynamic> responcvData = responcv?['data'];
      List<CountersUser>? countres = [];
      responcvData.forEachIndexed((index, element) async {
        CountersUser countersUser = CountersUser.fromJson(element);
        countres.add(countersUser);
      });
      return countres;
    } catch (erorr) {
      print(erorr.toString());
      //rethrow;
    }
    return null;
  }

  Future<CountersUser?> getCountersbyId(int id) async {
    try {
      Map<String, dynamic>? responcv =
          await servicesDio.getRequestWithToken('locations/countries');

      List<dynamic> responcvData = responcv?['data'];
      CountersUser? countres;
      responcvData.forEachIndexed((index, element) async {
        if (element['id'] == id) {
          CountersUser countersUser = CountersUser.fromJson(element);
          countres = countersUser;
        }
      });
      return countres;
    } catch (erorr) {
      print(erorr.toString());
      //rethrow;
    }
    return null;
  }

  Future<void> getStautes(int id, CountersUser countersUser) async {
    try {
      Map<String, dynamic>? responcv =
          await servicesDio.getRequestWithToken('locations/states/$id');
      print(countersUser.id);
      print(countersUser.name);
      print(responcv?['data']);
    } catch (erorr) {
      print(erorr.toString());
    }
  }
}
