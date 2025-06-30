// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Room _$RoomFromJson(Map<String, dynamic> json) => Room(
      id: json['id'] as String,
      name: json['name'] as String,
      capacity: (json['capacity'] as num).toInt(),
    );

Map<String, dynamic> _$RoomToJson(Room instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'capacity': instance.capacity,
    };
