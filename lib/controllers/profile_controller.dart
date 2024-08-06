import 'package:filmfindr/constants/snackbar_style_constant.dart';
import 'package:filmfindr/models/detail_profile_response_model.dart';
import 'package:filmfindr/services/profile_service.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  RxBool isLoadingProfile = false.obs;
  Rx<DetailProfileResponseModel> profile = DetailProfileResponseModel().obs;

  @override
  void onInit() {
    getProfile();
    super.onInit();
  }

  void getProfile() async {
    isLoadingProfile.value = true;
    try {
      final response = await ProfileService.getProfile();
      profile.value = response;
    } catch (e) {
      SnackbarStyleConstant.errorSnackBar(
        e.toString(),
      );
    } finally {
      isLoadingProfile.value = false;
    }
  }
}
