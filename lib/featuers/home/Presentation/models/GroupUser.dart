import 'package:hive/hive.dart';

part 'GroupUser.g.dart';

@HiveType(typeId: 5)
class GroupUser {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String updated_at;
  @HiveField(3)
  final String created_at;
  @HiveField(4)
  final String leader_name;

  GroupUser({
    required this.id,
    required this.name,
    required this.created_at,
    required this.updated_at,
    required this.leader_name,
  });
  factory GroupUser.fromJson(Map<String, dynamic> json) {
    return GroupUser(
        id: json['id'],
        name: json['name'],
        created_at: json['created_at'],
        updated_at: json['updated_at'],
        leader_name: json['leader_name']);
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'created_at': created_at,
      "updated_at": updated_at,
      'leader_name': leader_name,
    };
  }
}
