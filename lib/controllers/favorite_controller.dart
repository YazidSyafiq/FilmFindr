import 'package:filmfindr/constants/snackbar_style_constant.dart';
import 'package:filmfindr/models/favorite_movie_response_model.dart';
import 'package:filmfindr/services/favorite_service.dart';
import 'package:get/get.dart';

class FavoriteController extends GetxController {
  RxBool isLoadingFavorite = false.obs;
  RxList<FavoriteMovieModel> favoriteMovie = <FavoriteMovieModel>[].obs;
  RxMap<int, bool> isLoadingItem = <int, bool>{}.obs;

  // Menginisialisasi controller dengan memanggil 'fetchFavoriteMovie()'
  @override
  void onInit() {
    fetchFavoriteMovie();
    super.onInit();
  }

  // Fungsi untuk mendapatkan data favorite movie
  void fetchFavoriteMovie() async {
    isLoadingFavorite.value = true;
    favoriteMovie.clear();
    try {
      final response = await FavoriteService.getFavoriteMovie();
      favoriteMovie.value = response.results ?? [];
    } catch (e) {
      SnackbarStyleConstant.errorSnackBar(
        e.toString(),
      );
    } finally {
      isLoadingFavorite.value = false;
    }
  }

  // Fungsi untuk add atau remove movie dari list favorite movie
  void addRemoveFavorite(int movieId) async {
    isLoadingItem[movieId] = true;
    try {
      int index = favoriteMovie.indexWhere(
        (favorite) => favorite.id == movieId,
      );

      if (index != -1) {
        await FavoriteService.addAndRemoveFavorite(movieId, false);
      } else {
        await FavoriteService.addAndRemoveFavorite(movieId, true);
      }
      fetchFavoriteMovie();
    } catch (e) {
      SnackbarStyleConstant.errorSnackBar(
        e.toString(),
      );
    } finally {
      isLoadingItem[movieId] = false;
    }
  }
}
