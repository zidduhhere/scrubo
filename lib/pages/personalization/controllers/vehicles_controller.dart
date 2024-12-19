import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scrubo/data/repositories/user/vehicles/vehicles_repository.dart';
import 'package:scrubo/pages/personalization/models/vehicle_model.dart';
import 'package:scrubo/utils/device/network_manager.dart';
import 'package:scrubo/utils/helpers/custom_snackbar.dart';

class VehiclesController extends GetxController {
  static VehiclesController get instance => Get.find();

  //Variables
  final _vehiclesRepository = Get.put(VehiclesRepository());

  //company
  RxString company = ''.obs;

  //model
  RxString model = ''.obs;

  //type
  RxString type = ''.obs;

  //List of vehicle types
  RxList<String> vehicleTypes = <String>[
    'Sedan',
    'SUV',
    'Hatchback',
    'Motorcycle',
    'Scooter',
    'Van',
    'Pickup Truck',
    'Sports Car',
    'Electric Car',
    'Electric Bike'
  ].obs;

  //Field controllers
  Rx<TextEditingController> registrationNumber = TextEditingController().obs;
  Rx<TextEditingController> color = TextEditingController().obs;
  Rx<TextEditingController> description = TextEditingController().obs;

  //List of all the vehicles
  RxList<VehicleModel> vehicles = <VehicleModel>[].obs;

  @override
  void onInit() async {
    await fetchVehicles();
    await fetchCompanies();

    super.onInit();
  }

  //List of all the vehicles companies
  List<String> companies = <String>[].obs;

  //List of all the company vehicles model
  List<String> models = <String>[].obs;
  //Loader
  final isLoading = false.obs;

  final isConnected = false.obs;

  Future<void> fetchCompanies() async {
    try {
      //start Loader
      isLoading.value = true;

      //Check the connectivity
      if (!await NetworkManager.instance.hasInternetConnection()) {
        TSnackBars.errorSnackBar(
            'No Internet Connection', 'Please check your internet connection');
        return;
      }

      //Fetch all the companies
      final companies = await _vehiclesRepository.getAllCompanies();

      //Update the companies
      this.companies = companies;
    } catch (e) {
      TSnackBars.errorSnackBar('Unable to fetch model list', e.toString());
    } finally {
      //Stop the loader
      isLoading.value = false;
    }
  }

  Future<void> fetchModels() async {
    try {
      //start laoder
      isLoading.value = true;

      //check the connectivity
      if (!await NetworkManager.instance.hasInternetConnection()) {
        TSnackBars.errorSnackBar(
            'No Internet Connection', 'Please check your internet connection');
        return;
      }

      //Fetch all the models
      final models = await _vehiclesRepository.getModels(company.value);

      //Update the models variable
      this.models = models;
    } catch (e) {
      rethrow;
    } finally {
      //Stop the loader
      isLoading.value = false;
    }
  }

  Future<void> fetchVehicles() async {
    try {
      //start the loader
      isLoading.value = true;

      //Check the connectivity
      if (!await NetworkManager.instance.hasInternetConnection()) {
        TSnackBars.errorSnackBar(
            'No Internet Connection', 'Please check your internet connection');
        return;
      }

      //Fetch the vehicles list
      final vehicles = await _vehiclesRepository.getAllVehicles();

      //Update the vehicles list
      this.vehicles.value = vehicles;
    } catch (e) {
      TSnackBars.errorSnackBar('Unable to fetch model list', e.toString());
    } finally {
      //Stop the loader
      isLoading.value = false;
    }
  }

