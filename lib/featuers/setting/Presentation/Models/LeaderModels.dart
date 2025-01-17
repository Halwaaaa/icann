import 'package:hive/hive.dart';

part 'LeaderModels.g.dart'; // لتوليد Adapter تلقائيًا.

@HiveType(typeId: 11) // معرف فريد للنموذج.
class LeaderModels {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String mobileNo;

  @HiveField(3)
  final String createdAt;

  @HiveField(4)
  final String groupName;

  LeaderModels({
    required this.id,
    required this.name,
    required this.mobileNo,
    required this.createdAt,
    required this.groupName,
  });

  // لتحويل JSON إلى كائن Leader
  factory LeaderModels.fromJson(Map<String, dynamic> json) {
    return LeaderModels(
      id: json['id'],
      name: json['name'],
      mobileNo: json['mobile_no'],
      createdAt: json['created_at'],
      groupName: json['group_name'],
    );
  }

  // لتحويل كائن Leader إلى JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'mobile_no': mobileNo,
      'created_at': createdAt,
      'group_name': groupName,
    };
  }
}
