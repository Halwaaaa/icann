import 'package:hive/hive.dart';

part 'CountersUser.g.dart';

@HiveType(typeId: 1)
class CountersUser {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  CountersUser({
    required this.id,
    required this.name,
  });
  factory CountersUser.fromJson(Map<String, dynamic> json) {
    return CountersUser(
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
