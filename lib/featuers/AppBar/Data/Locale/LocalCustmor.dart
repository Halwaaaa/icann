import 'package:hive/hive.dart';
import 'package:ican/core/services/hivenServices.dart';
import 'package:ican/featuers/AppBar/Presentation/model/CustmorUser.dart';

class LocaleCustmor {
  final Box<List<dynamic>?> boxCustmor;
  LocaleCustmor(this.boxCustmor);

  Future<void> setCustmor(List<CustmorUser>? custmor) async {
    if (!boxCustmor.isOpen) {
      await Hive.openBox<List<dynamic>>(HivenServices.custmorName);
    }
    boxCustmor.delete(HivenServices.custmorName);
    boxCustmor.put(HivenServices.custmorName, custmor);
  }

  Future<List<CustmorUser>?> getCustmor() async {
    if (!boxCustmor.isOpen) {
      await Hive.openBox<List<dynamic>>(HivenServices.custmorName);
    }
    final data = boxCustmor.get(HivenServices.custmorName);
    try {
      if (data != null) {
        return data
            .map(
              (e) => e as CustmorUser,
            )
            .toList();
      }
      return null;
    } catch (erorr) {
      return null;
    }
  }
}
