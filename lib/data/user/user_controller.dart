import 'package:get/get.dart';
import 'package:scrubo/data/user/user_repository.dart';
import 'package:scrubo/pages/authentication/models/user_model.dart';

class UserController extends GetxController {
  Rx<UserModel?> user = UserModel.empty().obs;

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
      print(e);
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }
}
