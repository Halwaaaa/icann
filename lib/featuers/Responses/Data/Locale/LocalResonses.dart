import 'package:hive/hive.dart';
import 'package:ican/core/services/hivenServices.dart';
import 'package:ican/featuers/Responses/Presentation/Modles/ResponsesModels.dart';
import 'package:ican/featuers/home/Presentation/models/GroupUser.dart';

class LocalResonses {
  Box<List<dynamic>> boxRes;
  LocalResonses(this.boxRes);

  Future<void> setResponsesAll(List<ResponsesModels> responses) async {
    if (boxRes.isOpen) {
      boxRes = await Hive.openBox<List<dynamic>>(HivenServices.group);
    }
    boxRes.delete(HivenServices.responsesAll);
    boxRes.put(HivenServices.responsesAll, responses);
  }

  Future<List<ResponsesModels>?> getResponsesAll() async {
    if (boxRes.isOpen) {
      boxRes = await Hive.openBox<List<dynamic>>(HivenServices.responsesAll);
    }

    List<dynamic>? data = boxRes.get(HivenServices.responsesAll);

    if (data != null) {
      try {
        List<ResponsesModels>? result = data
            .map(
              (e) => e as ResponsesModels,
            )
            .toList();
        return result;
      } catch (erorr) {}
      return null;
    }
    return null;
  }

  Future<void> setResponsesWithOrderId(
      List<ResponsesModels> responses, int idOrder) async {
    if (!boxRes.isOpen) {
      boxRes = await Hive.openBox<List<dynamic>>(HivenServices.responsesAll);
    }
    boxRes.delete(idOrder);
    boxRes.put(idOrder, responses);
  }

  Future<List<ResponsesModels>?> getResponsesWithId(int idOrder) async {
    if (!boxRes.isOpen) {
      boxRes = await Hive.openBox<List<dynamic>>(HivenServices.responsesAll);
    }

    List<dynamic>? data = boxRes.get(idOrder);

    if (data != null) {
      try {
        List<ResponsesModels>? result = data
            .map(
              (e) => e as ResponsesModels,
            )
            .toList();
        return result;
      } catch (erorr) {}
      return null;
    }
    return null;
  }
}
