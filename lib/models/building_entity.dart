/*
class Buildinggs {
  final List<dynamic> buildings;
  Buildinggs(this.buildings);

  factory Buildinggs.fromJson(Map<String,dynamic> jsonData) {
    return Buildinggs(jsonData['buildingss']);
  }

}



class Buildingg {
  final String id;
  final String name;
  final String address;
  final List<Floor> floors;

  Buildingg({
    required this.id,
    required this.name,
    required this.address,
    required this.floors,
  });

  factory Buildingg.fromJson(Map<String, dynamic> json) {
    return Buildingg(
      id: json['id'],
      name: json['name'],
      address: json['address'],
      floors: (json['floors'] as List)
          .map((floorJson) => Floor.fromJson(floorJson))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'address': address,
      'floors': floors.map((floor) => floor.toJson()).toList(),
    };
  }
}

class Floor {
  final String id;
  final String name;
  final List<Room> rooms;

  Floor({
    required this.id,
    required this.name,
    required this.rooms,
  });

  factory Floor.fromJson(Map<String, dynamic> json) {
    return Floor(
      id: json['id'],
      name: json['name'],
      rooms: (json['rooms'] as List)
          .map((roomJson) => Room.fromJson(roomJson))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'rooms': rooms.map((room) => room.toJson()).toList(),
    };
  }
}

class Room {
  final String id;
  final String name;
  final int capacity;

  Room({
    required this.id,
    required this.name,
    required this.capacity,
  });

  factory Room.fromJson(Map<String, dynamic> json) {
    return Room(
      id: json['id'],
      name: json['name'],
      capacity: json['capacity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'capacity': capacity,
    };
  }
}
*/

import 'package:json_annotation/json_annotation.dart';
import 'floor_entity.dart';

part 'building_entity.g.dart';



@JsonSerializable()
class Buildingg {
  final String id;
  final String name;
  final String address;
  final List<Floor> floors;

  Buildingg({
    required this.id,
    required this.name,
    required this.address,
    required this.floors,
  });

  factory Buildingg.fromJson(Map<String, dynamic> json) =>
      _$BuildinggFromJson(json);

  Map<String, dynamic> toJson() => _$BuildinggToJson(this);
}
