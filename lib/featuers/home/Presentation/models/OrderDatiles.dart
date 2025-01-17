import 'package:hive/hive.dart';

part 'OrderDatiles.g.dart';

@HiveType(typeId: 8)
class OrderDatiles {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final int order_number;
  @HiveField(2)
  final String receiving_branch;
  @HiveField(3)
  final String sender_branch;
  @HiveField(4)
  final String customer_name;
  @HiveField(5)
  final String staff_name;
  @HiveField(6)
  final String customer_phone;
  @HiveField(7)
  final String staff_phone;
  @HiveField(8)
  final String client_name;
  @HiveField(9)
  final String client_phone;
  @HiveField(10)
  final String client_phone_two;
  @HiveField(11)
  final String client_whatsapp;
  @HiveField(12)
  final List<dynamic> products;
  @HiveField(13)
  final int number_of_pieces;
  @HiveField(14)
  final String country;
  @HiveField(15)
  final String state;
  @HiveField(16)
  final String city;
  @HiveField(17)
  final String address;
  @HiveField(18)
  final String amount_writing;
  @HiveField(19)
  final int total_amount;
  @HiveField(20)
  final int delivery_fee;
  @HiveField(21)
  final int net_amount;
  @HiveField(22)
  final String status;
  @HiveField(23)
  final String created_at;

  OrderDatiles({
    required this.id,
    required this.order_number,
    required this.receiving_branch,
    required this.sender_branch,
    required this.customer_name,
    required this.staff_name,
    required this.customer_phone,
    required this.staff_phone,
    required this.client_name,
    required this.client_phone,
    required this.client_phone_two,
    required this.client_whatsapp,
    required this.products,
    required this.number_of_pieces,
    required this.country,
    required this.state,
    required this.city,
    required this.address,
    required this.amount_writing,
    required this.total_amount,
    required this.delivery_fee,
    required this.net_amount,
    required this.status,
    required this.created_at,
  });

  factory OrderDatiles.fromJson(Map<String, dynamic> json) {
    return OrderDatiles(
      id: json['id'],
      order_number: json['order_number'],
      receiving_branch: json['receiving_branch'] ?? "---",
      sender_branch: json['sender_branch'] ?? "---",
      customer_name: json['customer_name'] ?? "---",
      staff_name: json['staff_name'] ?? "---",
      customer_phone: json['customer_phone'] ?? "---",
      staff_phone: json['staff_phone'] ?? "---",
      client_name: json['client_name'],
      client_phone: json['client_phone'],
      client_phone_two: json['client_phone_two'],
      client_whatsapp: json['client_whatsapp'],
      products: json['products'] ?? [],
      number_of_pieces: json['number_of_pieces'] ?? 0,
      country: json['country'],
      state: json['state'],
      city: json['city'] ?? "---",
      address: json['address'],
      amount_writing: json['amount_writing'],
      total_amount: json['total_amount'],
      delivery_fee: json['delivery_fee'],
      net_amount: json['net_amount'],
      status: json['status'],
      created_at: json['created_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'order_number': order_number,
      'receiving_branch': receiving_branch,
      'sender_branch': sender_branch,
      'customer_name': customer_name,
      'staff_name': staff_name,
      'customer_phone': customer_phone,
      'staff_phone': staff_phone,
      'client_name': client_name,
      'client_phone': client_phone,
      'client_phone_two': client_phone_two,
      'client_whatsapp': client_whatsapp,
      'products': products,
      'number_of_pieces': number_of_pieces,
      'country': country,
      'state': state,
      'city': city,
      'address': address,
      'amount_writing': amount_writing,
      'total_amount': total_amount,
      'delivery_fee': delivery_fee,
      'net_amount': net_amount,
      'status': status,
      'created_at': created_at,
    };
  }
}
