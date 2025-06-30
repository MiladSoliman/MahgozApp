

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/avaliableTime/reservedTime_entity.dart';

class DateConverter {


  String convertToIsoUtc(String date, String time) {
    // Combine date and time into full string like "2025-06-16 10:00"
    final dateTimeStr = '$date $time';

    // Parse to DateTime object
    final localDateTime = DateTime.parse(dateTimeStr.replaceFirst(' ', 'T'));

    // Convert to UTC
    final utcDateTime = localDateTime.toUtc();

    // Return ISO 8601 format with 'Z'
    return '${utcDateTime.toIso8601String()}Z';
  }




  Map<String, String> convertRangeToIso(String date, String timeRange) {
    // Split the time range: "08:00 - 10:00 AM"
    List<String> parts = timeRange.split(' - ');
    String fromTime = parts[0].trim(); // e.g., "08:00"
    String toTimeWithPeriod = parts[1].trim(); // e.g., "10:00 AM"

    // Get AM/PM and add it to fromTime if missing
    String period = toTimeWithPeriod.contains("AM") ? "AM" : "PM";
    if (!fromTime.contains("AM") && !fromTime.contains("PM")) {
      fromTime += " $period";
    }

    // Clean toTime
    String toTime = toTimeWithPeriod.replaceAll(RegExp(r'[^0-9:]'), '') + ' $period';

    // Use intl to parse to 24-hour
    final inputFormat = DateFormat.jm(); // parses 12-hour time like "08:00 AM"
    final outputFormat = DateFormat("HH:mm");

    String from24 = outputFormat.format(inputFormat.parse(fromTime));
    String to24 = outputFormat.format(inputFormat.parse(toTime));

    // Combine with date and format manually to ISO 8601 format (no timezone conversion)
    String fromIso = "${date}T$from24:00.000Z";
    String toIso = "${date}T$to24:00.000Z";

    return {
      'from': fromIso,
      'to': toIso,
    };
  }


// Helper function to convert 12-hour time to 24-hour format
  String _to24Hour(String time12h) {
    final time = TimeOfDayFormat.HH_colon_mm; // not used here, just for clarity
    final dateFormat = DateFormat.jm(); // parses "08:00 AM"
    final outputFormat = DateFormat("HH:mm");
    final dateTime = dateFormat.parse(time12h);
    return outputFormat.format(dateTime);
  }



  String convertIsoRangeTo24Hour(String? fromDateStr, String? toDateStr) {
    final DateTime fromDate = DateTime.parse(fromDateStr!);
    final DateTime toDate = DateTime.parse(toDateStr!);

    final DateFormat hourFormat = DateFormat('hh:mm');
    final DateFormat amPmFormat = DateFormat('a');

    final String from = hourFormat.format(fromDate);
    final String to = hourFormat.format(toDate);
    final String amPm = amPmFormat.format(toDate); // We use the end time's AM/PM

    return '$from - $to $amPm';
  }


  List<String> getFormattedReservationRanges(String date,List<ReservedTimeEntity> reservations) {
    final DateFormat hourFormat = DateFormat('hh:mm');

    final DateFormat amPmFormat = DateFormat('a');

    final selectedDate = DateTime.parse(date);

    print("the date is $date , today is $selectedDate");

    final filteredReservations = reservations.where((reservation) =>
    DateUtils.isSameDay(reservation.fromDate, selectedDate) ||
        DateUtils.isSameDay(reservation.toDate, selectedDate)
    ).toList();
    if (filteredReservations.isEmpty) {
      return [];
    }
    return filteredReservations.map((reservation) {
      final from = hourFormat.format(reservation.fromDate);
      final to = hourFormat.format(reservation.toDate);
      final amPm = amPmFormat.format(reservation.toDate); // assume toDate carries the period
      return '$from - $to $amPm';
    }).toList();
  }

}