import 'package:get/get.dart';

class MainTransportController extends GetxController {
  static MainTransportController get instance => Get.find();

  //final TranlationController = PageController();
  Rx<int> currentPositionIndex = 0.obs;

  // translate upward
  void upwardTranslation() {
    currentPositionIndex.value = 1;
  }

  // translate downward
  void downwardTranslation() {
    currentPositionIndex.value = 0;
  }
}
