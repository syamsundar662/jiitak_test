import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImageSelectorController extends GetxController {
  var pickedFilesLists = <List<XFile?>>[
    List<XFile?>.filled(3, null),
    List<XFile?>.filled(3, null),
    List<XFile?>.filled(3, null),
    List<XFile?>.filled(3, null),
  ].obs;

  void imagePicker(int rowIndex, int columnIndex) async {
    final selectedFiles =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (selectedFiles != null) {
      final validColumnIndex =
          columnIndex.clamp(0, pickedFilesLists[rowIndex].length - 1);

      pickedFilesLists[rowIndex][validColumnIndex] = selectedFiles;
      pickedFilesLists.refresh();
    }
  }
}
