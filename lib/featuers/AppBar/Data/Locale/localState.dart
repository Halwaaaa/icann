import 'package:hive/hive.dart';
import 'package:ican/core/services/hivenServices.dart';
import 'package:ican/featuers/AppBar/Presentation/model/CountersUser.dart';
import 'package:ican/featuers/AppBar/Presentation/model/StateUser.dart';

class LocaleStaute {
  final Box boxStautes;

  LocaleStaute(this.boxStautes);
  Future<void> setNewStautes(
    List<StateUser> newCountres,
  ) async {
    boxStautes.delete(HivenServices.stautes);
    boxStautes.put(newCountres[0].idCounter, newCountres);

    //  getCountres();
    //  boxCountres.close();
  }

  Future<List<StateUser>?> getCountres(int indexConters) async {
    List<dynamic>? data = boxStautes.get(indexConters);

    if (data != null) {
      try {
        return data.map((e) => e as StateUser).toList();
      } catch (e) {
        // معالجة خطأ التحويل إذا حدث
        print('Error casting data: $e');
        return null;
      }
    }

    return null;
  }
}
