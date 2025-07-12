


import 'package:dio/dio.dart';
import 'package:minamakram/constants/api.dart';
import 'package:minamakram/models/avaliableTime/reservedTime_entity.dart';
import 'package:minamakram/models/user_entity.dart';

import '../models/availableBuildings/avaliable_budilding_entity.dart';
import '../models/building_entity.dart';

class MahgozApi {
  final _dio = Dio(BaseOptions(
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
  ));

  Future<User?> login(String email, String password) async {
    try {
      final response = await _dio.post(
        Api.login,
        data: {
          "email": email,
          "password": password,
        },
      );
      if (response.statusCode == 200) {
        return User.fromJson(response.data['data']);
      } else {
        return null;
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        throw Exception('Login failed: Timeout');
      }
      print('Login failed: $e');
      throw Exception('Login failed: $e');
    } catch (e) {
      print('Login failed: $e');
      throw Exception('Login failed: $e');
    }
  }




  Future<List<Buildingg>> getAllBuildings() async {
       try {
         final response = await _dio.get(Api.getAllBuildings);
         if (response.statusCode == 200) {
           final List<dynamic> data = response.data;
           return data.map((json) => Buildingg.fromJson(json)).toList();
         }else {
           return [];
         }
       }catch(e){
         print("the errror is ${e}");
         Future.error(e);
         return Future.error(e);
       }
  }


  Future<List<AvaliableBuilding>> getAvailableBuildingsByDate(
      String fromDate,
      String toDate
      ) async {
    try {
      final response = await _dio.get(Api.getAvailableBuildingsByDates,
        queryParameters :{
          "fromDate":fromDate,
          "toDate": toDate,
        },
      );
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((json) => AvaliableBuilding.fromJson(json)).toList();
      }else {
        return [];
      }
    }catch(e){
      print("the errror is ${e}");
      Future.error(e);
      return Future.error(e);
    }
  }


  Future<String> addReservation(
      String hallId,
      String fromDate,
      String toDate,
      String serviceName,
  ) async {
    try {
      final response = await _dio.post(Api.addReservation, data: {
        "roomId": hallId,
        "fromDate": fromDate,
        "toDate": toDate,
        "reservedBy": serviceName,
      });
      if (response.statusCode == 200) {
        print('Reservation Sucess: ${response.data}');
        return response.data.toString();
      } else {
        return 'Error: ${response.statusMessage}';
      }
    } catch (e) {
      print('Reservation failed: $e');
      Future.error(e);
      return Future.error('Reservation failed: $e');
    }
  }


  Future<List<ReservedTimeEntity>> getAvailableDates(
      String roomId,
      ) async {
    try {
      final response = await _dio.get(Api.getAvailableDates,
        queryParameters: {
          "roomId": roomId,
        },
      );
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((json) => ReservedTimeEntity.fromJson(json)).toList();
      } else {
        return [];
      }
    } catch (e) {
      print("the errror is ${e}");
      Future.error(e);
      return Future.error(e);
    }
  }



}