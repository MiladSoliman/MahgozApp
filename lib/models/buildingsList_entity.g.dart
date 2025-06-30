// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buildingsList_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Buildinggs _$BuildinggsFromJson(Map<String, dynamic> json) => Buildinggs(
      buildings: (json['buildings'] as List<dynamic>)
          .map((e) => Buildingg.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BuildinggsToJson(Buildinggs instance) =>
    <String, dynamic>{
      'buildings': instance.buildings,
    };