  Future<String> uploadCarImage() async {
    try {
      final imagePicker = ImagePicker();
      final XFile? image = await imagePicker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 100,
        maxHeight: 1080,
        maxWidth: 1080,
      );
      if (image != null) {
        final imageUrl = await _vehiclesRepository.uploadVehicleImage(image);
        return imageUrl;
      }
      return '';
    } catch (e) {
      TSnackBars.errorSnackBar('Unable to upload image', e.toString());
      return '';
    }
  }

  Future<void> uploadVehicle() async {
    try {
      //start loader
      isLoading.value = true;

      //Check the connectivity
      if (!await NetworkManager.instance.hasInternetConnection()) {
        TSnackBars.errorSnackBar(
            'No Internet Connection', 'Please check your internet connection');
        return;
      }

      //Check the validation
      if (company.value.isEmpty) {
        TSnackBars.errorSnackBar(
            'Company is required', 'Please select a company');
        return;
      }

      if (model.value.isEmpty) {
        TSnackBars.errorSnackBar('Model is required', 'Please select a model');
        return;
      }

      if (type.value.isEmpty) {
        TSnackBars.errorSnackBar('Type is required', 'Please select a type');
        return;
      }

      if (registrationNumber.value.text.isEmpty) {
        TSnackBars.errorSnackBar('Registration Number is required',
            'Please enter a registration number');
        return;
      }

      if (color.value.text.isEmpty) {
        TSnackBars.errorSnackBar('Color is required', 'Please enter a color');
        return;
      }

      if (description.value.text.isEmpty) {
        TSnackBars.errorSnackBar(
            'Description is required', 'Please enter a description');
        return;
      }

      //Upload the image
      final imageUrl = await uploadCarImage();

      //Check if the image is empty
      if (imageUrl.isEmpty) {
        TSnackBars.errorSnackBar('Image is required', 'Please upload an image');
        return;
      }

      //Create the vehicle model
      final vehicle = VehicleModel(
        company: company.value,
        model: model.value,
        type: type.value,
        registrationNumber: registrationNumber.value.text,
        color: color.value.text,
        description: description.value.text,
        photoUrl: imageUrl,
      );

      //Upload the vehicle
      await _vehiclesRepository.uploadVehicle(vehicle);

      //Fetch the vehicles
      await fetchVehicles();

      //Reset the fields
      company.value = '';
      model.value = '';
      type.value = '';
      registrationNumber.value.clear();
      color.value.clear();
      description.value.clear();
    } catch (e) {
      TSnackBars.errorSnackBar('Unable to save vehicle', e.toString());
    } finally {
      //Stop the loader
      isLoading.value = false;
    }
  }

  Future<void> deleteVehicle(String id) async {
    try {
      //start loader
      isLoading.value = true;

      //Check the connectivity
      if (!await NetworkManager.instance.hasInternetConnection()) {
        TSnackBars.errorSnackBar(
            'No Internet Connection', 'Please check your internet connection');
        return;
      }

      //Delete the vehicle
      await _vehiclesRepository.deleteVehicle(id);

      //Fetch the vehicles
      await fetchVehicles();
    } catch (e) {
      TSnackBars.errorSnackBar('Unable to delete vehicle', e.toString());
    } finally {
      //Stop the loader
      isLoading.value = false;
    }
  }

  Future<void> updateVehicle(VehicleModel old, int index) async {
    try {
      //start loader
      isLoading.value = true;

      //Check the connectivity
      if (!await NetworkManager.instance.hasInternetConnection()) {
        TSnackBars.errorSnackBar(
            'No Internet Connection', 'Please check your internet connection');
        return;
      }

      //Update the vehicle
      final vehicle = VehicleModel(
        id: old.id,
        company: company.value,
        model: model.value,
        type: type.value,
        registrationNumber: registrationNumber.value.text,
        color: color.value.text,
        description: description.value.text,
        photoUrl: vehicles[index].photoUrl,
      );

      //Update the vehicle
      await _vehiclesRepository.updateVehicle(vehicle);

      //Fetch the vehicles
      await fetchVehicles();
    } catch (e) {
      TSnackBars.errorSnackBar('Unable to update vehicle', e.toString());
    } finally {
      //Stop the loader
      isLoading.value = false;
    }
  }
}
