import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:scrubo/app.dart';
import 'package:scrubo/data/repositories/auth/authentication_repository.dart';
import 'package:scrubo/firebase_options.dart';
import 'package:scrubo/utils/device/permission_handling.dart';

void main() async {
  //Widget binding

  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();

  //Init Local Storage
  await GetStorage.init();

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((FirebaseApp app) {
    Get.put(AuthenticationRepository());
  });

  await TPermissionHandler.askAllPermissions();

  //Initialize App Check
  await FirebaseAppCheck.instance.activate(
      //Use debug provider for development
      androidProvider:
          kDebugMode ? AndroidProvider.debug : AndroidProvider.playIntegrity);

  // Intialize Authentication

  runApp(const MyApp());
}


//TODO: Legal Modfication
// All this app can do is book a slot for a car wash, + if extra money is paid, it can also do a pickup
// oil change, tire service, bajttery check, or engine service.
// Teleconsulations 
//
///Featured Services
///Suspension, Brakes, Engine, Transmission, 