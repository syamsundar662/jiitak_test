import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImageSelectorController extends GetxController {
  var pickedFiles = <XFile?>[null, null, null].obs;

  void imagePicker(int index) async {
    final selectedFiles =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (selectedFiles != null) {
      final validIndex = index.clamp(0, pickedFiles.length - 1);
      pickedFiles[validIndex] = selectedFiles;
    }
  }
}
