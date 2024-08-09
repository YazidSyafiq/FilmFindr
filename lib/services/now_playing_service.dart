import 'package:dio/dio.dart';
import 'package:filmfindr/constants/api_key.dart';
import 'package:filmfindr/models/now_playing_response_model.dart';
import 'package:filmfindr/utils/base_url.dart';

class NowPlayingService {
  static Dio dio = Dio();

  // Service untuk mengambil data now playing movie dari API
  static Future<NowPlayingResponseModel> getNowPlaying() async {
    try {
      String token = ApiKey.token;
      final response = await dio.get(
        '${BaseUrl.baseUrl}movie/now_playing',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );

      return NowPlayingResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      throw e.toString();
    }
  }
}
