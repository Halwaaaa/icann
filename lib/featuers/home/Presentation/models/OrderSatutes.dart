import 'package:hive/hive.dart';

part 'OrderSatute.g.dart';

@HiveType(typeId: 6)
class OrderSatutes {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final int orders;

  OrderSatutes({
    required this.id,
    required this.name,
    required this.orders,
  });
  factory OrderSatutes.fromJson(Map<String, dynamic> json) {
    return OrderSatutes(
      id: json['id'],
      name: json['name'],
      orders: json['orders'],
    );
  }
  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'orders': orders};
  }
}
