import 'package:json_annotation/json_annotation.dart';

part 'available_room_entity.g.dart';

@JsonSerializable()
class AvailableRoom {
  final String roomId;
  final String roomName;
  final int capacity;

  AvailableRoom({
    required this.roomId,
    required this.roomName,
    required this.capacity,
  });

  factory AvailableRoom.fromJson(Map<String, dynamic> json) => _$AvailableRoomFromJson(json);
  Map<String, dynamic> toJson() => _$AvailableRoomToJson(this);
}
