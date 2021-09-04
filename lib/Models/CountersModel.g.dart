// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CountersModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CountersModelsAdapter extends TypeAdapter<CountersModels> {
  @override
  final int typeId = 1;

  @override
  CountersModels read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CountersModels(
      number: fields[0] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, CountersModels obj) {
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
      other is CountersModelsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
