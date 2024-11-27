// controllers/booking_history_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';

class BookingHistoryController extends GetxController {
  RxList<ServiceHistory> bookings = <ServiceHistory>[].obs;
  RxMap<String, bool> expandedCards = <String, bool>{}.obs;
  RxBool isLoading = true.obs;
  RxBool isRefreshing = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadBookings();
  }

  void loadBookings() {
    // Simulated API call
    bookings.value = [
      ServiceHistory(
          id: '1',
          serviceName: 'Premium Car Wash',
          date: '12 Mar 2024',
          vehicleName: 'BMW X5',
          vehicleNumber: 'KL 01 AB 1234',
          shop: Shop(
              name: 'AutoGTG Services', address: 'Downtown, NY', rating: 4.8),
          mechanic: Mechanic(
              name: 'John Doe',
              specialization: 'Senior Technician',
              rating: 4.9),
          rating: 4.8,
          services: [
            Service(name: 'Exterior Wash', duration: '30 mins', price: 299),
            Service(name: 'Interior Cleaning', duration: '45 mins', price: 399),
          ],
          products: [
            Product(name: 'Car Shampoo', price: 299, quantity: 1),
            Product(name: 'Dashboard Polish', price: 199, quantity: 1),
          ],
          feedback:
              'Vehicle in good condition. Regular maintenance recommended.',
          status: 'Completed'),
      // Add more bookings...
    ];
    isLoading.value = false;
  }

  Future<void> refreshBookings() async {
    isRefreshing.value = true;
    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));
    loadBookings();
    isRefreshing.value = false;
  }

  void toggleExpanded(String id) {
    expandedCards[id] = !(expandedCards[id] ?? false);
    update();
  }
}

// widgets/booking_card/t_booking_card.dart
class TBookingCard extends GetView<BookingHistoryController> {
  final ServiceHistory booking;

  const TBookingCard({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: const EdgeInsets.only(bottom: TUiConstants.defaultSpacing),
        child: TweenAnimationBuilder<double>(
          duration: const Duration(milliseconds: 500),
          tween: Tween(begin: 0, end: 1),
          builder: (context, value, child) {
            return Transform.scale(
              scale: value,
              child: child,
            );
          },
          child: Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(TUiConstants.borderRadiusLarge),
              side: BorderSide(
                color: Theme.of(context).colorScheme.outline.withOpacity(0.1),
              ),
            ),
            child: Column(
              children: [
                TServiceHeader(booking: booking),
                GetBuilder<BookingHistoryController>(builder: (_) {
                  final isExpanded =
                      controller.expandedCards[booking.id] ?? false;
                  return Column(
                    children: [
                      if (isExpanded) ...[
                        TServicesList(services: booking.services),
                        TProductsList(products: booking.products),
                        TMechanicDetails(mechanic: booking.mechanic),
                        TFeedbackSection(feedback: booking.feedback),
                      ],
                      TExpandButton(
                        isExpanded: isExpanded,
                        onTap: () => controller.toggleExpanded(booking.id),
                      ),
                    ],
                  );
                }),
              ],
            ),
          ),
        ));
  }
}

// widgets/booking_card/components/t_service_header.dart
class TServiceHeader extends StatelessWidget {
  final ServiceHistory booking;

  const TServiceHeader({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(TUiConstants.defaultSpacing),
      child: Row(
        children: [
          const TServiceIcon(icon: TUiConstants.iconCar),
          const SizedBox(width: TUiConstants.defaultSpacing),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  booking.serviceName,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 18.0,
                      ),
                ),
                const SizedBox(height: TUiConstants.paddingSmall),
                Text(
                  '${booking.vehicleName} • ${booking.vehicleNumber}',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.outline,
                      ),
                ),
              ],
            ),
          ),
          TRatingBadge(rating: booking.rating),
        ],
      ),
    );
  }
}

class TServiceIcon extends StatelessWidget {
  final IconData icon;

  const TServiceIcon({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(TUiConstants.paddingMedium),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(TUiConstants.borderRadiusMedium),
      ),
      child: Icon(
        icon,
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}

class TRatingBadge extends StatelessWidget {
  final double rating;

  const TRatingBadge({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: TUiConstants.paddingSmall,
        vertical: TUiConstants.paddingSmall,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(TUiConstants.borderRadiusMedium),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.star_rounded,
            size: 16,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(width: 4),
          Text(
            rating.toStringAsFixed(1),
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
        ],
      ),
    );
  }
}

// Component widgets for booking card
class TServicesList extends StatelessWidget {
  final List<Service> services;

