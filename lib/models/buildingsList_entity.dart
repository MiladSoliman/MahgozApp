import 'package:json_annotation/json_annotation.dart';

import 'building_entity.dart';
part 'buildingsList_entity.g.dart';

@JsonSerializable()
class Buildinggs {
  final List<Buildingg> buildings;

  Buildinggs({required this.buildings});

  factory Buildinggs.fromJson(Map<String, dynamic> json) =>
      _$BuildinggsFromJson(json);

  Map<String, dynamic> toJson() => _$BuildinggsToJson(this);
}
