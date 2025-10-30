// controllers/home_controller.dart
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:trafficlly/controllers/challans_controller.dart';
import 'package:trafficlly/controllers/home_animate.dart';

class HomeController extends GetxController {
  final ChallanController challanController = Get.find<ChallanController>();
  final AnimationControllerX animationController = Get.put(AnimationControllerX());
  
  final RxInt touchedIndex = (-1).obs;
  final RxBool showAmountAxis = true.obs;
  final _backPressCounter = 0.obs;
  DateTime? _lastPressed;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  Future<void> fetchData() async {
    await challanController.fetchChallanDataWithDelay;
  }

  void toggleView() {
    showAmountAxis.toggle();
    animationController.toggleAnimation();
  }

  Future<bool> onWillPop() async {
    DateTime now = DateTime.now();
    if (_lastPressed == null ||
        now.difference(_lastPressed!) > const Duration(seconds: 2)) {
      _lastPressed = now;
      _backPressCounter.value = 1;
      Get.snackbar(
        "Exit",
        "Press back again to exit",
        duration: const Duration(seconds: 2),
      );
      return false;
    }
    SystemNavigator.pop();
    return true;
  }
}