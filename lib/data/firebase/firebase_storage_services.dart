import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class TFirebaseStorageServices extends GetxController {
  static TFirebaseStorageServices get instance => Get.find();

  final _firebaseStorage = FirebaseStorage.instance;

  ///Upload Local assets from the IDE
  ///Returns a Uint8List containing image data
  Future<Uint8List> getImageDataFromAssets(String path) async {
    try {
      final byteData = await rootBundle.load(path);
      final imageData = byteData.buffer
          .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes);
      return imageData;
    } catch (e) {
      rethrow;
    }
  }

  Future<String> uploadImageData(
      String path, Uint8List image, String name) async {
    try {
      final ref = _firebaseStorage.ref(path).child(name);
      await ref.putData(image);
      return ref.getDownloadURL();
    } on FirebaseException catch (e) {
      throw FirebaseException(
          plugin: 'TFirevaseStorageServices', code: e.code, message: e.message);
    } catch (e) {
      throw 'Error uploading image data to cloud storage';
    }
  }
}
