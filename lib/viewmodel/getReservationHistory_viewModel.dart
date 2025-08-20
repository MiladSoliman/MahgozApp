import 'package:flutter/cupertino.dart';

import 'package:minamakram/domin/getReservationHistoryUseCase.dart';
import 'package:minamakram/models/avaliableTime/reservedTime_entity.dart';

import 'package:provider/provider.dart';

import '../state/ReservationHistoryProvider.dart';

class GetReservationHistoryViewmodel {
  late GetReservationHistoryUseCase _getReservationHistoryUseCase;

  GetReservationHistoryViewmodel() {
    _getReservationHistoryUseCase = GetReservationHistoryUseCaseImpl();
  }

  Future<List<ReservedTimeEntity>> getReservationHistory(String userId) async {
    return await _getReservationHistoryUseCase.getReservationHistory(userId);
  }
}

class GetAvailableDateController {
  GetAvailableDateController();

  List<ReservedTimeEntity> reservationHistory = [];

  final GetReservationHistoryViewmodel viewmodel =
      GetReservationHistoryViewmodel();

  void setReservationHistory(List<ReservedTimeEntity>? reservationHistory) {
    this.reservationHistory = reservationHistory!;
  }

  Future getReservationHistory(BuildContext context, String? userId) async {
    final ReservationHistoryProvider reservationHistory =
        Provider.of(context, listen: false);
    try {
      final buildingsList = await viewmodel.getReservationHistory(userId!);
      reservationHistory.setTimesList(buildingsList);
    } catch (e) {
      print(e);
    }
  }
}
