import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrubo/pages/personalization/controllers/vehicles_controller.dart';
import 'package:scrubo/pages/personalization/models/vehicle_model.dart';
import 'package:scrubo/pages/personalization/widgets/custom_vehicle_container.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';
import 'package:scrubo/utils/widgets/headings/custom_app_bar.dart';

class VehiclesView extends StatelessWidget {
  const VehiclesView({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final vehicleController = Get.put(VehiclesController());
    return Obx(
      () => Scaffold(
        appBar: const TCustomSimpleAppbar(
            title: 'Vehicles', leading: TUiConstants.iconBack),
        floatingActionButton: FloatingActionButton(
          backgroundColor: vehicleController.vehicles.length <= 3
              ? Theme.of(context).colorScheme.surfaceContainerHigh
              : Theme.of(context).colorScheme.primaryContainer,
          onPressed: () => Get.toNamed('/profile/vehicles/add'),
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
                      if (vehicleController.isLoading.value) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (vehicleController.vehicles.isEmpty) {
                        return const Center(
                          child: Text('No address found'),
                        );
                      }
                      return Column(
                        children: vehicleController.vehicles
                            .map((address) => TSingleVehicle(
                                  model: VehicleModel(
                                      type: '4x4 wheeler',
                                      model: 'XUV 500',
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
