import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrubo/pages/personalization/address/custom_address_container.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';
import 'package:scrubo/utils/widgets/headings/custom_app_bar.dart';

class UserAddressView extends StatelessWidget {
  const UserAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TCustomSimpleAppbar(
          title: 'Addresses', leading: TUiConstants.iconBack),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed('/profile/address/add'),
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
                TSingleAddress(
                  onPressed: () {},
                  isSelected: true,
                ),
                TSingleAddress(
                  onPressed: () {},
                  isSelected: false,
                ),
                TSingleAddress(
                  onPressed: () {},
                  isSelected: false,
                ),
                TSingleAddress(
                  onPressed: () {},
                  isSelected: false,
                ),
              ],
            ),
          )),
    );
  }
}
