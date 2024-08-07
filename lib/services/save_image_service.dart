import 'package:dio/dio.dart';

class SaveImageService {
  static Dio dio = Dio();

  static Future<void> saveImage(String urlPoster, String filePath) async {
    try {
      String imageUrl =
          'https://media.themoviedb.org/t/p/w220_and_h330_face$urlPoster';

      await dio.download(imageUrl, filePath);
    } on DioException catch (e) {
      throw e.toString();
    }
  }
}
