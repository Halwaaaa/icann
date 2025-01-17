import 'package:hive/hive.dart';
import 'package:ican/core/services/hivenServices.dart';
import 'package:ican/featuers/setting/Presentation/Models/LeaderModels.dart';

class LocaleLeader {
  Box<List<dynamic>> boxstet;
  LocaleLeader(this.boxstet);
  Future<void> setLeader(
    List<LeaderModels> Leaders,
  ) async {
    if (!boxstet.isOpen) {
      boxstet = await Hive.openBox<List<dynamic>>(HivenServices.leaders);
    }

    boxstet.delete(HivenServices.leaders);
    boxstet.put(HivenServices.leaders, Leaders);

    //  getCountres();
    //  boxCountres.close();
  }

  Future<List<LeaderModels>?> getLeader() async {
    if (!boxstet.isOpen) {
      boxstet = await Hive.openBox<List<dynamic>>(HivenServices.leaders);
    }

    final data = boxstet.get(HivenServices.leaders);

    if (data != null) {
      try {
        //  return data as StateUser;
        return data.map((e) => e as LeaderModels).toList();
      } catch (e) {
        // معالجة خطأ التحويل إذا حدث
        print('Error casting data: $e');
        return null;
      }
    }

    return null;
  }
}
