import 'package:dio/dio.dart';
import 'package:filmfindr/constants/api_key.dart';
import 'package:filmfindr/models/detail_profile_response_model.dart';
import 'package:filmfindr/utils/base_url.dart';

class ProfileService {
  static Dio dio = Dio();

  // service untuk mengambil data profile dari API
  static Future<DetailProfileResponseModel> getProfile() async {
    try {
      String token = ApiKey.token;
      final response = await dio.get(
        '${BaseUrl.baseUrl}account/21418558',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'aplication/json',
          },
        ),
      );

      return DetailProfileResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      throw e.toString();
    }
  }
}
