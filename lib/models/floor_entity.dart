import 'package:json_annotation/json_annotation.dart';
import 'room_entity.dart';

part 'floor_entity.g.dart';

@JsonSerializable()
class Floor {
  final String id;
  final String name;
  final List<Room> rooms;

  Floor({
    required this.id,
    required this.name,
    required this.rooms,
  });

  factory Floor.fromJson(Map<String, dynamic> json) => _$FloorFromJson(json);

  Map<String, dynamic> toJson() => _$FloorToJson(this);
}
