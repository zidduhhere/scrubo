import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:scrubo/data/firebase/firebase_storage_services.dart';
import 'package:scrubo/pages/sub_categories/models/category_model.dart';
import 'package:scrubo/utils/constants/image_strings.dart';
import 'package:scrubo/utils/exceptions/platforms_exceptiond.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  // Variables
  final _db = FirebaseFirestore.instance;

  //Get all categories
  //Throws: FirebaseException
  ///FirebaseException: If an error occurs while fetching the data from the database
  ///
  ///`Returns: List<CategoryModel>`: The list of all categories [LIST]
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      List<CategoryModel> categories = [];
      final snapshot = await _db.collection('Categories').get();
      categories = snapshot.docs
          .map((document) => CategoryModel.fromSnapshot(document))
          .toList();
      return categories;
    } on FirebaseException catch (e) {
      throw FirebaseException(
          code: e.code, message: e.message, plugin: 'CategoryRepository');
    } on TPlatformExceptions catch (e) {
      throw TPlatformExceptions(
        code: e.code,
      );
    } catch (e) {
      rethrow;
    }
  }

  //Upload dummy data
  Future<void> uploadDummyData() async {
    try {
      final storage = Get.put(TFirebaseStorageServices());
      for (var data in dummyData) {
        //Get the image from the assets
        final file = await storage.getImageDataFromAssets(data.image);

        final url =
            await storage.uploadImageData("Categories", file, data.name);

        data.image = url;

        await _db.collection("Categories").doc(data.id).set(data.toJson());
      }
    } catch (e) {
      rethrow;
    }
  }

  ///Get Sub Categories
  ///Parameters:
  ///
  ///`id' (String): The id of the parent category
  ///
  ///Returns: List<CategoryModel>: The list of sub categories
  ///
}

List<CategoryModel> dummyData = [
  CategoryModel(
    id: '1',
    name: 'Wash',
    image: TImages.colorIconCarWash,
    isFeatured: true,
  ),
  CategoryModel(
    id: '2',
    name: 'Oil Change',
    image: TImages.colorIconOilChange,
    isFeatured: true,
  ),
  CategoryModel(
    id: '3',
    name: 'Repair',
    image: TImages.colorIconRepair,
    isFeatured: true,
  ),
  CategoryModel(
    id: '4',
    name: 'Engine',
    image: TImages.colorIconCarService,
    isFeatured: true,
  ),
  CategoryModel(
    id: '5',
    name: 'Inspection',
    image: TImages.colorIconSpareParts,
    isFeatured: true,
  ),
  CategoryModel(
    id: '6',
    name: 'Brake Check',
    image: TImages.colorIconBreakCheck,
    isFeatured: true,
  ),
  CategoryModel(
    id: '7',
    name: 'Transmission Check',
    image: TImages.colorIconCarService,
    isFeatured: true,
  ),
  CategoryModel(
    id: '8',
    name: 'Battery Check',
    image: TImages.colorIconSpareParts,
    isFeatured: true,
  ),
];
