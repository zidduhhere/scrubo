import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:scrubo/utils/helpers/custom_snackbar.dart';

//Manages the network connection and updates UI based on the connection status
class NetworkManager extends GetxController {
  //Instance of the controller
  static NetworkManager get instance => Get.find();

  //Variables
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;
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
  Future<void> _updateConnectionStatus(List<ConnectivityResult> result) async {
    try {
      final ConnectivityResult result =
          await _connectivity.checkConnectivity() as ConnectivityResult;
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
      final List<ConnectivityResult> result =
          await _connectivity.checkConnectivity();
      if (result == [ConnectivityResult.none]) {
        return false;
      }
      return true;
    } catch (e) {
      Exception(e);
      return false;
    }
  }

//Always check the connectivity
  Stream<bool> checkConnectivityRealTime() async* {
    while (true) {
      yield await hasInternetConnection();
      await Future.delayed(const Duration(seconds: 3));
    }
  }

  @override
  void onClose() {
    _connectivitySubscription.cancel();
    super.onClose();
  }

  ///Get the current connectivity status
  ///Returns the current connectivity status
  ///Returns `ConnectivityResult.none` if there is no internet connection
  ///Returns `ConnectivityResult.mobile` if the connection is through mobile data
  ///Returns `ConnectivityResult.wifi` if the connection is through WiFi
  ///Returns `ConnectivityResult.ethernet` if the connection is through ethernet
  ///Returns `ConnectivityResult.unknown` if the connection status is unknown
  ///Returns `ConnectivityResult.none` if the connection status is none
  ///Returns `ConnectivityResult.none` if the connection status is none
}
