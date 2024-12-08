import 'package:flutter/material.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';
import 'package:scrubo/utils/formatter/date_formatter.dart';
import 'package:scrubo/utils/widgets/cards/date_time_selection_tile.dart';
import 'package:scrubo/utils/widgets/headings/custom_row_header.dart';

class DateTimeSchedule extends StatelessWidget {
  const DateTimeSchedule({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomRowHeader(
            leadingText: 'Schedule Pickup', isTrailing: false),
        const SizedBox(height: TUiConstants.defaultSpacing),
        const Text(
          'Chose day and time in future you want your vehicle to be picked up',
        ),
        const SizedBox(height: TUiConstants.defaultSpacing),
        DateTimeSelectionTile(
          title: 'Date',
          subtitle: 'Novemeber 12, 2024',
          leadingIcon: TUiConstants.iconCalendar,
          onTap: () {
            showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime.now().add(const Duration(days: 7)),
            ).then((selectedDate) {
              if (selectedDate != null) {
                // ignore: unused_local_variable
                String formattedDate =
                    TDateFormatter.formatToTextDate(selectedDate);
                // ignore: avoid_print
                print(formattedDate);
              }
            });
          },
        ),
        const SizedBox(height: TUiConstants.defaultSpacing),
        DateTimeSelectionTile(
          title: 'Time',
          subtitle: '12:30 AM',
          leadingIcon: TUiConstants.iconClock,
          onTap: () {
            showTimePicker(
              context: context, initialTime: TimeOfDay.now(),
              confirmText: 'Select', cancelText: 'Cancel',

              // ignore: avoid_print
            ).then((selectedTime) {
              if (selectedTime != null) {
                // ignore: unused_local_variable
                String formattedTime =
                    TDateFormatter.formatToTextTime(selectedTime);
                // ignore: avoid_print
                print(formattedTime);
              }
            });
          },
        )
      ],
    );
  }
}
