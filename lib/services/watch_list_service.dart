import 'package:dio/dio.dart';
import 'package:filmfindr/constants/api_key.dart';
import 'package:filmfindr/models/watch_list_response_model.dart';
import 'package:filmfindr/utils/base_url.dart';

class WatchListService {
  static Dio dio = Dio();
  static String token = ApiKey.token;

  // Service untuk mengambil data watch list dari API
  static Future<WatchListResponseModel> getWatchList() async {
    try {
      final response = await dio.get(
        '${BaseUrl.baseUrl}account/21418558/watchlist/movies',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );
      return WatchListResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      throw e.toString();
    }
  }

  // Service untuk add atau remove watch list movie dari API
  static Future<void> addAndRemoveMovieFromWatchList(
      int movieId, bool isWatchList) async {
    await dio.post(
      '${BaseUrl.baseUrl}account/21418558/watchlist',
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
      data: {
        "media_type": "movie",
        "media_id": movieId,
        "watchlist": isWatchList,
      },
    );
  }
}
