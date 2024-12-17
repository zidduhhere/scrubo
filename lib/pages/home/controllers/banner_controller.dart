import 'package:get/get.dart';
import 'package:scrubo/data/repositories/banners/banner_repository.dart';
import 'package:scrubo/pages/home/model/carousel_model.dart';
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

  //
  //Carousel Index
  RxInt carouselCurrentIndex = 0.obs;

  @override
  void onInit() async {
    // await _carouselRepository.uploadDummyData();
    await fetchAllBanners();
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
