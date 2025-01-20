// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'warehousesModels.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class warehousesAdapter extends TypeAdapter<Warehousesmodels> {
  @override
  final int typeId = 12;

  @override
  Warehousesmodels read(BinaryReader reader) {
    return Warehousesmodels(
      name: reader.readString(),
      points: reader.readDouble(),
      price: reader.readInt(),
      qty: reader.readInt(),
      totalPoints: reader.readDouble(),
      totalPrice: reader.readInt(),
    );
  }

  @override
  void write(BinaryWriter writer, Warehousesmodels obj) {
    writer.writeString(obj.name); // كتابة الحقل name
    writer.writeDouble(obj.points); // كتابة الحقل points
    writer.writeInt(obj.price); // كتابة الحقل price
    writer.writeInt(obj.qty); // كتابة الحقل qty
    writer.writeDouble(obj.totalPoints); // كتابة الحقل totalPoints
    writer.writeInt(obj.totalPrice);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is warehousesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
