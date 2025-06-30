// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'available_floor_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AvailableFloor _$AvailableFloorFromJson(Map<String, dynamic> json) =>
    AvailableFloor(
      floorId: json['floorId'] as String,
      floorName: json['floorName'] as String,
      rooms: (json['rooms'] as List<dynamic>)
          .map((e) => AvailableRoom.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AvailableFloorToJson(AvailableFloor instance) =>
    <String, dynamic>{
      'floorId': instance.floorId,
      'floorName': instance.floorName,
      'rooms': instance.rooms,
    };
