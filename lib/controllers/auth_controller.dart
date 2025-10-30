

import '../utills/export.dart';

class SplashController extends GetxController {
  var showLogo = false.obs;
  var isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
    startAnimation();
  }

  void startAnimation() async {
    await Future.delayed(Duration(seconds: 1));
    showLogo.value = true;
    isLoading.value = true;
    await Future.delayed(Duration(seconds: 3));
    isLoading.value = false;
    await Future.delayed(Duration(seconds: 1));
   navigateToNextScreen();
  }

  void navigateToNextScreen() {
   Get.to(HomeView(),
   transition: Transition.circularReveal,
   duration: Duration(milliseconds: 500)
   );
  }
}
