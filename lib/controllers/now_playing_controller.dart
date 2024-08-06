import 'package:filmfindr/constants/snackbar_style_constant.dart';
import 'package:filmfindr/models/now_playing_response_model.dart';
import 'package:filmfindr/services/now_playing_service.dart';
import 'package:get/get.dart';

class NowPlayingController extends GetxController {
  RxBool isLoadingNowPlaying = false.obs;
  RxList<NowPlayingModel> listNowPlaying = <NowPlayingModel>[].obs;

  @override
  void onInit() {
    fetchNowPlaying();
    super.onInit();
  }

  void fetchNowPlaying() async {
    isLoadingNowPlaying.value = true;
    listNowPlaying.clear();
    try {
      final response = await NowPlayingService.getNowPlaying();
      listNowPlaying.value = response.results ?? [];
    } catch (e) {
      SnackbarStyleConstant.errorSnackBar(
        e.toString(),
      );
    } finally {
      isLoadingNowPlaying.value = false;
    }
  }
}
