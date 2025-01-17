import 'package:hive/hive.dart';

part 'StatementModels.g.dart'; // سيُستخدم لتوليد Adapter.

@HiveType(typeId: 10) // تعيين معرف فريد (typeId).
class StatementModels {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final int statementNo;

  @HiveField(2)
  final String userName;

  @HiveField(3)
  final String createdAt;

  @HiveField(4)
  final int totalAmount;

  @HiveField(5)
  final int deliveryFee;

  @HiveField(6)
  final int netAmount;

  @HiveField(7)
  final int ordersCount;

  StatementModels({
    required this.id,
    required this.statementNo,
    required this.userName,
    required this.createdAt,
    required this.totalAmount,
    required this.deliveryFee,
    required this.netAmount,
    required this.ordersCount,
  });

  // لتحويل JSON إلى كائن Statement
  factory StatementModels.fromJson(Map<String, dynamic> json) {
    return StatementModels(
      id: json['id'],
      statementNo: json['statement_no'],
      userName: json['user_name'],
      createdAt: json['created_at'],
      totalAmount: json['total_amount'],
      deliveryFee: json['delivery_fee'],
      netAmount: json['net_amount'],
      ordersCount: json['orders_count'],
    );
  }

  // لتحويل كائن Statement إلى JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'statement_no': statementNo,
      'user_name': userName,
      'created_at': createdAt,
      'total_amount': totalAmount,
      'delivery_fee': deliveryFee,
      'net_amount': netAmount,
      'orders_count': ordersCount,
    };
  }
}
