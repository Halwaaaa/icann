part of 'ResponsesModels.dart';

class ResponsesModelsAdapter extends TypeAdapter<ResponsesModels> {
  @override
  final int typeId = 9;

  @override
  ResponsesModels read(BinaryReader reader) {
    return ResponsesModels(
      response: reader.readString(),
      createdAt: reader.readString(),
      delegateReading: reader.readInt(),
      customerReading: reader.readInt(),
      staffReading: reader.readInt(),
      centralReading: reader.readInt(),
      followBranchReading: reader.readInt(),
      createdBy: reader.readString(),
    );
  }

  @override
  void write(BinaryWriter writer, ResponsesModels obj) {
    writer.writeString(obj.response);
    writer.writeString(obj.createdAt);
    writer.writeInt(obj.delegateReading);
    writer.writeInt(obj.customerReading);
    writer.writeInt(obj.staffReading);
    writer.writeInt(obj.centralReading);
    writer.writeInt(obj.followBranchReading);
    writer.writeString(obj.createdBy);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ResponsesModelsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
