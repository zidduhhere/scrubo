import 'package:get/get.dart';
import 'package:scrubo/utils/device/network_manager.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
  }
}
