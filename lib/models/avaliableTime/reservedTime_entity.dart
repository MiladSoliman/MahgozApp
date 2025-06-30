import 'package:json_annotation/json_annotation.dart';

part 'reservedTime_entity.g.dart';

@JsonSerializable()
class ReservedTimeEntity {
  final String reservationId;
  final String roomId;
  final String roomName;
  final DateTime fromDate;
  final DateTime toDate;
  final String reservedBy;

  ReservedTimeEntity({
    required this.reservationId,
    required this.roomId,
    required this.roomName,
    required this.fromDate,
    required this.toDate,
    required this.reservedBy,
  });

  factory ReservedTimeEntity.fromJson(Map<String, dynamic> json) =>
      _$ReservedTimeEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ReservedTimeEntityToJson(this);
}
