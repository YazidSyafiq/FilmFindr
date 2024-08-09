import 'package:filmfindr/constants/snackbar_style_constant.dart';
import 'package:filmfindr/models/watch_list_response_model.dart';
import 'package:filmfindr/services/watch_list_service.dart';
import 'package:get/get.dart';

class WatchListController extends GetxController {
  RxBool isLoadingWatchList = false.obs;
  RxList<WatchListModel> watchList = <WatchListModel>[].obs;
  RxMap<int, bool> isLoadingItem = <int, bool>{}.obs;

  // Menginisialisasi controller dengan memanggil 'fetchFavoriteMovie()'
  @override
  void onInit() {
    fetchWatchList();
    super.onInit();
  }

  // Fungsi untuk mengambil data watch list
  void fetchWatchList() async {
    isLoadingWatchList.value = true;
    watchList.clear();
    try {
      final response = await WatchListService.getWatchList();
      watchList.value = response.results ?? [];
    } catch (e) {
      SnackbarStyleConstant.errorSnackBar(
        e.toString(),
      );
    } finally {
      isLoadingWatchList.value = false;
    }
  }

  // Fungsi untuk add atau remove movie dari watch list
  void addRemoveWatchList(int movieId) async {
    isLoadingItem[movieId] = true;
    try {
      int index = watchList.indexWhere(
        (watchList) => watchList.id == movieId,
      );

      if (index != -1) {
        await WatchListService.addAndRemoveMovieFromWatchList(movieId, false);
      } else {
        await WatchListService.addAndRemoveMovieFromWatchList(movieId, true);
      }

      fetchWatchList();
    } catch (e) {
      SnackbarStyleConstant.errorSnackBar(
        e.toString(),
      );
    } finally {
      isLoadingItem[movieId] = false;
    }
  }
}
