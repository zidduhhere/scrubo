import 'package:get/get.dart';
import 'package:scrubo/data/repositories/categories/category_repository.dart';
import 'package:scrubo/pages/sub_categories/models/category_model.dart';
import 'package:scrubo/utils/helpers/custom_snackbar.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  //Variables
  final _categoryRepository = Get.put(CategoryRepository());

  final isLoading = false.obs;
  //Category List
  final RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  //Featured Category List
  final RxList<CategoryModel> categories = <CategoryModel>[].obs;

  //Load category data
  @override
  void onInit() async {
    // await _categoryRepository.uploadDummyData();
    await fetchAllCategories();
    super.onInit();
  }

  ///Get all categories
  ///`Parameters: None`
  ///
  ///Using category model and repository to fetch all the categories
  ///
  ///`Returns: List<CategoryModel>`: The list of all categories [LIST]
  ///
  ///Exception is handeled
  ///
  Future<void> fetchAllCategories() async {
    try {
      //Show Loader
      isLoading.value = true;

      //Fetch all categories from data store

      final categories = await _categoryRepository.getAllCategories();

      //Update the list of categories
      this.categories(categories);

      //Filter featured Items
      featuredCategories.value = this
          .categories
          .where((element) =>
              element.isFeatured == true && element.parentId.isEmpty)
          .take(8)
          .toList();
    } catch (e) {
      TSnackBars.errorSnackBar('Ohh Snap...', e.toString());
    } finally {
      //Remove Loader
      isLoading.value = false;
    }
  }
}
