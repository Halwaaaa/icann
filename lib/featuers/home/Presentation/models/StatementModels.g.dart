// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'StatmentModels.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StatementAdapter extends TypeAdapter<StatementModels> {
  @override
  final int typeId = 10;

  @override
  StatementModels read(BinaryReader reader) {
    return StatementModels(
      id: reader.readInt(),
      statementNo: reader.readInt(),
      userName: reader.readString(),
      createdAt: reader.readString(),
      totalAmount: reader.readInt(),
      deliveryFee: reader.readInt(),
      netAmount: reader.readInt(),
      ordersCount: reader.readInt(),
    );
  }

  @override
  void write(BinaryWriter writer, StatementModels obj) {
    writer.writeInt(obj.id);
    writer.writeInt(obj.statementNo);
    writer.writeString(obj.userName);
    writer.writeString(obj.createdAt);
    writer.writeInt(obj.totalAmount);
    writer.writeInt(obj.deliveryFee);
    writer.writeInt(obj.netAmount);
    writer.writeInt(obj.ordersCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StatementAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
