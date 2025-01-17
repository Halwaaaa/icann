import 'package:hive/hive.dart';
import 'package:ican/core/services/hivenServices.dart';
import 'package:ican/featuers/AppBar/Presentation/model/CountersUser.dart';

class LocaleCountres {
  final Box<List<dynamic>?> boxCountres;
  LocaleCountres({
    required this.boxCountres,
  });
  Future<void> setNewStautes(List<CountersUser> newCountres) async {
    boxCountres.delete(HivenServices.conters);
    boxCountres.put(HivenServices.conters, newCountres);

    getCountres();
    //  boxCountres.close();
  }

  Future<List<CountersUser>?> getCountres() async {
    if (!boxCountres.isOpen) {
      await Hive.openBox<List<dynamic>>(HivenServices.conters);
    }
    final data = boxCountres.get(HivenServices.conters);

    if (data != null) {
      try {
        return data.map((e) => e as CountersUser).toList();
      } catch (e) {
        print('Error casting data: $e');
        return null;
      }
    }

    return null;
  }
}
