import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:scrubo/data/firebase/firebase_storage_services.dart';
import 'package:scrubo/data/repositories/auth/authentication_repository.dart';
import 'package:scrubo/pages/products/model/product_availability_model.dart';
import 'package:scrubo/pages/products/model/product_model.dart';
import 'package:scrubo/pages/products/model/product_variations.dart';
import 'package:scrubo/utils/constants/image_strings.dart';

class ProductsRepository extends GetxController {
  static ProductsRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final TFirebaseStorageServices _storageServices = TFirebaseStorageServices();

  //Fetch all the products
  Future<List<ProductModel>> fetchAllProducts() async {
    try {
      final docs = await _db.collection("Products").get();
      if (docs.docs.isNotEmpty) {
        return docs.docs
            .map((element) => ProductModel.fromSnapshot(element))
            .toList();
      }
      return [];
    } catch (e) {
      throw 'Error fetching products $e';
    }
  }

  ///Fetching the products by category by category
  ///Categories is id from 1 to 7
  ///
  Future<List<ProductModel>> getCategoryProducts(String category) async {
    try {
      final docs = await _db
          .collection("Products")
          .where('category', isEqualTo: category)
          .get();
      if (docs.docs.isNotEmpty) {
        return docs.docs
            .map((element) => ProductModel.fromSnapshot(element))
            .toList();
      }
      return [];
    } catch (e) {
      throw 'Error fetching products $e';
    }
  }

  ///Fetch the `featured products` using database query for hompage
  ///Parameters: None
  ///Returns List<ProductModel>
  Future<List<ProductModel>> getFeaturedProducts() async {
    final List<ProductModel> featuredProducts = [];

    try {
      final docs = await _db
          .collection("Products")
          .where('isFeatured', isEqualTo: true)
          .get();

      if (docs.docs.isNotEmpty) {
        for (var element in docs.docs) {
          featuredProducts.add(ProductModel.fromSnapshot(element));
        }
        return featuredProducts;
      }
    } catch (e) {
      throw 'Error fetching featured products $e';
    }
    return [];
  }

  ///Upload dummy data
  Future<void> uploadDummyData() async {
    try {
      for (ProductModel data in dummyData) {
        //Variables
        List<String> photoUrls = [];

        List<Map<String, dynamic>> variations = [];

        //Create the thumbnail image from the asset
        final file =
            await _storageServices.getImageDataFromAssets(data.thumbnail);

        //Create the  photoUrl image from the assets
        for (String photo in data.photoUrls) {
          final file = await _storageServices.getImageDataFromAssets(photo);
          //Upload the phoroUrl images to the firebasestorage
          final url = await _storageServices.uploadImageData(
              "Products/${data.shopName}_${data.category}_${data.name[0]}",
              file,
              "${data.name}_product_image_${data.shopName}");

          //Adding the url to the list
          photoUrls.add(url);
        }
        //Upload the thumbnail image to the firebasestorage and get the url
        final url = await _storageServices.uploadImageData(
            "Products/${data.shopName}_${data.category}_${data.name[0]}",
            file,
            "${data.name}_thumbnail_image_${data.shopName}");

        //Create the variations
        for (ProductVariations variant in data.varitaions) {
          variations.add(variant.toJson());
        }

        //Upload the data to the firestore
        await _db.collection("Products").doc().set({
          'id': data.id,
          'name': data.name,
          'addons': data.addons,
          'availability': data.availability.toJson(),
          'category': data.category,
          'description': data.description,
          'forCarOnly': data.forCarOnly,
          'isFeatured': data.isFeatured,
          'photoUrls': photoUrls,
          'ratings': data.ratings,
          'comments': data.comments,
          'countOfReviews': data.countOfReviews,
          'shopName': data.shopName,
          'status': data.status,
          'thumbnail': url,
          'timeTaken': data.timeTaken,
          'variations': variations,
        });
      }
    } catch (e) {
      rethrow;
    }
  }
}

//TODO: Create a new MC for the comments section and for categories to get category name from id

