part of 'orderModels.dart';

class OrderModelsAdapter extends TypeAdapter<OrderModels> {
  @override
  final int typeId = 7;

  @override
  OrderModels read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OrderModels(
      id: fields[0] as int,
      order_number: fields[1] as int,
      state: fields[2] as String,
      total_amount: fields[3] as int,
      client_phone: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, OrderModels obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.order_number)
      ..writeByte(2)
      ..write(obj.state)
      ..writeByte(3)
      ..write(obj.total_amount)
      ..writeByte(4)
      ..write(obj.client_phone);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderModels &&
          runtimeType == other.runtimeType &&
          typeId == other.id;
}
