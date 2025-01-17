import 'package:hive/hive.dart';

part 'CustmorUser.g.dart';

@HiveType(typeId: 3)
class CustmorUser {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  CustmorUser({
    required this.id,
    required this.name,
  });
  factory CustmorUser.fromJson(Map<String, dynamic> json) {
    return CustmorUser(
      id: json['id'],
      name: json['name'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
