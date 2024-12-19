import 'package:get/get.dart';
import 'package:scrubo/data/repositories/prodcuts/products_repository.dart';
import 'package:scrubo/pages/products/model/product_model.dart';
import 'package:scrubo/utils/device/network_manager.dart';
import 'package:scrubo/utils/helpers/custom_snackbar.dart';

class ProductsController extends GetxController {
  static ProductsController get instance => Get.find();

  //Vairables
  RxList<ProductModel> featuredProducts = <ProductModel>[].obs;
  final _productRepository = Get.put(ProductsRepository());
  final networkManager = NetworkManager.instance;

  //Connection value

  //Variation Index
  final variationIndex = 0.obs;

  //Loader
  final isLoading = false.obs;

  //Network Manager
  @override
  void onInit() async {
    bool previousValue = false;
    // Listen to network connectivity status
    networkManager.checkConnectivityRealTime().listen(
      (isConnected) async {
        if (isConnected != previousValue && isConnected) {
          featuredProducts.isEmpty ? await fetchFeaturedProducts() : null;
          previousValue = isConnected;
        }
        if (isConnected == false) {
          TSnackBars.errorSnackBar(
              'No internet connection', 'Try using mobile data / Wireless');

          previousValue = isConnected;
          const Duration(seconds: 3);
        }
      },
    );

    // await fetchFeaturedProducts();
    super.onInit();
  }

  void onVariationChanged(int index, int length) {
    if (variationIndex.value == length - 1) {
      variationIndex.value = 0;
      return;
    }
    if (variationIndex.value < length) {
      variationIndex.value = index;
    }
  }

  void onRefresh() async {
    await fetchFeaturedProducts();
  }

  Future<void> fetchFeaturedProducts() async {
    try {
      //Start the lodaer
      isLoading.value = true;

      //Check the connectivity
      if (!await networkManager.hasInternetConnection()) {
        TSnackBars.errorSnackBar(
            'No Internet Connection', 'Please check your internet connection');
        return;
      }

      //Fetch all the featured products
      final products = await _productRepository.getFeaturedProducts();

      //Convert to needed models

      //Update the featured products

      featuredProducts(products);
    } catch (e) {
      TSnackBars.errorSnackBar('Ohh snap...', e.toString());
    } finally {
      //Stop the loader
      isLoading.value = false;
    }
  }
}
