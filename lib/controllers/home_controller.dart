import 'package:filmfindr/constants/color_constant.dart';
import 'package:filmfindr/models/now_playing_response_model.dart';
import 'package:filmfindr/services/now_playing_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxBool isLoadingNowPlaying = false.obs;
  RxList<NowPlayingModel> listNowPlaying = <NowPlayingModel>[].obs;

  @override
  void onInit() {
    initNowPlaying();
    super.onInit();
  }

  void initNowPlaying() async {
    isLoadingNowPlaying.value = true;
    listNowPlaying.clear();
    try {
      final response = await NowPlayingService.getNowPlaying();
      listNowPlaying.value = response.results ?? [];
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        backgroundColor: ColorCollection.red.withOpacity(0.75),
        colorText: ColorCollection.offWhite,
      );
    } finally {
      isLoadingNowPlaying.value = false;
    }
  }
}
