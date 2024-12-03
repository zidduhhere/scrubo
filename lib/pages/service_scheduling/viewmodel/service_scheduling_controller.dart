import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServiceSchedulingController extends GetxController {
  // Service Details
  final String serviceTitle = "Full Car Wash";
  final String serviceDescription = "Premium car wash service";
  final double price = 200.0;

  // Observable States
  Rx<DateTime> selectedDate = DateTime.now().obs;
  Rx<TimeOfDay> selectedTime = TimeOfDay.now().obs;
  RxString selectedVehicle = "".obs;

  // Date Time Logic
  List<DateTime> get availableDates {
    return List.generate(
        7, (index) => DateTime.now().add(Duration(days: index)));
  }

  List<TimeOfDay> get availableTimes {
    return List.generate(12, (index) => TimeOfDay(hour: 9 + index, minute: 0));
  }

  String getWeekDay(DateTime date) {
    return ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'][date.weekday % 7];
  }

  String formatTime(TimeOfDay time) {
    return '${time.hour}:${time.minute.toString().padLeft(2, '0')}';
  }

  bool isDateSelected(DateTime date) {
    return selectedDate.value.day == date.day &&
        selectedDate.value.month == date.month;
  }

  bool isTimeSelected(TimeOfDay time) {
    return selectedTime.value.hour == time.hour &&
        selectedTime.value.minute == time.minute;
  }

  void selectDate(DateTime date) {
    selectedDate.value = date;
  }

  void selectTime(TimeOfDay time) {
    selectedTime.value = time;
  }

  String get formattedScheduleTime {
    return '${getWeekDay(selectedDate.value)}, '
        '${selectedDate.value.day} '
        '${formatTime(selectedTime.value)}';
  }

  void changeService() {
    Get.back(); // Navigate back to service selection
  }

  void scheduleService() {
    Get.snackbar(
      'Success',
      'Service scheduled for $formattedScheduleTime',
      backgroundColor: Get.theme.colorScheme.primaryContainer,
    );
  }
}
