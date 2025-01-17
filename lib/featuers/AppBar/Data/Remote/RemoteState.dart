import 'package:collection/collection.dart';
import 'package:ican/core/services/servicesDio.dart';
import 'package:ican/featuers/AppBar/Presentation/model/CountersUser.dart';
import 'package:ican/featuers/AppBar/Presentation/model/StateUser.dart';

class RemoteStates {
  RemoteStates({required this.servicesDio});
  final ServicesDio servicesDio;

  Future<List<StateUser>?> getStautes(int idCounters) async {
    try {
      Map<String, dynamic>? responcv =
          await servicesDio.getRequestWithToken('locations/states/$idCounters');

      List<dynamic> responcvData = responcv?['data'];
      List<StateUser>? states = [];
      print(responcvData);
      responcvData.forEachIndexed((index, element) async {
        states.add(StateUser.fromJson(element, idCounters));
        //   CountersUser countersUser = CountersUser.fromJson(element);
        //   countres.add(countersUser);
      });
      return states;
    } catch (erorr) {
      print("satetes" + erorr.toString());
      //rethrow;
    }
    return null;
  }

  Future<StateUser?> getStautesbyid(int idCounters, int idStates) async {
    try {
      Map<String, dynamic>? responcv =
          await servicesDio.getRequestWithToken('locations/states/$idCounters');

      List<dynamic> responcvData = responcv?['data'];
      StateUser? states;
      responcvData.forEachIndexed((index, element) async {
        if (element['id'] == idStates) {
          states = StateUser.fromJson(element, idCounters);
        }
        //   CountersUser countersUser = CountersUser.fromJson(element);
        //   countres.add(countersUser);
      });
      return states;
    } catch (erorr) {
      print(erorr.toString());
      //rethrow;
    }
    return null;
  }
}
