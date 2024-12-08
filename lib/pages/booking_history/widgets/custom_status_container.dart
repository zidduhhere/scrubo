import 'package:flutter/material.dart';
import 'package:scrubo/pages/booking_history/view/booking_history_view.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';
import 'package:scrubo/utils/widgets/headings/custom_title_text_widget.dart';

class BookingHistoryContainerStatus extends StatelessWidget {
  const BookingHistoryContainerStatus({
    super.key,
    required this.status,
    required this.date,
  });
  final BookingStatus status;
  final String date;

  @override
  Widget build(BuildContext context) {
    Map<BookingStatus, IconData> statusIcon = {
      BookingStatus.completed: TUiConstants.iconCompleted,
      BookingStatus.pending: TUiConstants.iconPending,
      BookingStatus.cancelled: TUiConstants.iconCancelled
    };
    Map<BookingStatus, String> statusText = {
      BookingStatus.completed: 'Completed',
      BookingStatus.pending: 'Pending',
      BookingStatus.cancelled: 'Cancelled'
    };

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(statusIcon[status] ?? TUiConstants.iconUnknown),
            const SizedBox(width: TUiConstants.s),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TBookingHistoryTitleText(
                    text: statusText[status] ?? 'Unknown', isSmall: true),
                TBookingHistoryTitleText(text: date, isSmall: false)
              ],
            ),
          ],
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(TUiConstants.iconArrowRight),
        )
      ],
    );
  }
}
