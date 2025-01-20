// استيراد الموديل
part of 'wareList.dart';

class wareAdapter extends TypeAdapter<WareList> {
  @override
  final int typeId = 12; // يجب أن يتطابق مع typeId في الموديل

  @override
  WareList read(BinaryReader reader) {
    return WareList(
      id: reader.read(),
      listNo: reader.read(),
      customerName: reader.read(),
      note: reader.read(),
      createdAt: reader.read(),
      createdBy: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, WareList obj) {
    writer.write(obj.id);
    writer.write(obj.listNo);
    writer.write(obj.customerName);
    writer.write(obj.note);
    writer.write(obj.createdAt);
    writer.write(obj.createdBy);
  }
}
