import 'package:hive/hive.dart';

part 'CustmorAlluser.g.dart';

@HiveType(typeId: 4)
class CustmorAlluser {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String mobile_no;
  @HiveField(3)
  final String created_at;
  CustmorAlluser({
    required this.id,
    required this.name,
    required this.created_at,
    required this.mobile_no,
  });
  factory CustmorAlluser.fromJson(Map<String, dynamic> json) {
    return CustmorAlluser(
      id: json['id'],
      name: json['name'],
      created_at: json['created_at'],
      mobile_no: json['mobile_no'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'created_at': created_at,
      "mobile_no": mobile_no
    };
  }
}
