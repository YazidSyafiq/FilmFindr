import 'package:dio/dio.dart';
import 'package:filmfindr/constants/api_key.dart';
import 'package:filmfindr/models/favorite_movie_response_model.dart';
import 'package:filmfindr/utils/base_url.dart';

class FavoriteService {
  static Dio dio = Dio();
  static String token = ApiKey.token;

  // Service untuk mengambil data favorite movie dari API
  static Future<FavoriteMovieResponseModel> getFavoriteMovie() async {
    try {
      final response = await dio.get(
        '${BaseUrl.baseUrl}account/21418558/favorite/movies',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );
      return FavoriteMovieResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      throw e.toString();
    }
  }

  // Service untuk add atau remove favorite movie dari API
  static Future<void> addAndRemoveFavorite(int movieId, bool isFavorite) async {
    await dio.post(
      '${BaseUrl.baseUrl}account/21418558/favorite',
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
      data: {
        "media_type": "movie",
        "media_id": movieId,
        "favorite": isFavorite,
      },
    );
  }
}
