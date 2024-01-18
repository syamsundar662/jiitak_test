import 'package:get/state_manager.dart';

class AppController extends GetxController{
  RxBool isSelected = false.obs;

  RxList<bool> likeStatusList = List.generate(5, (index) => false).obs;

  void toggleLike(int index) {
    likeStatusList[index] = !likeStatusList[index];
  }
  
}