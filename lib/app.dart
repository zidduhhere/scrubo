import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:scrubo/navigation_bar.dart';
import 'package:scrubo/pages/authentication/login/view/login_view.dart';
import 'package:scrubo/pages/authentication/onboarding/view/onboarding_view.dart';
import 'package:scrubo/pages/authentication/signup/view/signup_view.dart';
import 'package:scrubo/pages/authentication/signup/view/verified_view.dart';
import 'package:scrubo/pages/authentication/signup/view/verify_view.dart';
import 'package:scrubo/pages/home/view/home_view.dart';
import 'package:scrubo/utils/theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: [
        GetPage(name: '/', page: () => const OnboardingView()),
        GetPage(name: '/signup', page: () => const SignupView()),
        GetPage(name: '/login', page: () => const LoginView()),
        GetPage(name: '/home', page: () => const HomeView()),
        GetPage(name: '/navigation', page: () => const NavigationMenu()),
        GetPage(name: '/signup/verify', page: () => const VerifyView()),
        GetPage(
            name: '/signup/verify/verified', page: () => const VerifiedView())
      ],
      initialRoute: '/navigation',
      debugShowCheckedModeBanner: false,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      themeMode: ThemeMode.system,
    );
  }
}
