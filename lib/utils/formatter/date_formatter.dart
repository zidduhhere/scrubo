import 'package:flutter/material.dart';

class TDateFormatter {
  TDateFormatter._();

  static const List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  static const List<String> days = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];

  static String format(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  static String formatTime(DateTime date) {
    return '${date.hour}:${date.minute}';
  }

  static String formatDateTime(DateTime date) {
    return '${format(date)} ${formatTime(date)}';
  }

  static String formatToTextDate(DateTime dateTime) {
    final String month = months[dateTime.month - 1];
    final String date = dateTime.day.toString();
    final String year = dateTime.year.toString();
    return '$month $date, $year';
  }

  static String formatToTextTime(TimeOfDay time) {
    final String hour = time.hour.toString();
    final String minute = time.minute.toString();
    return '$hour:$minute ${time.period == DayPeriod.am ? 'AM' : 'PM'}';
  }
}
