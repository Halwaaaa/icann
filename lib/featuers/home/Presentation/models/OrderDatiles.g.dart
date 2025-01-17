// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'OrderDatiles.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OrderDatilesAdapter extends TypeAdapter<OrderDatiles> {
  @override
  final int typeId = 8;

  @override
  OrderDatiles read(BinaryReader reader) {
    return OrderDatiles(
      id: reader.read() as int,
      order_number: reader.read() as int,
      receiving_branch: reader.read() as String,
      sender_branch: reader.read() as String,
      customer_name: reader.read() as String,
      staff_name: reader.read() as String,
      customer_phone: reader.read() as String,
      staff_phone: reader.read() as String,
      client_name: reader.read() as String,
      client_phone: reader.read() as String,
      client_phone_two: reader.read() as String,
      client_whatsapp: reader.read() as String,
      products: reader.read() as List<dynamic>,
      number_of_pieces: reader.read() as int,
      country: reader.read() as String,
      state: reader.read() as String,
      city: reader.read() as String,
      address: reader.read() as String,
      amount_writing: reader.read() as String,
      total_amount: reader.read() as int,
      delivery_fee: reader.read() as int,
      net_amount: reader.read() as int,
      status: reader.read() as String,
      created_at: reader.read() as String,
    );
  }

  @override
  void write(BinaryWriter writer, OrderDatiles obj) {
    writer
      ..write(obj.id)
      ..write(obj.order_number)
      ..write(obj.receiving_branch)
      ..write(obj.sender_branch)
      ..write(obj.customer_name)
      ..write(obj.staff_name)
      ..write(obj.customer_phone)
      ..write(obj.staff_phone)
      ..write(obj.client_name)
      ..write(obj.client_phone)
      ..write(obj.client_phone_two)
      ..write(obj.client_whatsapp)
      ..write(obj.products)
      ..write(obj.number_of_pieces)
      ..write(obj.country)
      ..write(obj.state)
      ..write(obj.city)
      ..write(obj.address)
      ..write(obj.amount_writing)
      ..write(obj.total_amount)
      ..write(obj.delivery_fee)
      ..write(obj.net_amount)
      ..write(obj.status)
      ..write(obj.created_at);
  }
}
