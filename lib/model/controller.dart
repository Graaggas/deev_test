import 'package:get/get.dart';

class ContainerCardController extends GetxController {
  var tappedIndex = 0.obs;

  int getIndex() {
    var resp = tappedIndex.value;
    return resp;
  }

  void setIndex(int index) {
    tappedIndex.value = index;
    update();
  }
}
