import 'package:hive/hive.dart';
import 'package:ican/core/services/hivenServices.dart';
import 'package:ican/featuers/AppBar/Presentation/model/CountersUser.dart';
import 'package:ican/featuers/AppBar/Presentation/model/StateUser.dart';
import 'package:ican/featuers/home/Presentation/models/OrderSatutes.dart';
import 'package:ican/featuers/home/Presentation/models/StatmentModels.dart';

class StatementLocal {
  Box<List<dynamic>> boxstet;
  StatementLocal(this.boxstet);
  Future<void> setStatement(
      List<StatementModels> statement, bool continued) async {
    if (!boxstet.isOpen) {
      boxstet = await Hive.openBox<List<dynamic>>(HivenServices.statement);
    }
    String key = continued ? HivenServices.continued : HivenServices.recovered;

    boxstet.delete(key);
    boxstet.put(key, statement);

    //  getCountres();
    //  boxCountres.close();
  }

  Future<List<StatementModels>?> getStatement(bool continued) async {
    if (!boxstet.isOpen) {
      boxstet = await Hive.openBox<List<dynamic>>(HivenServices.statement);
    }
    String key = continued ? HivenServices.continued : HivenServices.recovered;

    final data = boxstet.get(key);

    if (data != null) {
      try {
        //  return data as StateUser;
        return data.map((e) => e as StatementModels).toList();
      } catch (e) {
        // معالجة خطأ التحويل إذا حدث
        print('Error casting data: $e');
        return null;
      }
    }

    return null;
  }
}
