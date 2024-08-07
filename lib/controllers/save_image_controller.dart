import 'package:filmfindr/constants/snackbar_style_constant.dart';
import 'package:filmfindr/services/save_image_service.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

class SaveImageController extends GetxController {
  void saveImage(String urlPoster, String movieName) async {
    try {
      final directory = await getExternalStorageDirectory();
      String filePath = '${directory!.path}/Images/$movieName/$urlPoster';

      await SaveImageService.saveImage(urlPoster, filePath);

      SnackbarStyleConstant.successSnackBar(
        'Image berhasil disimpan \n\nFile disimpan di ${directory.path}/Images/$movieName',
      );
    } catch (e) {
      SnackbarStyleConstant.errorSnackBar(
        e.toString(),
      );
    }
  }
}
