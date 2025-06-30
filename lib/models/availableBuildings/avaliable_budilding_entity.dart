


import 'package:json_annotation/json_annotation.dart';
import 'package:minamakram/models/availableBuildings/available_floor_entity.dart';

part 'avaliable_budilding_entity.g.dart';

@JsonSerializable()
class AvaliableBuilding {
  final String buildingId;
  final String buildingName;
  final List<AvailableFloor> floors;

  AvaliableBuilding({
    required this.buildingId,
    required this.buildingName,
    required this.floors,
  });

  factory AvaliableBuilding.fromJson(Map<String, dynamic> json) =>
      _$AvaliableBuildingFromJson(json);
  Map<String, dynamic> toJson() => _$AvaliableBuildingToJson(this);
}
