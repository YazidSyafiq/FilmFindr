import 'package:dio/dio.dart';
import 'package:filmfindr/constants/api_key.dart';
import 'package:filmfindr/models/popular_movie_response_model.dart';
import 'package:filmfindr/utils/base_url.dart';

class PopularMovieService {
  static Dio dio = Dio();

  static Future<PopularMovieResponseModel> getPopularMovie() async {
    try {
      String token = ApiKey.token;
      final response = await dio.get(
        '${BaseUrl.baseUrl}movie/popular',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );

      return PopularMovieResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      throw e.toString();
    }
  }
}
