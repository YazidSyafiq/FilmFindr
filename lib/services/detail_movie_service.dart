import 'package:dio/dio.dart';
import 'package:filmfindr/constants/api_key.dart';
import 'package:filmfindr/models/detail_movie_response_model.dart';
import 'package:filmfindr/models/similar_movie_response_model.dart';
import 'package:filmfindr/utils/base_url.dart';

class DetailMovieService {
  static Dio dio = Dio();
  static String token = ApiKey.token;

  // Service untuk mengambil data detail movie dari API
  static Future<DetailMovieResponseModel> getDetailMovie(
      {required int movieId}) async {
    try {
      final response = await dio.get(
        '${BaseUrl.baseUrl}/movie/$movieId',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );

      return DetailMovieResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      throw e.toString();
    }
  }

  // Service untuk mengambil data similar movie dari API
  static Future<SimilarMovieResponseModel> getSimilarMovie(
      {required int movieId}) async {
    try {
      final response = await dio.get(
        '${BaseUrl.baseUrl}/movie/$movieId/similar',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );

      return SimilarMovieResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      throw e.toString();
    }
  }
}
