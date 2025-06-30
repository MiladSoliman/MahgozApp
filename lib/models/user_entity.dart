
import 'package:json_annotation/json_annotation.dart';
part 'user_entity.g.dart';

@JsonSerializable()
class User {
  final String? message;
  final String? userName;
  final String? email;
  final String? token;
  final String? userID;
  final List<String>? roles;
  final bool? isAuthenticated;
  final String? expiresOn;
  final bool? isSuperAdmin;
  final List<String>? permissionsList;

  User({
    this.message,
    this.userName,
    this.email,
    this.token,
    this.userID,
    this.roles,
    this.isAuthenticated,
    this.expiresOn,
    this.isSuperAdmin,
    this.permissionsList,
  });

  factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
