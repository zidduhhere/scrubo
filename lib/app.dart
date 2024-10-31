import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:scrubo/pages/authentication/login/view/login_view.dart';
import 'package:scrubo/pages/authentication/onboarding/view/onboarding_view.dart';
import 'package:scrubo/pages/authentication/signup/view/signup_view.dart';
import 'package:scrubo/utils/theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: [
        GetPage(name: '/', page: () => const OnboardingView()),
        GetPage(name: '/signup', page: () => const SignupView()),
        GetPage(name: '/login', page: () => const LoginView())
      ],
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      themeMode: ThemeMode.system,
    );
  }
}
