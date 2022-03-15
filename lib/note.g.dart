// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NoteAdapter extends TypeAdapter<Note> {
  @override
  final int typeId = 0;

  @override
  Note read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Note(
      fullName: fields[0] as String,
      gender: fields[3] as String,
      location: fields[4] as String,
      region: fields[1] as String,
      phoneNumber: fields[2] as String,
      accountType: fields[7] as String,
      email: fields[6] as String,
      farmLand: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Note obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.fullName)
      ..writeByte(1)
      ..write(obj.region)
      ..writeByte(2)
      ..write(obj.phoneNumber)
      ..writeByte(3)
      ..write(obj.gender)
      ..writeByte(4)
      ..write(obj.location)
      ..writeByte(5)
      ..write(obj.farmLand)
      ..writeByte(6)
      ..write(obj.email)
      ..writeByte(7)
      ..write(obj.accountType);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NoteAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
