// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_list_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CheckListAdapter extends TypeAdapter<CheckList> {
  @override
  final int typeId = 0;

  @override
  CheckList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CheckList(
      checkListName: fields[0] as String?,
      place: fields[1] as String?,
      checkListDate: fields[2] as String?,
      isChecked: fields[3] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, CheckList obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.checkListName)
      ..writeByte(1)
      ..write(obj.place)
      ..writeByte(2)
      ..write(obj.checkListDate)
      ..writeByte(3)
      ..write(obj.isChecked);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CheckListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
