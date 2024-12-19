import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:scrubo/data/repositories/auth/authentication_repository.dart';
import 'package:scrubo/pages/personalization/models/address_model.dart';
import 'package:scrubo/utils/constants/enums.dart';
import 'package:scrubo/utils/http/http_helper.dart';

class AddressRepository extends GetxController {
  static AddressRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  //POSTAL LINK

  Future<void> editAddress(AddressModel model) async {
    try {
      await _db
          .collection("Users")
          .doc(AuthenticationRepository.instance.authUser?.uid)
          .collection("Address")
          .doc(model.id)
          .update(model.toJson());
    } catch (e) {
      throw 'Error editing address record $e';
    }
  }

  Future<String> getPostalDetails(String postalNumber) async {
    try {
      final response =
          await THttpHelper.getRequest(ApiFlags.postalOffice, postalNumber);
      if (response.statusCode == 404) {
        throw 'Error fetching postal details';
      }
      return response.body;
    } catch (e) {
      throw 'Error fetching postal details $e';
    }
  }

  //Fetch address in the address record
  ///Fetch the address record from the database.
  ///
  ///`Parameters: None`
  ///
  ///Returns: List<AddressModel>
  ///
  ///Throws: Error
  Future<List<AddressModel>> fetchAddressRecord() async {
    try {
      final docs = await _db
          .collection("Users")
          .doc(AuthenticationRepository.instance.authUser?.uid)
          .collection("Address")
          .get();
      if (docs.docs.isNotEmpty) {
        return docs.docs
            .map((element) => AddressModel.fromSnapshot(element))
            .toList();
      }
      return [];
    } catch (e) {
      throw 'Error fetching address record $e';
    }
  }

  //Delete address in the address record
  ///Delete the address record from the database.
  Future<void> deleteAddressRecord(String addressId) async {
    try {
      await _db
          .collection("Users")
          .doc(AuthenticationRepository.instance.authUser?.uid)
          .collection("Address")
          .doc(addressId)
          .delete();
    } catch (e) {
      throw 'Error deleting address record $e';
    }
  }

  //Save address in the address record
  ///Save the address record in the database.
  Future<void> saveAddressRecord(AddressModel addressModel) async {
    try {
      await _db
          .collection("Users")
          .doc(AuthenticationRepository.instance.authUser?.uid)
          .collection("Address")
          .doc(addressModel.id)
          .set(addressModel.toJson());
    } catch (e) {
      throw 'Error saving address record $e';
    }
  }
}
