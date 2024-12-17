import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrubo/pages/personalization/models/vehicle_model.dart';
import 'package:scrubo/pages/personalization/controllers/address_controller.dart';
import 'package:scrubo/pages/personalization/widgets/custom_vehicle_container.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';
import 'package:scrubo/utils/widgets/headings/custom_app_bar.dart';

class VehiclesView extends StatelessWidget {
  const VehiclesView({super.key});

  @override
  Widget build(BuildContext context) {
    final addressController = Get.put(AddressController());
    return Obx(
      () => Scaffold(
        appBar: const TCustomSimpleAppbar(
            title: 'Vehicles', leading: TUiConstants.iconBack),
        floatingActionButton: FloatingActionButton(
          backgroundColor: addressController.addresess.length <= 3
              ? Theme.of(context).colorScheme.surfaceContainerHigh
              : Theme.of(context).colorScheme.primaryContainer,
          onPressed: addressController.addresess.length == 3
              ? null
              : () => Get.toNamed('/profile/address/add'),
          child: Icon(
            TUiConstants.iconAdd,
            color: Theme.of(context).colorScheme.onSecondaryContainer,
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.all(TUiConstants.defaultSpacing),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: TUiConstants.defaultSpacing),
                  Obx(
                    () {
                      if (addressController.addressLoading.value) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (addressController.addresess.isEmpty) {
                        return const Center(
                          child: Text('No address found'),
                        );
                      }
                      return Column(
                        children: addressController.addresess
                            .map((address) => TSingleVehicle(
                                  model: VehicleModel(
                                      type: '4 Wheeler',
                                      id: '12',
                                      model: 'XUV 500',
                                      make: 'W11',
                                      company: 'Mahindra',
                                      registrationNumber: 'KL 01 CN 1700',
                                      color: 'White',
                                      photoUrl: ' ',
                                      description: 'Nothing'),
                                  isSelected: false,
                                  onPressed: () => Get.toNamed(
                                      '/profile/address/edit',
                                      arguments: {
                                        'addressModel': address,
                                      }),
                                ))
                            .toList(),
                      );
                    },
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
