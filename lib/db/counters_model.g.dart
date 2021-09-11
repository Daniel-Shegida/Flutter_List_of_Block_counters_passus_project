// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counters_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CounterModelAdapter extends TypeAdapter<CounterModel> {
  @override
  final int typeId = 0;

  @override
  CounterModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CounterModel(
      fields[0] as int,
    );
  }

  @override
  void write(BinaryWriter writer, CounterModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.countNumber);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CounterModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
