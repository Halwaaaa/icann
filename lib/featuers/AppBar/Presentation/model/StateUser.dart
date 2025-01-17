import 'package:hive/hive.dart';

part 'StateUser.g.dart';

@HiveType(typeId: 2)
class StateUser {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;
  @HiveField(2)
  final int idCounter;

  StateUser(this.id, this.name, this.idCounter);
  factory StateUser.fromJson(Map<String, dynamic> json, int idcountrs) {
    return StateUser(json['id'], json['name'], idcountrs);
  }
}
