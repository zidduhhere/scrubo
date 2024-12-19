import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:scrubo/bindings/general_bindings.dart';
import 'package:scrubo/navigation_bar.dart';
import 'package:scrubo/pages/authentication/screens/login/view/login_view.dart';
import 'package:scrubo/pages/onboarding/view/onboarding_view.dart';
import 'package:scrubo/pages/authentication/screens/signup/view/signup_view.dart';
import 'package:scrubo/pages/authentication/screens/signup/view/verified_view.dart';
import 'package:scrubo/pages/authentication/screens/signup/view/verify_view.dart';
import 'package:scrubo/pages/booking_history/view/booking_history_view.dart';
import 'package:scrubo/pages/personalization/address/edit_address.dart';
import 'package:scrubo/pages/personalization/vehicles/add_vehicles.dart';
import 'package:scrubo/pages/personalization/vehicles/vehicles_view.dart';
import 'package:scrubo/pages/products/model/product_model.dart';
import 'package:scrubo/pages/sub_categories/view/sub_categories_view.dart';
import 'package:scrubo/pages/home/view/dynamic_location_view.dart';
import 'package:scrubo/pages/home/view/home_view.dart';
import 'package:scrubo/pages/personalization/address/add_new_address_view.dart';
import 'package:scrubo/pages/personalization/address/address_view.dart';
import 'package:scrubo/pages/personalization/profile/profile_view.dart';
import 'package:scrubo/pages/ratings_reviews/view/ratings_reviews_view.dart';
import 'package:scrubo/pages/products/view/product_detail_view.dart';
import 'package:scrubo/pages/service_scheduling/view/service_scheduling_view.dart';
import 'package:scrubo/pages/services/view/services_view.dart';
import 'package:scrubo/utils/device/device_utility.dart';
import 'package:scrubo/utils/theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    TDeviceUtility.setPotrait(context);
    TDeviceUtility.setStatusBarColor(Colors.white);
    TDeviceUtility.setStatusBarTextColor(true);

    return GetMaterialApp(
      initialBinding: GeneralBindings(),
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
            name: '/serviceDetails',
            page: () => ServiceDetailsView(
                  product: ProductModel.empty,
                )),
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
        GetPage(
            name: '/profile/address/edit', page: () => const EditAddressView()),
        GetPage(name: '/profile/vehicles', page: () => const VehiclesView()),
        GetPage(
            name: '/profile/vehicles/add', page: () => const AddNewVehicle()),
      ],
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      themeMode: ThemeMode.light,
    );
  }
}
