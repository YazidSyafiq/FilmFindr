import 'package:dio/dio.dart';
import 'package:filmfindr/models/now_playing_response_model.dart';
import 'package:filmfindr/utils/base_url.dart';

class NowPlayingService {
  static Dio dio = Dio();

  static Future<NowPlayingResponseModel> getNowPlaying() async {
    try {
      String token =
          'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmMDRiZTgwMTdkNzc2MjI1MjEzMGE4MjNiY2FiNGM4ZCIsIm5iZiI6MTcyMjg2MjM3Ni4wNzE2NTEsInN1YiI6IjY2YWNhM2UwY2Y2ZGMxM2JlZjI4Yzg2YSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.ULh4_50eiRs1wRHZYneVEyyonT2fADFuE1z6tp9OF3Q';
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
