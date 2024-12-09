import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:scrubo/data/repositories/auth/authentication_repository.dart';
import 'package:scrubo/pages/authentication/models/user_model.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  ///Save the user record in the database.
  ///Parameters:
  ///`userModel` (UserModel): The user model object to be saved in the database
  Future<void> saveUserRecord(UserModel userModel) async {
    try {
      await _db.collection("Users").doc(userModel.uid).set(userModel.toJson());
    } on FirebaseException catch (e) {
      throw FirebaseException(
          code: e.code, message: e.message, plugin: 'UserRepository');
    }
  }

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

  Future<void> updateUserDetails(UserModel userModel) async {
    try {
      await _db
          .collection("Users")
          .doc(userModel.uid)
          .update(userModel.toJson());
    } on FirebaseException catch (e) {
      throw FirebaseException(
          code: e.code, message: e.message, plugin: 'UserRepository');
    }
  }

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
}
