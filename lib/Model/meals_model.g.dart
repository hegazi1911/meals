// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meals_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MealModelAdapter extends TypeAdapter<MealModel> {
  @override
  final int typeId = 0;

  @override
  MealModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MealModel(
      strMeal: fields[0] as String?,
      strMealThumb: fields[1] as String?,
      idMeal: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, MealModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.strMeal)
      ..writeByte(1)
      ..write(obj.strMealThumb)
      ..writeByte(2)
      ..write(obj.idMeal);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MealModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
