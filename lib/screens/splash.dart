import 'package:trafficlly/utills/export.dart';
import '../controllers/auth_controller.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    final SplashController controller = Get.put(SplashController());

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.primary.withOpacity(0.95),
              AppColors.appSecondary.withOpacity(0.95),
            ],
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Obx(
                  () => AnimatedOpacity(
                    opacity: controller.showLogo.value ? 1.0 : 0.0,
                    duration: const Duration(seconds: 1),
                    child: Image.asset(
                      Assets.logo,
                      width: 100.w,
                      height: 100.h,
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomText(
                      text: 'Traffic Management Department',
                      color: AppColors.white,
                      fontSize: 13.sp,
                    ),
                    CustomText(
                      text: 'ٹریفک مینجمنٹ ڈیپارٹمنٹ',
                      color: AppColors.white,
                      fontSize: 13.sp,
                    ),
                  ],
                ),

                SizedBox(height: 36.h),
                Column(
                  children: [
                    SizedBox(
                      width: 32,
                      height: 32,
                      child: CircularProgressIndicator(
                        strokeWidth: 2.5,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          AppColors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 12.h),
                    CustomText(
                      text: 'Fetching data...',
                      color: AppColors.white,
                      fontSize: 13.sp,
                      letterSpacing: 0.5,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
