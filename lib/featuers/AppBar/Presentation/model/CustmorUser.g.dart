part of 'CustmorUser.dart';

class CustmorAdapter extends TypeAdapter<CustmorUser> {
  @override
  final int typeId = 3;

  @override
  CustmorUser read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CustmorUser(
      id: fields[0] as int,
      name: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CustmorUser obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CustmorUser &&
          runtimeType == other.runtimeType &&
          typeId == other.id;
}
