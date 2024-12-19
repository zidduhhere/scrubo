import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:scrubo/data/repositories/user/user_repository.dart';
import 'package:scrubo/pages/authentication/models/user_model.dart';
import 'package:scrubo/utils/device/permission_handling.dart';
import 'package:scrubo/utils/exceptions/custom_firebase_auth_exception.dart';
import 'package:scrubo/utils/helpers/custom_snackbar.dart';

class UserController extends GetxController {
  Rx<UserModel> user = UserModel.empty().obs;

  static UserController get instance => Get.find();

  final userRepository = Get.put(UserRepository());
  final profileLoading = false.obs;

  @override
  void onInit() async {
    await fetchUserDetails();
    super.onInit();
  }

  Future<void> fetchUserDetails() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserRecord();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  Future<void> saveUserRecord({
    required UserCredential? userCredential,
    required String displayName,
    required String userName,
    required String phoneNumber,
  }) async {
    await fetchUserDetails();

    if (user.value.id.isEmpty) {
      try {
        if (userCredential != null) {
          final nameParts = displayName.split(' ');

          final UserModel userModel = UserModel(
            id: userCredential.user?.uid ?? '',
            email: userCredential.user?.email ?? '',
            username: userName,
            firstName: nameParts[0],
            lastName: nameParts[1],
            phoneNumber: userCredential.user!.phoneNumber ?? '',
            photoUrl: userCredential.user?.photoURL ?? '',
          );

          await userRepository.saveUserRecord(userModel);
        }
      } on FirebaseAuthException catch (e) {
        throw FirebaseAuthException(code: e.code, message: e.message);
      } catch (e) {
        rethrow;
      }
    }
  }

  Future<void> uploadProfilePicture() async {
    try {
      final imagePicker = ImagePicker();
      await TPermissionHandler.handlePermissions(permission: Permission.camera);
      final XFile? image = await imagePicker.pickImage(
        source: ImageSource.camera,
        imageQuality: 70,
        maxHeight: 520,
        maxWidth: 520,
      );
      if (image != null) {
        final imageUrl = await userRepository.uploadUserProfilePicture(
            "Users/Images/Profile", image);

        Map<String, dynamic> data = {'Photo': imageUrl};
        await userRepository.updateSingleField(data);
        user.value.photoUrl = imageUrl;
        TSnackBars.successSnackBar(
            'Profile Picture', 'Profile picture uploaded successfully');
        user.refresh();
      }
    } on FirebaseException catch (e) {
      TFirebaseAuthException authException =
          TFirebaseAuthException(code: e.code);
      TSnackBars.errorSnackBar(authException.title, authException.message);
    } catch (e) {
      throw 'Something went wrong, please try again';
    }
  }
}
