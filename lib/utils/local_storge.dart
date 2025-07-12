import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user_entity.dart';

const spIsInitApp = "isInitApp";
const spToken = "token";
const spRefreshToken = "refresh_token";
const fcmToken = "fcmToken";
const spUserEntity = "userEntity";
const spConfigsEntity = "configsEntity";
const spLocal = 'spLocal';
const spSoftUpdateStorageKey = 'softUpdateVersion';

class SPUtils {
  factory SPUtils() => _getInstance();

  static SPUtils get instance => _getInstance();

  static SPUtils? _instance;

  SPUtils._internal();

  static SPUtils _getInstance() {
    _instance ??= SPUtils._internal();
    return _instance!;
  }

  late SharedPreferences prefs;

  Future<void> initSharePre() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<bool> setToken(String? token) async {
    if (token == null) {
      return await prefs.setString(spToken, '');
    }
    return await prefs.setString(spToken, token);
  }

  Future<bool> setRefreshToken(String? refreshToken) async {
    if (refreshToken == null) {
      return await prefs.setString(spToken, '');
    }
    return await prefs.setString(spRefreshToken, refreshToken);
  }

  String? getToken() {
    String? token = prefs.getString(spToken);
    if (token == '' || token == 'null') {
      token = null;
    }
    return token;
  }

  String? getRefreshToken() {
    String? refreshToken = prefs.getString(spRefreshToken);
    if (refreshToken == '' || refreshToken == 'null') {
      refreshToken = null;
    }
    return refreshToken;
  }

  Future<bool> setFcmToken(String? token) async {
    if (token == null) {
      return await prefs.setString(fcmToken, '');
    }
    return await prefs.setString(fcmToken, token);
  }

  String getFcmToken() {
    String? token = prefs.getString(fcmToken);
    if (token == '' || token == 'null') {
      token = null;
    }
    return token ?? '';
  }

  Future<bool> setUserEntity(User? userEntity) async {
    return await prefs.setString(
      spUserEntity,
      jsonEncode(userEntity),
    );
  }

  User? getUserEntity() {
    String? data = prefs.getString(spUserEntity);
    if (data != null && data != 'null') {
      Map<String, dynamic> responseJson = json.decode(data);
      return User.fromJson(responseJson);
    }
    return null;
  }


  Future<bool> removeUser() async {
    return await prefs.remove(spUserEntity);
  }

  String getUserName()  {
    User? user = getUserEntity();
    if (user != null && user.userName != null) {
      return user.userName!;
    }
    return '';
  }


  String getUserRole(){
    User? user = getUserEntity();
    if (user != null && user.roles != null) {
      return user.roles![0];
    }
    return 'لا يوجد';
  }

  bool getIsAdminUser(){
    User? user = getUserEntity();
    if (user != null && user.roles != null) {
      return user.isSuperAdmin ?? false;
    }
    return false;
  }


}