part of 'CustmorAllUser.dart';

class CustmorAllAdapter extends TypeAdapter<CustmorAlluser> {
  @override
  final int typeId = 4;

  @override
  CustmorAlluser read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CustmorAlluser(
        id: fields[0] as int,
        name: fields[1] as String,
        created_at: fields[2] as String,
        mobile_no: fields[3] as String);
  }

  @override
  void write(BinaryWriter writer, CustmorAlluser obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.created_at)
      ..writeByte(3)
      ..write(obj.mobile_no);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CustmorAlluser &&
          runtimeType == other.runtimeType &&
          typeId == other.id;
}
