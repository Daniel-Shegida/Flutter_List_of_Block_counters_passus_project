// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'NoteModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NoteModelsAdapter extends TypeAdapter<NoteModels> {
  @override
  final int typeId = 1;

  @override
  NoteModels read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NoteModels(
      number: fields[0] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, NoteModels obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.number);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NoteModelsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
