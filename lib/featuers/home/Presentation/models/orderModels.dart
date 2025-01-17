import 'package:hive/hive.dart';

part 'OrderModels.g.dart';

@HiveType(typeId: 7)
class OrderModels {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final int order_number;
  @HiveField(2)
  final String state;
  @HiveField(3)
  final int total_amount;
  @HiveField(4)
  final String client_phone;

  OrderModels({
    required this.id,
    required this.order_number,
    required this.state,
    required this.total_amount,
    required this.client_phone,
  });
  factory OrderModels.fromJson(Map<String, dynamic> json) {
    return OrderModels(
      id: json['id'],
      order_number: json['order_number'],
      state: json['state'],
      total_amount: json['total_amount'],
      client_phone: json['client_phone'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'order_number': order_number,
      'state': state,
      'total_amount': total_amount,
      'client_phone': client_phone,
    };
  }
}
