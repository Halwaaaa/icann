import 'package:hive/hive.dart';
import 'package:ican/core/services/hivenServices.dart';
import 'package:ican/featuers/AppBar/Presentation/model/CustmorUser.dart';
import 'package:ican/featuers/home/Presentation/models/CustmorAllUser.dart';

class LocalAllCustmor {
  LocalAllCustmor();

  Future<void> setCustmor(List<CustmorAlluser> custmorAlluser,
      Box<List<dynamic>> boxCustmor, bool isCustmor) async {
    if (boxCustmor.isOpen) {
      boxCustmor = await Hive.openBox<List<dynamic>>(
          isCustmor ? HivenServices.custmorAll : HivenServices.staff);
    }
    boxCustmor
        .delete(isCustmor ? HivenServices.custmorAll : HivenServices.staff);
    boxCustmor.put(isCustmor ? HivenServices.custmorAll : HivenServices.staff,
        custmorAlluser);
  }

  Future<List<CustmorAlluser>?> getCustmor(
      Box<List<dynamic>> boxCustmor, bool isCustmor) async {
    if (boxCustmor.isOpen) {
      boxCustmor = await Hive.openBox<List<dynamic>>(
          isCustmor ? HivenServices.custmorAll : HivenServices.staff);
    }

    List<dynamic>? data = boxCustmor
        .get(isCustmor ? HivenServices.custmorAll : HivenServices.staff);

    if (data != null) {
      try {
        List<CustmorAlluser>? result = data
            .map(
              (e) => e as CustmorAlluser,
            )
            .toList();
        return result;
      } catch (erorr) {
        print(erorr.toString());
      }
      return null;
    }
    return null;
  }

  Future<void> setCustmorByIdGroup(
      List<int> id, int idGroup, Box<List<dynamic>> boxCustmor) async {
    if (boxCustmor.isOpen) {
      boxCustmor =
          await Hive.openBox<List<dynamic>>(HivenServices.custmorAllGroup);
    }
    boxCustmor.delete(idGroup);
    boxCustmor.put(idGroup, id);
  }

  Future<List<int>?> getCustmorByIdGroup(
      int idGroup, Box<List<dynamic>> boxCustmor) async {
    if (boxCustmor.isOpen) {
      boxCustmor =
          await Hive.openBox<List<dynamic>>(HivenServices.custmorAllGroup);
    }

    List<dynamic>? data = boxCustmor.get(idGroup);

    if (data != null) {
      try {
        List<int>? result = data
            .map(
              (e) => e as int,
            )
            .toList();
        return result;
      } catch (erorr) {
        print(erorr.toString());
      }
      return null;
    }
    return null;
  }
}
