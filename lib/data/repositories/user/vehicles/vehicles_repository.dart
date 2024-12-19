import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scrubo/data/repositories/auth/authentication_repository.dart';
import 'package:scrubo/pages/personalization/models/vehicle_model.dart';
import 'package:scrubo/utils/constants/enums.dart';
import 'package:scrubo/utils/http/http_helper.dart';

class VehiclesRepository extends GetxController {
  static VehiclesRepository get instance => Get.find();

  //Firestore instance
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  //Get all the vehicles companies from api
  Future<List<String>> getAllCompanies() async {
    try {
      List<dynamic> cumulatedResponse = [];

      // Get the response from the api
      for (int i = 0; i < 15; i++) {
        final response = await THttpHelper.getRequest(ApiFlags.vehicles,
            'records?select=make&limit=100&offset=${i * 100}');
        if (response.statusCode == 404) return [];
        final data = jsonDecode(response.body);

        cumulatedResponse += data["results"].map((e) => e["make"]).toList();
      }
      cumulatedResponse = cumulatedResponse.toSet().toList();
      cumulatedResponse.sort();
      return cumulatedResponse.map((e) => e.toString()).toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<List<String>> getModels(String company) async {
    List<dynamic> cumulatedResponse = [];
    try {
      for (int i = 0; i < 15; i++) {
        final response = await THttpHelper.getRequest(ApiFlags.vehicles,
            'records?select=make%2C%20model%2C%20drive&where=%22$company%22&limit=${i * 100}&offset=0');
        if (response.statusCode == 404) return [];
        final data = jsonDecode(response.body);
        cumulatedResponse +=
            data["results"].map((e) => cumulatedResponse.add(e["model"]));
      }
      cumulatedResponse = cumulatedResponse.toSet().toList();
      cumulatedResponse.sort();
      return cumulatedResponse.map((e) => e.toString()).toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<List<VehicleModel>> getAllVehicles() async {
    try {
      List<VehicleModel> vehicles = [];
      final data = await _db
          .collection("Users")
          .doc(AuthenticationRepository.instance.authUser!.uid)
          .collection("Vehicles")
          .get();

      if (data.docs.isEmpty) {
        [VehicleModel.empty];
      }
      data.docs.map((e) => vehicles.add(VehicleModel.fromSnapshot(e)));
      return vehicles;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> uploadVehicle(VehicleModel vehicle) async {
    try {
      await _db
          .collection("Users")
          .doc(AuthenticationRepository.instance.authUser!.uid)
          .collection("Vehicles")
          .doc()
          .set(vehicle.toJson());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteVehicle(String id) async {
    try {
      await _db
          .collection("Users")
          .doc(AuthenticationRepository.instance.authUser!.uid)
          .collection("Vehicles")
          .doc(id)
          .delete();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateVehicle(
    VehicleModel vehicle,
  ) async {
    try {
      await _db
          .collection("Users")
          .doc(AuthenticationRepository.instance.authUser!.uid)
          .collection("Vehicles")
          .doc(vehicle.id)
          .update(vehicle.toJson());
    } catch (e) {
      rethrow;
    }
  }

  Future<String> uploadVehicleImage(XFile image) async {
    try {
      final path =
          "Users/Vehicles/${AuthenticationRepository.instance.authUser!.uid}";
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
}
