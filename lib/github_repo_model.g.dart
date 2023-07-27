// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_repo_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GithubRepoAdapter extends TypeAdapter<GithubRepo> {
  @override
  final int typeId = 0;

  @override
  GithubRepo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GithubRepo(
      id: fields[0] as int,
      name: fields[1] as String,
      fullName: fields[2] as String,
      htmlUrl: fields[3] as String,
      description: fields[4] as String,
      fork: fields[5] as bool,
      url: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, GithubRepo obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.fullName)
      ..writeByte(3)
      ..write(obj.htmlUrl)
      ..writeByte(4)
      ..write(obj.description)
      ..writeByte(5)
      ..write(obj.fork)
      ..writeByte(6)
      ..write(obj.url);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GithubRepoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
