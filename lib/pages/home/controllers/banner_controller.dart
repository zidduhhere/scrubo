import 'package:get/get.dart';
import 'package:scrubo/data/repositories/banners/banner_repository.dart';
import 'package:scrubo/pages/home/model/carousel_model.dart';
import 'package:scrubo/utils/device/network_manager.dart';
import 'package:scrubo/utils/helpers/custom_snackbar.dart';

///This is a custom carousel controller for the carousel widget
class BannerController extends GetxController {
  //Functions

  static BannerController get instance => Get.find();
  //Variables
  final _carouselRepository = Get.put(BannerRepository());

  //Loading
  final isLoading = true.obs;

  //List of all the Banners
  final RxList<CarouselModel> carouselList = <CarouselModel>[].obs;

  //Network Manager Instance
  final networkManager = NetworkManager.instance;

  //
  //Carousel Index
  RxInt carouselCurrentIndex = 0.obs;

  @override
  void onInit() async {
    // await _carouselRepository.uploadDummyData();
    bool previousValue = false;
    // Listen to network connectivity status
    networkManager.checkConnectivityRealTime().listen(
      (isConnected) async {
        if (isConnected != previousValue && isConnected) {
          carouselList.isEmpty ? await fetchAllBanners() : null;
          previousValue = isConnected;
        }
        if (isConnected == false) {
          TSnackBars.errorSnackBar(
              'No internet connection', 'Try using mobile data / WiFi');

          previousValue = isConnected;
          const Duration(seconds: 3);
        }
      },
      onDone: () {},
    );
    super.onInit();
  }

  void changeCarouselIndex(int index) {
    carouselCurrentIndex.value = index;
  }

  //Fetch all the carousel detailsa

  Future<void> fetchAllBanners() async {
    try {
      //Show Loader
      isLoading.value = true;

      //Check internet connectivity
      if (!await NetworkManager.instance.hasInternetConnection()) {
        TSnackBars.errorSnackBar(
            'No Internet Connection', 'Please check your internet connection');

        return;
      }

      //Fetch all categories from data store
      final carouselList = await _carouselRepository.getAllBanners();

      this.carouselList.value = carouselList;
    } catch (e) {
      TSnackBars.errorSnackBar('Ohh Snap...', e.toString());
    } finally {
      //Remove Loader
      isLoading.value = false;
    }
  }
}
