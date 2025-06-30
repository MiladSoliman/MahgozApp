import 'package:json_annotation/json_annotation.dart';
import 'package:minamakram/models/availableBuildings/available_room_entity.dart';

part 'available_floor_entity.g.dart';

@JsonSerializable()
class AvailableFloor {
  final String floorId;
  final String floorName;
  final List<AvailableRoom> rooms;

  AvailableFloor({
    required this.floorId,
    required this.floorName,
    required this.rooms,
  });

  factory AvailableFloor.fromJson(Map<String, dynamic> json) => _$AvailableFloorFromJson(json);
  Map<String, dynamic> toJson() => _$AvailableFloorToJson(this);
}
