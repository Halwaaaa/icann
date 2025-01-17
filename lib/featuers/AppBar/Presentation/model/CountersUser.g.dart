part of 'CountersUser.dart';

class CountersAdapter extends TypeAdapter<CountersUser> {
  @override
  final int typeId = 1;

  @override
  CountersUser read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CountersUser(
      id: fields[0] as int,
      name: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CountersUser obj) {
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
      other is CountersAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CountersUserListAdapter extends TypeAdapter<List<CountersUser>> {
  @override
  final int typeId = 2;

  @override
  List<CountersUser> read(BinaryReader reader) {
    final length = reader.readInt();
    return List.generate(length, (_) => CountersAdapter().read(reader));
  }

  @override
  void write(BinaryWriter writer, List<CountersUser> obj) {
    writer.writeInt(obj.length);
    for (var counter in obj) {
      CountersAdapter().write(writer, counter);
    }
  }
}
