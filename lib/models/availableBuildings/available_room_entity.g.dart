// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'available_room_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AvailableRoom _$AvailableRoomFromJson(Map<String, dynamic> json) =>
    AvailableRoom(
      roomId: json['roomId'] as String,
      roomName: json['roomName'] as String,
      capacity: (json['capacity'] as num).toInt(),
    );

Map<String, dynamic> _$AvailableRoomToJson(AvailableRoom instance) =>
    <String, dynamic>{
      'roomId': instance.roomId,
      'roomName': instance.roomName,
      'capacity': instance.capacity,
    };
