import 'package:json_annotation/json_annotation.dart';

part 'room_entity.g.dart';

@JsonSerializable()
class Room {
  final String id;
  final String name;
  final int capacity;

  Room({
    required this.id,
    required this.name,
    required this.capacity,
  });

  factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);

  Map<String, dynamic> toJson() => _$RoomToJson(this);
}
