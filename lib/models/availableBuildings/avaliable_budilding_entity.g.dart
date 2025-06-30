// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'avaliable_budilding_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AvaliableBuilding _$AvaliableBuildingFromJson(Map<String, dynamic> json) =>
    AvaliableBuilding(
      buildingId: json['buildingId'] as String,
      buildingName: json['buildingName'] as String,
      floors: (json['floors'] as List<dynamic>)
          .map((e) => AvailableFloor.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AvaliableBuildingToJson(AvaliableBuilding instance) =>
    <String, dynamic>{
      'buildingId': instance.buildingId,
      'buildingName': instance.buildingName,
      'floors': instance.floors,
    };
