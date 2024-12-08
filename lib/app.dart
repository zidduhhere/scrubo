import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:scrubo/navigation_bar.dart';
import 'package:scrubo/pages/authentication/login/view/login_view.dart';
import 'package:scrubo/pages/authentication/onboarding/view/onboarding_view.dart';
import 'package:scrubo/pages/authentication/signup/view/signup_view.dart';
import 'package:scrubo/pages/authentication/signup/view/verified_view.dart';
import 'package:scrubo/pages/authentication/signup/view/verify_view.dart';
import 'package:scrubo/pages/booking_history/view/booking_history_view.dart';
import 'package:scrubo/pages/categories/view/sub_categories_view.dart';
import 'package:scrubo/pages/home/view/dynamic_location_view.dart';
import 'package:scrubo/pages/home/view/home_view.dart';
import 'package:scrubo/pages/personalization/address/add_new_address_view.dart';
import 'package:scrubo/pages/personalization/address/address_view.dart';
import 'package:scrubo/pages/personalization/profile/profile_view.dart';
import 'package:scrubo/pages/ratings_reviews/view/ratings_reviews_view.dart';
import 'package:scrubo/pages/service_details/view/service_details_view.dart';
import 'package:scrubo/pages/service_scheduling/view/service_scheduling_view.dart';
import 'package:scrubo/pages/services/view/services_view.dart';
import 'package:scrubo/utils/device/device_utility.dart';
import 'package:scrubo/utils/theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    TDeviceUtility.setPotrait(context);
    return GetMaterialApp(
      getPages: [
        GetPage(name: '/', page: () => const OnboardingView()),
        GetPage(name: '/signup', page: () => const SignupView()),
        GetPage(name: '/login', page: () => const LoginView()),
        GetPage(name: '/home', page: () => const HomeView()),
        GetPage(name: '/navigation', page: () => const NavigationMenu()),
        GetPage(name: '/signup/verify', page: () => const VerifyView()),
        GetPage(
            name: '/signup/verify/verified', page: () => const VerifiedView()),
        GetPage(
            name: '/serviceDetails', page: () => const ServiceDetailsView()),
        GetPage(
            name: '/serviceDetails/reviews',
            page: () => const ProdcutReviewView()),
        GetPage(
            name: '/bookinghistory', page: () => const BookingHistoryView()),
        GetPage(name: '/schedule', page: () => const ServiceSchedulingView()),
        GetPage(name: '/services', page: () => const ServicesView()),
        GetPage(name: '/profile', page: () => const ProfileView()),
        GetPage(name: '/profile/address', page: () => const UserAddressView()),
        GetPage(
            name: '/profile/address/add',
            page: () => const AddNewAddressView()),
        GetPage(
            name: '/home/dynamicLocation',
            page: () => const DynamicLocationView()),
        GetPage(
            name: '/home/subcategory', page: () => const SubCategoriesView()),
      ],
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      themeMode: ThemeMode.light,
    );
  }
}
