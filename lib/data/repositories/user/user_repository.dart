import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scrubo/data/repositories/auth/authentication_repository.dart';
import 'package:scrubo/pages/authentication/models/user_model.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  ///Save the user record in the database.
  ///Parameters:
  ///`userModel` (UserModel): The user model object to be saved in the database
  ///
  ///`Throws: FirebaseException`
  Future<void> saveUserRecord(UserModel userModel) async {
    try {
      await _db.collection("Users").doc(userModel.id).set(userModel.toJson());
    } on FirebaseException catch (e) {
      throw FirebaseException(
          code: e.code, message: e.message, plugin: 'UserRepository');
    }
  }

  ///Fetch the user record from the database.
  ///`Parameters: None`
  ///
  ///`Returns: UserModel`
  ///
  ///`Throws: FirebaseException`
  Future<UserModel> fetchUserRecord() async {
    try {
      DocumentSnapshot doc = await _db
          .collection("Users")
          .doc(AuthenticationRepository.instance.authUser?.uid)
          .get();
      return UserModel.fromFirebaseDataSnapshot(doc);
    } on FirebaseException catch (e) {
      throw FirebaseException(
          code: e.code, message: e.message, plugin: 'UserRepository');
    } catch (e) {
      rethrow;
    }
  }

  ///Update the user record in the database.
  ///Parameters:
  ///
  ///`userModel` (UserModel): The user model object to be updated in the database
  ///
  ///Returns: Nothing
  ///
  ///Throws: FirebaseException
  Future<void> updateUserDetails(UserModel userModel) async {
    try {
      await _db
          .collection("Users")
          .doc(userModel.id)
          .update(userModel.toJson());
    } on FirebaseException catch (e) {
      throw FirebaseException(
          code: e.code, message: e.message, plugin: 'UserRepository');
    }
  }

  ///Delete the user record from the database.
  ///Parameters: None
  ///
  ///Returns: Nothing
  ///
  ///Throws: FirebaseException
  Future<void> deleteUserRecord() async {
    try {
      await _db
          .collection("Users")
          .doc(AuthenticationRepository.instance.authUser?.uid)
          .delete();
    } on FirebaseException catch (e) {
      throw FirebaseException(
          code: e.code, message: e.message, plugin: 'UserRepository');
    }
  }

  ///Update a single field in the user record.
  ///Parameters:
  ///`data` (Map<String, dynamic>): The map object containing the field to be updated.
  ///The map object contains the following key-value pairs:
  ///`key` (String): The field to be updated.
  ///`value` (dynamic): The value to be updated.
  ///Returns: Nothing
  ///
  ///Throws: FirebaseException
  Future<void> updateSingleField(Map<String, dynamic> data) async {
    try {
      await _db
          .collection("Users")
          .doc(AuthenticationRepository.instance.authUser?.uid)
          .update(data);
    } on FirebaseException catch (e) {
      throw FirebaseException(
          code: e.code, message: e.message, plugin: 'UserRepository');
    }
  }

  ///Upload the image to Firebase Storage
  ///
  ///Parameters:
  ///
  ///`path` (String): The path to the image in Firebase Storage.
  ///
  ///`image` (XFile): The image file to be uploaded.
  ///
  ///Returns: String
  ///
  ///Throws: FirebaseException
  Future<String> uploadUserProfilePicture(String path, XFile image) async {
    try {
      await deleteProfilePicture();
      final ref = FirebaseStorage.instance.ref(path).child(image.name);
      await ref.putFile(File(image.path));
      final url = await ref.getDownloadURL();
      return url;
    } on FirebaseException catch (e) {
      throw FirebaseException(
          code: e.code, message: e.message, plugin: 'UserRepository');
    } catch (e) {
      rethrow;
    }
  }

  ///Delete the image from Firebase Storage
  ///
  ///Parameters:
  ///
  ///`path` (String): The path to the image in Firebase Storage.
  ///
  ///Returns: Nothing
  ///
  ///Throws: FirebaseException
  Future<void> deleteProfilePicture() async {
    try {
      final imageUrl = await _db
          .collection("Users")
          .doc(AuthenticationRepository.instance.authUser?.uid)
          .get()
          .then((value) => value.data()?['Photo']);
      if (imageUrl != "") {
        await _storage.refFromURL(imageUrl).delete();
      }
    } on FirebaseException catch (e) {
      throw FirebaseException(
          code: e.code, message: e.message, plugin: 'UserRepository');
    } catch (e) {
      rethrow;
    }
  }
}