  const TServicesList({super.key, required this.services});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(TUiConstants.defaultSpacing),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Services', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: TUiConstants.paddingSmall),
          ...services.map((service) => ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(service.name),
                subtitle: Text(service.duration),
                trailing: Text('₹${service.price}'),
              )),
        ],
      ),
    );
  }
}

class TProductsList extends StatelessWidget {
  final List<Product> products;

  const TProductsList({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(TUiConstants.defaultSpacing),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Products Used', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: TUiConstants.paddingSmall),
          ...products.map((product) => ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(product.name),
                subtitle: Text('Qty: ${product.quantity}'),
                trailing: Text('₹${product.price}'),
              )),
        ],
      ),
    );
  }
}

class TMechanicDetails extends StatelessWidget {
  final Mechanic mechanic;

  const TMechanicDetails({super.key, required this.mechanic});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(TUiConstants.defaultSpacing),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Mechanic', style: Theme.of(context).textTheme.titleMedium),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(mechanic.name),
            subtitle: Text(mechanic.specialization),
            trailing: TRatingBadge(rating: mechanic.rating),
          ),
        ],
      ),
    );
  }
}

class TFeedbackSection extends StatelessWidget {
  final String feedback;

  const TFeedbackSection({super.key, required this.feedback});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(TUiConstants.defaultSpacing),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Feedback', style: Theme.of(context).textTheme.bodyLarge),
          const SizedBox(height: TUiConstants.paddingSmall),
          Text(feedback),
        ],
      ),
    );
  }
}

class TExpandButton extends StatelessWidget {
  final bool isExpanded;
  final VoidCallback onTap;

  const TExpandButton({
    super.key,
    required this.isExpanded,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(TUiConstants.paddingMedium),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isExpanded ? 'Show Less' : 'Show More',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            Icon(
              isExpanded ? Icons.expand_less : Icons.expand_more,
              color: Theme.of(context).colorScheme.primary,
            ),
          ],
        ),
      ),
    );
  }
}

// Usage in booking_history_view.dart
class BookingHistoryView extends GetView<BookingHistoryController> {
  const BookingHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    BookingHistoryController controller = Get.put(BookingHistoryController());
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: controller.refreshBookings,
        backgroundColor: Theme.of(context).colorScheme.surface,
        color: Theme.of(context).colorScheme.primary,
        displacement: TUiConstants.defaultSpacing * 2,
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(), // Enable overscroll
          slivers: [
            SliverAppBar(
              title: Text(
                'Service History',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              pinned: true,
              floating: true,
            ),
            Obx(() {
              if (controller.isLoading.value) {
                return const SliverFillRemaining(
                  child: Center(child: CircularProgressIndicator()),
                );
              }

              return SliverPadding(
                padding: const EdgeInsets.all(TUiConstants.defaultSpacing),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final booking = controller.bookings[index];
                      return TBookingCard(
                        booking: booking,
                      );
                    },
                    childCount: controller.bookings.length,
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

class ServiceHistory {
  final String id;
  final String serviceName;
  final String date;
  final String vehicleName;
  final String vehicleNumber;
  final Shop shop;
  final Mechanic mechanic;
  final double rating;
  final List<Service> services;
  final List<Product> products;
  final String feedback;
  final String status;

  ServiceHistory({
    required this.id,
    required this.serviceName,
    required this.date,
    required this.vehicleName,
    required this.vehicleNumber,
    required this.shop,
    required this.mechanic,
    required this.rating,
    required this.services,
    required this.products,
    required this.feedback,
    required this.status,
  });
}

class Shop {
  final String name;
  final String address;
  final double rating;
  Shop({required this.name, required this.address, required this.rating});
}

class Mechanic {
  final String name;
  final String specialization;
  final double rating;
  Mechanic(
      {required this.name, required this.specialization, required this.rating});
}

class Service {
  final String name;
  final String duration;
  final double price;
  Service({required this.name, required this.duration, required this.price});
}

class Product {
  final String name;
  final double price;
  final int quantity;
  Product({required this.name, required this.price, required this.quantity});
}
