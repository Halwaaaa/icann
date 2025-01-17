part of 'GroupUser.dart';

class GroupUserAdapter extends TypeAdapter<GroupUser> {
  @override
  final int typeId = 5;

  @override
  GroupUser read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GroupUser(
      id: fields[0] as int,
      name: fields[1] as String,
      created_at: fields[2] as String,
      updated_at: fields[3] as String,
      leader_name: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, GroupUser obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.created_at)
      ..writeByte(3)
      ..write(obj.updated_at)
      ..writeByte(4)
      ..write(obj.leader_name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GroupUser &&
          runtimeType == other.runtimeType &&
          typeId == other.id;
}
