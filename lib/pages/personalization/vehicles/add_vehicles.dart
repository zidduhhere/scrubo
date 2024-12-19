import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrubo/pages/personalization/controllers/address_controller.dart';
import 'package:scrubo/pages/personalization/controllers/vehicles_controller.dart';
import 'package:scrubo/utils/constants/colors.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';
import 'package:scrubo/utils/device/device_utility.dart';
import 'package:scrubo/utils/widgets/buttons/custom_elevated_button.dart';
import 'package:scrubo/utils/widgets/headings/custom_app_bar.dart';
import 'package:scrubo/utils/widgets/textfield/custom_text_field.dart';

class AddNewVehicle extends StatelessWidget {
  const AddNewVehicle({super.key});

  @override
  Widget build(BuildContext context) {
    final addressController = AddressController.instance;
    final vehicleController = VehiclesController.instance;
    return GestureDetector(
      onTap: () => TDeviceUtility.hideKeyboard(context),
      child: Scaffold(
        appBar: const TCustomSimpleAppbar(
          title: 'Add New Vehicle',
          implyLeading: true,
        ),
        body: Obx(
          () {
            if (vehicleController.isLoading.value) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (vehicleController.companies.isEmpty) {
              return const Center(
                child: Text('No companies found'),
              );
            }
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(TUiConstants.defaultSpacing),
                child: Column(
                  children: [
                    const SizedBox(height: TUiConstants.defaultSpacing),
                    TDropDownForm(
                      label: 'Company',
                      value: vehicleController.company.value,
                      onChanged: (value) {
                        vehicleController.company.value = value.toString();
                      },
                      list: vehicleController.companies,
                    ),
                    const SizedBox(height: TUiConstants.defaultSpacing),
                    TDropDownForm(
                      list: vehicleController.models,
                      label: 'Model',
                      value: vehicleController.model.value,
                      onChanged: (value) {
                        vehicleController.model.value = value.toString();
                      },
                    ),
                    const SizedBox(height: TUiConstants.defaultSpacing),
                    Row(
                      children: [
                        Expanded(
                          flex: 5,
                          child: TCustomSimpleTextField(
                            obscureText: false,
                            hintText: 'KL 01 CN 1700',
                            prefixIcon: TUiConstants.iconPostalCode,
                            labelText: 'Registration Number',
                            textFieldController:
                                vehicleController.registrationNumber.value,
                          ),
                        ),
                        const SizedBox(width: TUiConstants.defaultSpacing),
                        Expanded(
                          flex: 5,
                          child: TCustomSimpleTextField(
                            obscureText: false,
                            hintText: 'Cyan Blue',
                            prefixIcon: TUiConstants.iconStreet,
                            labelText: 'Color',
                            textFieldController: vehicleController.color.value,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: TUiConstants.defaultSpacing),
                    TCustomSimpleTextField(
                      obscureText: false,
                      hintText:
                          'Any description on vehicles current condition.',
                      prefixIcon: TUiConstants.iconCity,
                      labelText: 'Description',
                      textFieldController:
                          addressController.cityController.value,
                    ),
                    const SizedBox(width: TUiConstants.defaultSpacing),
                    TDropDownForm(
                        list: vehicleController.vehicleTypes,
                        value: vehicleController.type.value,
                        onChanged: (value) {
                          vehicleController.type.value = value.toString();
                        },
                        label: 'Type of vehicle'),
                    const SizedBox(height: TUiConstants.spaceBtwSections),
                    SizedBox(
                      width: double.infinity,
                      child: CustomElevatedButton(
                          onTap: () async {
                            await addressController.saveAddressRecord();
                            Get.back();
                          },
                          text: 'Save'),
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

class TDropDownForm extends StatelessWidget {
  const TDropDownForm(
      {super.key,
      required this.list,
      required this.value,
      required this.onChanged,
      required this.label});

  final List<String> list;
  final String label;
  final String value;
  final ValueChanged<String?>? onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
        value: value,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: Theme.of(context)
              .textTheme
              .labelMedium!
              .copyWith(color: TColors.lightOnSurface),
        ),
        items: List.generate(list.length, (index) {
          return DropdownMenuItem(
            value: list[index],
            child: Text(
              list[index],
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: TColors.lightOnSurface),
            ),
          );
        }),
        onChanged: onChanged);
  }
}

class CustomAddressDropDown extends StatelessWidget {
  const CustomAddressDropDown({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final addressController = AddressController.instance;
    return DropdownButtonFormField(
        value: addressController.addressType.value,
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
