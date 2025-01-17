import 'package:hive/hive.dart';
import 'package:ican/core/services/hivenServices.dart';
import 'package:ican/featuers/home/Presentation/models/GroupUser.dart';

class LocalGroup {
  Box<List<dynamic>> boxGroup;
  LocalGroup(this.boxGroup);

  Future<void> setGroup(List<GroupUser> group) async {
    if (boxGroup.isOpen) {
      boxGroup = await Hive.openBox<List<dynamic>>(HivenServices.group);
    }
    boxGroup.delete(HivenServices.group);
    boxGroup.put(HivenServices.group, group);
  }

  Future<List<GroupUser>?> getGroup() async {
    if (boxGroup.isOpen) {
      boxGroup = await Hive.openBox<List<dynamic>>(HivenServices.custmorAll);
    }

    List<dynamic>? data = boxGroup.get(HivenServices.group);

    if (data != null) {
      try {
        List<GroupUser>? result = data
            .map(
              (e) => e as GroupUser,
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
