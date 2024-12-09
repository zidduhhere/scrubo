import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:get/get.dart';
import 'package:scrubo/utils/helpers/custom_snackbar.dart';

//Manages the network connection and updates UI based on the connection status
class NetworkManager extends GetxController {
  //Instance of the controller
  static NetworkManager get instance => Get.find();

  //Variables
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  final Rx<ConnectivityResult> _connectivityResult =
      ConnectivityResult.none.obs;

  ///Intialize the network manager and set up a stream to continously monitor the network connection
  @override
  void onInit() {
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
    super.onInit();
  }

  ///Update the connection status based on the changes in the connectivity and show a relevant popup for no internet connection
  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    try {
      final ConnectivityResult result = await _connectivity.checkConnectivity();
      _connectivityResult.value = result;
      if (result == ConnectivityResult.none) {
        //Show a popup for no internet connection
        TSnackBars.warningSnackBar(
            'No internet connection', 'Try using mobile data / WiFi');
      }
    } catch (e) {
      Exception(e);
    }
  }

  ///Check the internet connection status and return a boolean value
  ///Returns `true` if there is an active internet connection, `false` otherwise
  Future<bool> hasInternetConnection() async {
    try {
      final ConnectivityResult result = await _connectivity.checkConnectivity();
      return result != ConnectivityResult.none;
    } catch (e) {
      Exception(e);
      return false;
    }
  }

  @override
  void onClose() {
    _connectivitySubscription.cancel();
    super.onClose();
  }
}
