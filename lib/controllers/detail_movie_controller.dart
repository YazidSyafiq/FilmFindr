import 'package:filmfindr/constants/snackbar_style_constant.dart';
import 'package:filmfindr/models/detail_movie_response_model.dart';
import 'package:filmfindr/models/similar_movie_response_model.dart';
import 'package:filmfindr/services/detail_movie_service.dart';
import 'package:get/get.dart';

class DetailMovieController extends GetxController {
  DetailMovieController({required this.movieId});
  final int movieId;

  RxBool isLoadingDetailMovie = false.obs;
  Rx<DetailMovieResponseModel> detailMovie = DetailMovieResponseModel().obs;
  RxList<SimilarMovieModel> similarMovie = <SimilarMovieModel>[].obs;

  // Menginisialisasi controller dengan memanggil 'fetchDetailMovie()'
  @override
  void onInit() {
    fetchDetailMovie(movieId: movieId);
    super.onInit();
  }

  // Fungsi untuk mendapatkan data detail movie dan similar movie
  void fetchDetailMovie({required int movieId}) async {
    isLoadingDetailMovie.value = true;
    detailMovie.value = DetailMovieResponseModel();
    similarMovie.clear();
    try {
      final responseDetailMovie = await DetailMovieService.getDetailMovie(
        movieId: movieId,
      );
      final responseSimilarMovie = await DetailMovieService.getSimilarMovie(
        movieId: movieId,
      );

      detailMovie.value = responseDetailMovie;
      similarMovie.value = responseSimilarMovie.results ?? [];
    } catch (e) {
      SnackbarStyleConstant.errorSnackBar(
        e.toString(),
      );
    } finally {
      isLoadingDetailMovie.value = false;
    }
  }
}
