import 'package:hive/hive.dart';

part 'WareList.g.dart'; // سيتم استخدام هذا الملف لتوليد Adapter

@HiveType(typeId: 12) // تعيين معرف فريد (typeId)
class WareList {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final int listNo;

  @HiveField(2)
  final String customerName;

  @HiveField(3)
  final String note;

  @HiveField(4)
  final String createdAt;

  @HiveField(5)
  final String createdBy;

  WareList({
    required this.id,
    required this.listNo,
    required this.customerName,
    required this.note,
    required this.createdAt,
    required this.createdBy,
  });

  // تحويل JSON إلى كائن ListModel
  factory WareList.fromJson(Map<String, dynamic> json) {
    return WareList(
      id: json['id'],
      listNo: json['list_no'],
      customerName: json['customer_name'],
      note: json['note'],
      createdAt: json['created_at'],
      createdBy: json['created_by'],
    );
  }

  // تحويل كائن WareList إلى JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'list_no': listNo,
      'customer_name': customerName,
      'note': note,
      'created_at': createdAt,
      'created_by': createdBy,
    };
  }
}
