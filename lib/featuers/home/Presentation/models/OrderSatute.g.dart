part of 'OrderSatutes.dart';

class OrderSatutesAdapter extends TypeAdapter<OrderSatutes> {
  @override
  final int typeId = 6;

  @override
  OrderSatutes read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OrderSatutes(
        id: fields[0] as int,
        name: fields[1] as String,
        orders: fields[2] as int);
  }

  @override
  void write(BinaryWriter writer, OrderSatutes obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.orders);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderSatutes &&
          runtimeType == other.runtimeType &&
          typeId == other.id;
}
