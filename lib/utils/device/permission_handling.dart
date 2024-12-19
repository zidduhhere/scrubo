import 'package:flutter/foundation.dart';
import 'package:permission_handler/permission_handler.dart';

class TPermissionHandler {
  TPermissionHandler._();

  static Future<void> handlePermissions(
      {required Permission permission}) async {
    final status = await permission.status;

    if (status.isPermanentlyDenied) {
      openAppSettings();
    }
    if (status.isDenied) {
      await permission.request().isGranted;
      debugPrint('Permission granted');
    }
    if (status.isGranted) {
      debugPrint('Permission already granted');
    }
  }

  static Future<void> askAllPermissions() async {
    final status = await <Permission>[
      Permission.camera,
      Permission.storage,
      Permission.location,
      Permission.microphone,
    ].request();

    debugPrint('Permission status of camera : ${status[Permission.camera]}');
    debugPrint('Permission status of storage : ${status[Permission.storage]}');
    debugPrint(
        'Permission status of location : ${status[Permission.location]}');
    debugPrint(
        'Permission status of microphone : ${status[Permission.microphone]}');
  }
}
