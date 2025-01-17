part of 'LeaderModels.dart';

class LeaderModelsAdapter extends TypeAdapter<LeaderModels> {
  @override
  final int typeId = 11;

  @override
  LeaderModels read(BinaryReader reader) {
    return LeaderModels(
      id: reader.readInt(),
      name: reader.readString(),
      mobileNo: reader.readString(),
      createdAt: reader.readString(),
      groupName: reader.readString(),
    );
  }

  @override
  void write(BinaryWriter writer, LeaderModels obj) {
    writer.writeInt(obj.id);
    writer.writeString(obj.name);
    writer.writeString(obj.mobileNo);
    writer.writeString(obj.createdAt);
    writer.writeString(obj.groupName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LeaderModelsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
