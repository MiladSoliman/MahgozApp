// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservedTime_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReservedTimeEntity _$ReservedTimeEntityFromJson(Map<String, dynamic> json) =>
    ReservedTimeEntity(
      reservationId: json['reservationId'] as String,
      roomId: json['roomId'] as String,
      roomName: json['roomName'] as String,
      fromDate: DateTime.parse(json['fromDate'] as String),
      toDate: DateTime.parse(json['toDate'] as String),
      reservedBy: json['reservedBy'] as String,
    );

Map<String, dynamic> _$ReservedTimeEntityToJson(ReservedTimeEntity instance) =>
    <String, dynamic>{
      'reservationId': instance.reservationId,
      'roomId': instance.roomId,
      'roomName': instance.roomName,
      'fromDate': instance.fromDate.toIso8601String(),
      'toDate': instance.toDate.toIso8601String(),
      'reservedBy': instance.reservedBy,
    };
