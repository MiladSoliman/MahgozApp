import 'package:flutter/cupertino.dart';
import 'package:minamakram/domin/getAvaliableDates_useCase.dart';
import 'package:minamakram/models/avaliableTime/reservedTime_entity.dart';
import 'package:minamakram/state/avaliable_time_state.dart';
import 'package:minamakram/utils/date_converter.dart';
import 'package:provider/provider.dart';

class GetAvailableDatesViewmodel {
  late GetAvailableDatesUseCase _getAvailableDatesUseCase;
  GetAvailableDatesViewmodel() {
    _getAvailableDatesUseCase = GetAvailableDatesUseCaseImpl();
  }

  Future<List<ReservedTimeEntity>> getBuildingsByDate(String roomId) async {
    return await _getAvailableDatesUseCase.getAvailableDates(roomId);
  }

  // Remove reserved timings from available
  List<String> getRemainingAvailableTimings(
     String date,
    List<String> staticTimings,
    List<ReservedTimeEntity> reservations,
  ) {
    final reserved =
        DateConverter().getFormattedReservationRanges(date,reservations);

    return staticTimings.where((time) => !reserved.contains(time)).toList();
  }
}



class GetAvailableDateController {
  GetAvailableDateController();

  List<ReservedTimeEntity> reservedTimes = [];

  final GetAvailableDatesViewmodel viewmodel = GetAvailableDatesViewmodel();

  void setAvailableBuildings(List<ReservedTimeEntity>? reservedTimes) {
    this.reservedTimes = reservedTimes!;
  }

  Future getAvailableTimes(
      BuildContext context, String? roomId) async {
    final AvailableTimesProvider timesProvider =
    Provider.of(context, listen: false);
    try {
      final buildingsList =
      await viewmodel.getBuildingsByDate(roomId!);
      timesProvider.setTimesList(buildingsList);
    } catch (e) {
      print(e);
    }
  }
}
