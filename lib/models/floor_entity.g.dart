// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'floor_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Floor _$FloorFromJson(Map<String, dynamic> json) => Floor(
      id: json['id'] as String,
      name: json['name'] as String,
      rooms: (json['rooms'] as List<dynamic>)
          .map((e) => Room.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FloorToJson(Floor instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'rooms': instance.rooms,
    };