final dummyData = [
  ProductModel(
    id: '0001',
    name: 'Car Engine Service',
    addons: [],
    availability: ProductAvailabilityModel(
      monday: {
        'start': '09:00',
        'end': '17:00',
        'open': true,
      },
      tuesday: {
        'start': '09:00',
        'end': '17:00',
        'open': true,
      },
      wednesday: {
        'start': '09:00',
        'end': '17:00',
        'open': true,
      },
      thursday: {
        'start': '09:00',
        'end': '17:00',
        'open': true,
      },
      friday: {
        'start': '09:00',
        'end': '17:00',
        'open': true,
      },
      saturday: {
        'start': '09:00',
        'end': '17:00',
        'open': true,
      },
      sunday: {
        'open': false,
      },
    ),
    category: 3,
    description: 'Complete engine service and maintenance package',
    forCarOnly: true,
    isFeatured: true,
    photoUrls: [TImages.car, TImages.carOilChange],
    ratings: {
      '5': 8,
      '4': 4,
      '3': 6,
      '2': 2,
      '1': 3,
    },
    comments: [
      {
        'name': 'John Doe',
        'userId': AuthenticationRepository.instance.authUser!.uid,
        'comment': 'Great service, will come again',
        'rating': 5,
        'date': DateTime.now().toString(),
        'reply': {
          'name': 'Auto GTG Services',
          'comment': 'Thank you for your feedback',
          'date': DateTime.now().toString()
        }
      },
      {
        'name': 'Jane Doe',
        'userId': AuthenticationRepository.instance.authUser!.uid,
        'comment': 'Good service, will come again',
        'rating': 4,
        'date': DateTime.now().toString(),
        'reply': {
          'name': 'Auto GTG Services',
          'comment': 'Thank you for your feedback',
          'date': DateTime.now().toString()
        }
      },
      {
        'name': 'John Doe',
        'comment': 'Great service, will come again',
        'userId': AuthenticationRepository.instance.authUser!.uid,
        'rating': 5,
        'date': DateTime.now().toString(),
        'reply': {
          'name': 'Auto GTG Services',
          'comment': 'Thank you for your feedback',
          'date': DateTime.now().toString()
        }
      },
      {
        'name': 'Jane Doe',
        'comment': 'Good service, will come again',
        'userId': AuthenticationRepository.instance.authUser!.uid,
        'rating': 4,
        'date': DateTime.now().toString(),
        'reply': {
          'name': 'Auto GTG Services',
          'comment': 'Thank you for your feedback',
          'date': DateTime.now().toString()
        }
      },
    ],
    countOfReviews: 0,
    shopName: 'AutoCare Service Center',
    status: true,
    thumbnail: TImages.carRepair,
    timeTaken: 180,
    varitaions: [
      ProductVariations(
          name: 'Basic Engine Service',
          price: 19900,
          description: 'Basic engine check and oil change'),
      ProductVariations(
          name: 'Complete Engine Service',
          price: 29900,
          description: 'Full engine service with parts inspection')
    ],
  ),
  ProductModel(
    id: '2',
    name: 'Car Wash Service',
    addons: [],
    availability: ProductAvailabilityModel(
      monday: {
        'start': '09:00',
        'end': '17:00',
        'open': true,
      },
      tuesday: {
        'start': '09:00',
        'end': '17:00',
        'open': true,
      },
      wednesday: {
        'start': '09:00',
        'end': '17:00',
        'open': true,
      },
      thursday: {
        'start': '09:00',
        'end': '17:00',
        'open': true,
      },
      friday: {
        'start': '09:00',
        'end': '17:00',
        'open': true,
      },
      saturday: {
        'start': '09:00',
        'end': '17:00',
        'open': true,
      },
      sunday: {
        'open': false,
      },
    ),
    category: 5,
    description: 'Professional car washing and detailing service',
    forCarOnly: true,
    isFeatured: true,
    photoUrls: [TImages.carTowing, TImages.carSpa],
    ratings: {
      '5': 8,
      '4': 4,
      '3': 6,
      '2': 2,
      '1': 3,
    },
    comments: [
      {
        'name': 'John Doe',
        'userId': AuthenticationRepository.instance.authUser!.uid,
        'comment': 'Great service, will come again',
        'rating': 5,
        'date': DateTime.now().toString(),
        'reply': {
          'name': 'Auto GTG Services',
          'comment': 'Thank you for your feedback',
          'date': DateTime.now().toString()
        }
      },
      {
        'name': 'Jane Doe',
        'userId': AuthenticationRepository.instance.authUser!.uid,
        'comment': 'Good service, will come again',
        'rating': 4,
        'date': DateTime.now().toString(),
        'reply': {
          'name': 'Auto GTG Services',
          'comment': 'Thank you for your feedback',
          'date': DateTime.now().toString()
        }
      },
      {
        'name': 'John Doe',
        'comment': 'Great service, will come again',
        'userId': AuthenticationRepository.instance.authUser!.uid,
        'rating': 5,
        'date': DateTime.now().toString(),
        'reply': {
          'name': 'Auto GTG Services',
          'comment': 'Thank you for your feedback',
          'date': DateTime.now().toString()
        }
      },
      {
        'name': 'Jane Doe',
        'comment': 'Good service, will come again',
        'userId': AuthenticationRepository.instance.authUser!.uid,
        'rating': 4,
        'date': DateTime.now().toString(),
        'reply': {
          'name': 'Auto GTG Services',
          'comment': 'Thank you for your feedback',
          'date': DateTime.now().toString()
        }
      },
    ],
    countOfReviews: 0,
    shopName: 'Sparkle Car Wash',
    status: true,
    thumbnail: TImages.carWashService,
    timeTaken: 90,
    varitaions: [
      ProductVariations(
          name: 'Basic Car Wash',
          price: 19900,
          description: 'Basic car wash and interior cleaning'),
      ProductVariations(
          name: 'Premium Car Wash',
          price: 29900,
          description: 'Full car wash with interior and exterior detailing')
    ],
  )
];
