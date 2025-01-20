import 'package:hive/hive.dart';
part 'Warehousesmodels.g.dart'; // سيُستخدم لتوليد Adapter.

@HiveType(typeId: 12)
class Warehousesmodels {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final int qty;
  @HiveField(2)
  final double points;
  @HiveField(3)
  final int price;
  @HiveField(4)
  final int totalPrice;
  @HiveField(5)
  final double totalPoints;

  Warehousesmodels({
    required this.name,
    required this.qty,
    required this.points,
    required this.price,
    required this.totalPrice,
    required this.totalPoints,
  });

  // تحويل الموديل إلى Map
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'qty': qty,
      'points': points,
      'price': price,
      'total_price': totalPrice,
      'total_points': totalPoints,
    };
  }

  // تحويل Map إلى موديل
  factory Warehousesmodels.fromMap(Map<String, dynamic> map) {
    return Warehousesmodels(
      name: map['name'],
      qty: map['qty'],
      points: map['points'],
      price: map['price'],
      totalPrice: map['total_price'],
      totalPoints: map['total_points'],
    );
  }
}
