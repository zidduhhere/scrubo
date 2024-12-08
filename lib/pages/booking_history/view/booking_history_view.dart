import 'package:flutter/material.dart';
import 'package:scrubo/pages/booking_history/widgets/booking_container.dart';
import 'package:scrubo/pages/booking_history/widgets/custom_status_container.dart';
import 'package:scrubo/utils/constants/colors.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';
import 'package:scrubo/utils/widgets/containers/custom_rounded_containers.dart';
import 'package:scrubo/utils/widgets/custom_app_bar.dart';

enum BookingStatus { completed, pending, cancelled }

class BookingHistoryView extends StatelessWidget {
  const BookingHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TCustomNormalAppBar(
        profileIcon: true,
        title: 'Booking History',
        titlemsg: 'Welcome to',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TUiConstants.defaultSpacing),
          child: Column(
            children: [
              BookingHistoryContainer(
                status: BookingStatus.completed,
                date: '12th June 2021',
                orderNumber: '123456',
                serviceTime: '12:00 PM',
              ),
              BookingHistoryContainer(
                status: BookingStatus.cancelled,
                date: '12th June 2021',
                orderNumber: '123456',
                serviceTime: '12:00 PM',
              ),
              BookingHistoryContainer(
                status: BookingStatus.pending,
                date: '12th June 2021',
                orderNumber: '123456',
                serviceTime: '12:00 PM',
              )
            ],
          ),
        ),
      ),
    );
  }
}

class BookingHistoryContainer extends StatelessWidget {
  const BookingHistoryContainer({
    super.key,
    required this.status,
    required this.date,
    required this.orderNumber,
    required this.serviceTime,
  });

  final BookingStatus status;
  final String date;
  final String orderNumber;
  final String serviceTime;
  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      margin: const EdgeInsets.symmetric(vertical: TUiConstants.spaceBtwTexts),
      padding: const EdgeInsets.all(TUiConstants.m),
      backgroundColor: Colors.transparent,
      borderRadius: BorderRadius.circular(
        TUiConstants.borderRadiusLarge * 4,
      ),
      border: Border.all(
        color: TColors.lightSurfaceContainerHigh,
      ),
      child: Column(
        children: [
          BookingHistoryContainerStatus(
            status: status,
            date: date,
          ),
          const SizedBox(height: TUiConstants.defaultSpacing),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TBookingTagContainer(
                iconData: TUiConstants.iconTag,
                title: 'Order',
                val: orderNumber,
              ),
              TBookingTagContainer(
                iconData: TUiConstants.iconClock,
                title: 'Service Time',
                val: serviceTime,
              ),
            ],
          )
        ],
      ),
    );
  }
}
