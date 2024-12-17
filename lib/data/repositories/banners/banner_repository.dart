import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:scrubo/data/firebase/firebase_storage_services.dart';
import 'package:scrubo/pages/home/model/carousel_model.dart';

class BannerRepository extends GetxController {
  static BannerRepository get instance => Get.find();

  //Firebase Firestore instance
  final _db = FirebaseFirestore.instance;

  //Get All Banners

  Future<List<CarouselModel>> getAllBanners() async {
    try {
      final snapshot = await _db
          .collection("Carousels")
          .where("active", isEqualTo: true)
          .get();
      final list = snapshot.docs
          .map((document) => CarouselModel.fromSnapshopt(document))
          .toList();

      return list;
    } catch (e) {
      throw 'Error fetching all categories $e';
    }
  }

  //Dummy data;

  Future<void> uploadDummyData() async {
    try {
      final storage = Get.put(TFirebaseStorageServices());
      for (var data in dummyData) {
        //Get the image from the assets
        final file = await storage.getImageDataFromAssets(data.image);

        final url = await storage.uploadImageData(
            "Carousels", file, "${data.couponCode}_image");

        data.image = url;

        await _db.collection("Carousels").doc().set(data.toJson());
      }
    } catch (e) {
      rethrow;
    }
  }
}

final List<CarouselModel> dummyData = [
  // CarouselModel(
  //     active: true,
  //     image: TImages.confetti,
  //     targetScreen: "/services",
  //     description: "Can avail on any services",
  //     discount: 20,
  //     couponCode: "WELCOME20",
  //     shop: "Available on all shops"),
  // CarouselModel(
  //     active: true,
  //     image: TImages.suspensionCar,
  //     targetScreen: "/suspension",
  //     description: "On buying new car suspension",
  //     discount: 30,
  //     couponCode: "SUSPENSION30",
  //     shop: "Nearby Suspension Shop"),
  // CarouselModel(
  //     active: true,
  //     image: TImages.carSpa,
  //     targetScreen: "/wash",
  //     description: "On booking car spa",
  //     discount: 10,
  //     couponCode: "CARSPA10",
  //     shop: "Car Spa"),
  // CarouselModel(
  //   active: true,
  //   image: TImages.tyresCar,
  //   targetScreen: "/tyres",
  //   description: "Buy 4 get 1 free",
  //   discount: 0,
  //   couponCode: "TYRES300",
  //   shop: "All Shop",
  // ),
];
