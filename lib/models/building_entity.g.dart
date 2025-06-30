// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'building_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Buildingg _$BuildinggFromJson(Map<String, dynamic> json) => Buildingg(
      id: json['id'] as String,
      name: json['name'] as String,
      address: json['address'] as String,
      floors: (json['floors'] as List<dynamic>)
          .map((e) => Floor.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BuildinggToJson(Buildingg instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'floors': instance.floors,
    };
