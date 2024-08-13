import 'package:get/get.dart';

class SliderController extends GetxController {
  RxInt currentIndex = 0.obs;

  int get getCurrentIndex => currentIndex.value;

  void changeIndex(int index) {
    currentIndex(index);
  }
}
