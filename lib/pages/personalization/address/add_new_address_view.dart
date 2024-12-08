import 'package:flutter/material.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';
import 'package:scrubo/utils/device/device_utility.dart';
import 'package:scrubo/utils/widgets/buttons/custom_elevated_button.dart';
import 'package:scrubo/utils/widgets/headings/custom_app_bar.dart';
import 'package:scrubo/utils/widgets/textfield/custom_text_field.dart';

class AddNewAddressView extends StatelessWidget {
  const AddNewAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => TDeviceUtility.hideKeyboard(context),
      child: Scaffold(
        appBar: const TCustomSimpleAppbar(
          title: 'Add New Address',
          implyLeading: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TUiConstants.defaultSpacing),
            child: Column(
              children: [
                TCustomSimpleTextField(
                  obscureText: false,
                  hintText: 'John Doe',
                  prefixIcon: TUiConstants.iconUser,
                  labelText: 'Name',
                  textFieldController: TextEditingController(),
                ),
                const SizedBox(height: TUiConstants.defaultSpacing),
                TCustomSimpleTextField(
                  obscureText: false,
                  hintText: '+91 1234567890',
                  prefixIcon: TUiConstants.iconPhone,
                  labelText: 'Phone Number',
                  textFieldController: TextEditingController(),
                ),
                const SizedBox(height: TUiConstants.defaultSpacing),
                Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: TCustomSimpleTextField(
                        obscureText: false,
                        hintText: 'House No. 123',
                        prefixIcon: TUiConstants.iconStreet,
                        labelText: 'Street',
                        textFieldController: TextEditingController(),
                      ),
                    ),
                    const SizedBox(width: TUiConstants.defaultSpacing),
                    Expanded(
                      flex: 5,
                      child: TCustomSimpleTextField(
                        obscureText: false,
                        hintText: '691515',
                        prefixIcon: TUiConstants.iconPostalCode,
                        labelText: 'Postal Code',
                        textFieldController: TextEditingController(),
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
                        textFieldController: TextEditingController(),
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
                        textFieldController: TextEditingController(),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: TUiConstants.spaceBtwSections),
                SizedBox(
                  width: double.infinity,
                  child: CustomElevatedButton(onTap: () {}, text: 'Save'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
