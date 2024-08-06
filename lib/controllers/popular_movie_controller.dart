import 'package:filmfindr/constants/snackbar_style_constant.dart';
import 'package:filmfindr/models/popular_movie_response_model.dart';
import 'package:filmfindr/services/popular_movie_service.dart';
import 'package:get/get.dart';

class PopularMovieController extends GetxController {
  RxBool isLoadingPopularMovie = false.obs;
  RxList<PopularMovieModel> popularMovie = <PopularMovieModel>[].obs;

  @override
  void onInit() {
    fetchPopularMovie();
    super.onInit();
  }

  void fetchPopularMovie() async {
    isLoadingPopularMovie.value = true;
    popularMovie.clear();
    try {
      final response = await PopularMovieService.getPopularMovie();
      popularMovie.value = response.results ?? [];
    } catch (e) {
      SnackbarStyleConstant.errorSnackBar(
        e.toString(),
      );
    } finally {
      isLoadingPopularMovie.value = false;
    }
  }
}
