import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:scrubo/data/repositories/user/address/address_repository.dart';
import 'package:scrubo/pages/personalization/models/address_model.dart';
import 'package:scrubo/pages/personalization/models/post_model.dart';
import 'package:scrubo/utils/helpers/custom_snackbar.dart';

class AddressController extends GetxController {
  static AddressController get instance => Get.find();
  //Variables
  final addressRepository = Get.put(AddressRepository());

  ///Controllers
  ///
  ///Controllers for the textfields
  ///
  ///NameController
  Rx<TextEditingController> nameController = TextEditingController().obs;

  ///PostalController
  Rx<TextEditingController> postalController = TextEditingController().obs;

  ///StreetController
  Rx<TextEditingController> streetController = TextEditingController().obs;

  ///CityController
  Rx<TextEditingController> cityController = TextEditingController().obs;

  ///StateController
  Rx<TextEditingController> stateController = TextEditingController().obs;

  ///PhoneNumber
  Rx<TextEditingController> phoneNumberController = TextEditingController().obs;

  ///Address
  Rx<TextEditingController> addressController = TextEditingController().obs;

  //AddressType
  final addressType = 'Home'.obs;

  //Loading
  final addressLoading = false.obs;

  //List of all the Address
  List<AddressModel> addresess = <AddressModel>[].obs;

  @override
  void onInit() async {
    ///Listener for the postal code
    ///This will update the state, city and street according to the postal code
    postalController.value.addListener(() async {
      if (postalController.value.text.length == 6) {
        final model = await getPostalDetails(postalController.value.text);
        streetController.value.text = model.name;
        cityController.value.text = model.city;
        stateController.value.text = model.state;
      }
    });
    await fetchAddressDetails();
    super.onInit();
  }

  ///A function for editing the existing user address
  ///Future function returning none
  ///
  ///Parametres:
  ///
  ///`addressModel` : AddressModel
  Future<void> editAddress(AddressModel addressModel) async {
    try {
      //Start Loader
      addressLoading.value = true;

      //Change the model of the exisiting address
      final model = AddressModel(
          id: addressModel.id,
          name: nameController.value.text,
          street: streetController.value.text,
          type: addressType.value,
          city: cityController.value.text,
          state: stateController.value.text,
          postalCode: postalController.value.text,
          phoneNumber: phoneNumberController.value.text,
          address: addressController.value.text);

      //Edit the address in the database
      await addressRepository.editAddress(model);

      //Fetch the address details
      await fetchAddressDetails();
    } catch (e) {
      TSnackBars.errorSnackBar("Address couldn't be edited", e.toString());
    } finally {
      addressLoading.value = false;
    }
  }

  ///A function for fetching the address details
  ///
  ///Future function returning none
  Future<void> fetchAddressDetails() async {
    try {
      addressLoading.value = true;
      final address = await addressRepository.fetchAddressRecord();
      addresess = address;
    } catch (e) {
      addresess = [AddressModel.empty];
      TSnackBars.errorSnackBar('Ohh Snap...', e.toString());
    } finally {
      addressLoading.value = false;
    }
  }

  Future<void> deleteAddressRecord(String addressId) async {
    try {
      await addressRepository.deleteAddressRecord(addressId);
    } catch (e) {
      TSnackBars.errorSnackBar("Address couldn't be deleted", e.toString());
    }
  }

  Future<void> saveAddressRecord() async {
    try {
      //Start Loader
      addressLoading.value = true;

      //Create the address Model
      final addressModel = AddressModel(
        type: addressType.value,
        id: addressType.value + DateTime.now().toString(),
        name: nameController.value.text,
        postalCode: postalController.value.text,
        street: streetController.value.text,
        city: cityController.value.text,
        state: stateController.value.text,
        phoneNumber: phoneNumberController.value.text,
        address: addressController.value.text,
      );

      //Save the address record
      await addressRepository.saveAddressRecord(addressModel);
    } catch (e) {
      TSnackBars.errorSnackBar("Address couldn't be added", e.toString());
    } finally {
      addressLoading.value = false;
    }
  }

  Future<PostModel> getPostalDetails(String postalNumber) async {
    try {
      final response = await addressRepository.getPostalDetails(postalNumber);
      final data = jsonDecode(response);
      final List<dynamic> postDetails = data[0]["PostOffice"];
      final PostModel details = PostModel.fromJson(postDetails.last);

      return details;
    } catch (e) {
      TSnackBars.errorSnackBar("Ohh snap.", e.toString());
      return PostModel.empty;
    }
  }
}
