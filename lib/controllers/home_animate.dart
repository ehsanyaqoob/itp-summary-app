// controllers/animation_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnimationControllerX extends GetxController 
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    animation = Tween<double>(begin: 0, end: 1).animate(animationController);
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }

  void toggleAnimation() {
    animationController.reset();
    animationController.forward();
  }
}