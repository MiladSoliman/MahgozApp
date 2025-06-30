// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      message: json['message'] as String?,
      userName: json['userName'] as String?,
      email: json['email'] as String?,
      token: json['token'] as String?,
      userID: json['userID'] as String?,
      roles:
          (json['roles'] as List<dynamic>?)?.map((e) => e as String).toList(),
      isAuthenticated: json['isAuthenticated'] as bool?,
      expiresOn: json['expiresOn'] as String?,
      isSuperAdmin: json['isSuperAdmin'] as bool?,
      permissionsList: (json['permissionsList'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'message': instance.message,
      'userName': instance.userName,
      'email': instance.email,
      'token': instance.token,
      'userID': instance.userID,
      'roles': instance.roles,
      'isAuthenticated': instance.isAuthenticated,
      'expiresOn': instance.expiresOn,
      'isSuperAdmin': instance.isSuperAdmin,
      'permissionsList': instance.permissionsList,
    };
