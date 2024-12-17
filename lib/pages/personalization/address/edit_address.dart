import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrubo/pages/personalization/controllers/address_controller.dart';
import 'package:scrubo/pages/personalization/models/address_model.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';
import 'package:scrubo/utils/device/device_utility.dart';
import 'package:scrubo/utils/widgets/buttons/custom_elevated_button.dart';
import 'package:scrubo/utils/widgets/headings/custom_app_bar.dart';
import 'package:scrubo/utils/widgets/textfield/custom_text_field.dart';

class EditAddressView extends StatelessWidget {
  const EditAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    final addressController = AddressController.instance;
    final arguments = Get.arguments as Map<String, dynamic>;
    final AddressModel addressModel = arguments['addressModel'];
    return GestureDetector(
      onTap: () => TDeviceUtility.hideKeyboard(context),
      child: Scaffold(
        appBar: const TCustomSimpleAppbar(
          title: 'Edit Address',
          implyLeading: true,
        ),
        body: Obx(
          () {
            if (addressController.addressLoading.value) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            addressController.nameController.value.text = addressModel.name;
            addressController.phoneNumberController.value.text =
                addressModel.phoneNumber;
            addressController.postalController.value.text =
                addressModel.postalCode;
            addressController.streetController.value.text = addressModel.street;
            addressController.cityController.value.text = addressModel.city;
            addressController.stateController.value.text = addressModel.state;
            addressController.addressController.value.text =
                addressModel.address;
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(TUiConstants.defaultSpacing),
                child: Column(
                  children: [
                    CustomAddressDropDown(
                      addressType: addressModel.type,
                    ),
                    const SizedBox(height: TUiConstants.defaultSpacing),
                    TCustomSimpleTextField(
                      obscureText: false,
                      hintText: 'John Doe',
                      prefixIcon: TUiConstants.iconUser,
                      labelText: 'Name',
                      textFieldController:
                          addressController.nameController.value,
                    ),
                    const SizedBox(height: TUiConstants.defaultSpacing),
                    TCustomSimpleTextField(
                      obscureText: false,
                      hintText: '+91 1234567890',
                      prefixIcon: TUiConstants.iconPhone,
                      labelText: 'Phone Number',
                      textFieldController:
                          addressController.phoneNumberController.value,
                    ),
                    const SizedBox(height: TUiConstants.defaultSpacing),
                    Row(
                      children: [
                        Expanded(
                          flex: 5,
                          child: TCustomSimpleTextField(
                            obscureText: false,
                            hintText: '691515',
                            prefixIcon: TUiConstants.iconPostalCode,
                            labelText: 'Postal Code',
                            textFieldController:
                                addressController.postalController.value,
                          ),
                        ),
                        const SizedBox(width: TUiConstants.defaultSpacing),
                        Expanded(
                          flex: 5,
                          child: TCustomSimpleTextField(
                            obscureText: false,
                            hintText: 'House No. 123',
                            prefixIcon: TUiConstants.iconStreet,
                            labelText: 'Street',
                            textFieldController:
                                addressController.streetController.value,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: TUiConstants.defaultSpacing),
                    Row(
                      children: [
                        Expanded(
                          flex: 5,
                          child: TCustomSimpleTextField(
                            obscureText: false,
                            hintText: 'Kashmir',
                            prefixIcon: TUiConstants.iconCity,
                            labelText: 'City',
                            textFieldController:
                                addressController.cityController.value,
                          ),
                        ),
                        const SizedBox(width: TUiConstants.defaultSpacing),
                        Expanded(
                          flex: 5,
                          child: TCustomSimpleTextField(
                            obscureText: false,
                            hintText: 'Kashmir',
                            prefixIcon: TUiConstants.iconState,
                            labelText: 'State',
                            textFieldController:
                                addressController.stateController.value,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: TUiConstants.defaultSpacing),
                    SizedBox(
                      height: 60,
                      child: TCustomSimpleTextField(
                        obscureText: false,
                        hintText: 'Complete Address',
                        prefixIcon: TUiConstants.iconLocation,
                        labelText: 'Address',
                        textFieldController:
                            addressController.addressController.value,
                      ),
                    ),
                    const SizedBox(height: TUiConstants.spaceBtwSections),
                    SizedBox(
                      width: double.infinity,
                      child: CustomElevatedButton(
                        onTap: () async {
                          await addressController.editAddress(addressModel);
                          Get.back();
                        },
                        text: 'Save',
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class CustomAddressDropDown extends StatelessWidget {
  const CustomAddressDropDown({
    super.key,
    this.addressType,
  });

  final String? addressType;
  @override
  Widget build(BuildContext context) {
    final addressController = AddressController.instance;
    return DropdownButtonFormField(
        value: addressType ?? addressController.addressType.value,
        icon: const Icon(TUiConstants.iconHome),
        decoration: const InputDecoration(
          labelText: 'Address Type',
        ),
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
        items: const [
          DropdownMenuItem(
            value: 'Home',
            child: Text('Home'),
          ),
          DropdownMenuItem(
            value: 'Work',
            child: Text('Work'),
          ),
          DropdownMenuItem(
            value: 'Guest House',
            child: Text('Guest House'),
          ),
        ],
        onChanged: (value) {
          addressController.addressType.value = value.toString();
        });
  }
}
