import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImageSelectorController extends GetxController {
  var pickedFilesLists = <List<XFile?>>[
    List<XFile?>.filled(3, null),
    List<XFile?>.filled(3, null),
    List<XFile?>.filled(3, null),
    List<XFile?>.filled(3, null),
  ].obs;

  var pickedFilesList1 = <XFile?>[null, null, null].obs;


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

void imagePicker2(int index) async {
  final selectedFiles = await ImagePicker().pickImage(source: ImageSource.gallery);

  if (selectedFiles != null) {
    final validIndex = index.clamp(0, pickedFilesList1.length - 1);

    // Replace null with the selected file
    pickedFilesList1[validIndex] = selectedFiles;
  }
}
}
