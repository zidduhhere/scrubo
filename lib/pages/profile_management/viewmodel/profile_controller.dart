import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProfileViewController extends GetxController {
  Map<int, Map<String, dynamic>> profileSections = {
    0: {
      "text": "My Address",
      "iconData": Iconsax.location,
      "iconColor": Colors.red
    },
    1: {
      "text": "Payments",
      "iconData": Iconsax.card,
      "iconColor": Colors.green
    },
    2: {
      "text": "Feedback",
      "iconData": Iconsax.paperclip,
      "iconColor": Colors.blue,
    },
    3: {
      "text": "Terms & Conditions",
      "iconData": Iconsax.blend,
      "iconColor": Colors.black
    },
    4: {
      "text": "Logout",
      "iconData": Iconsax.logout,
      "iconColor": Colors.red,
    }
  };

  void logout() {
    Get.offAllNamed('/login');
  }

  void address() {}
  void payments() {}
  void feedback() {}
  void termsAndConditions() {}
}
