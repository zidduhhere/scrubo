import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:scrubo/utils/constants/uiconstants.dart';
import 'package:scrubo/utils/device/device_utility.dart';

///A class for showing a full screen circular progress indicator
class TLodaers {
  /// Displays a loading dialog.
  ///
  /// This function shows a loading dialog with a circular progress indicator.
  /// It is typically used to indicate that a background process is running.
  /// Parameters:
  /// - `BuildContext context`: The build context in which the dialog should be displayed.
  /// - `String message`: The message to be displayed in the dialog.
  /// - `String? text`: The text to be displayed below the circular progress indicator
  /// - `String? animation`: The lottie animation location to be displayed

  static void showFullScreenLoaderDialog(String? text, {String? animation}) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (context) => PopScope(
          canPop: false,
          child: Container(
            color: Theme.of(context).colorScheme.surface,
            height: double.infinity,
            width: double.infinity,
            child: Center(
              child: TAnimationLoaderWidget(
                  animation: animation ?? TLotties.animationLoading,
                  text: text ?? 'Please wait...'),
            ),
          )),
    );
  }

  static void showCircularIndicatorFullScreenLoaderDialog(String? text) {
    showDialog(
      context: Get.overlayContext!,
      builder: (context) => PopScope(
          canPop: false,
          child: Container(
            color: Theme.of(context).colorScheme.surface,
            height: double.infinity,
            width: double.infinity,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircularProgressIndicator(),
                  const SizedBox(height: TUiConstants.defaultSpacing),
                  Text(
                    text ?? 'Please wait...',
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                  ),
                ],
              ),
            ),
          )),
    );
  }

  //Stop the current open loading dialog
  //This method doesn't have any parameteres or return type
  ///Parameters:
  ///- `void`: This method doesn't have any parameters
  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}

///A custom class for showing a circular progress indicator with lottie animation
///This class is used to show a circular progress indicator with a message and an action button
///Parameters:
///- `String? animation`: The lottie animation location to be displayed, this is made optional because the implementation of the lottie animation is removed
///- `String text`: The text to be displayed below the circular progress indicator
///- `bool showAction`: A boolean value to determine if the action button should be displayed
///- `String? actionText`: The text to be displayed on the action button
///- `VoidCallback? action`: The action to be performed when the action button is clicked
///- `Key? key`: The key to be used for the widget
///
class TAnimationLoaderWidget extends StatelessWidget {
  const TAnimationLoaderWidget(
      {super.key,
      required this.animation,
      required this.text,
      this.showAction = false,
      this.actionText,
      this.action})
      : assert(!showAction || actionText != null && action != null,
            'actionText and action must be provided when showAction is true');
  final String animation;
  final String text;
  final bool showAction;
  final String? actionText;
  final VoidCallback? action;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset(animation,
              width: TDeviceUtility.getDeviceWidth(context), height: 300),
          const SizedBox(height: TUiConstants.defaultSpacing),
          Text(
            text,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: TUiConstants.defaultSpacing),
          showAction
              ? SizedBox(
                  width: 250,
                  child: OutlinedButton(
                      onPressed: action, child: Text(actionText!)),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
