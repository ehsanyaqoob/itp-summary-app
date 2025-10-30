import 'package:trafficlly/utills/export.dart';
import 'custom_text_formfield.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    this.onTap,
    this.topMargin = 0.0,
    this.fillColor = true,
    this.filledColor = const Color.fromARGB(255, 18, 117, 231),
    this.borderColor,
    this.shadow = false,
  });

  final String title;
  final VoidCallback? onTap;
  final double topMargin;
  final bool fillColor;
  final Color? borderColor;
  final Color? filledColor;
  final bool shadow;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(top: topMargin),
        child: Container(
          height: 40.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40.h / 2),
            border: Border.all(
              color: borderColor ?? AppColors.appPrimary,
            ),
            gradient: fillColor
                ? LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      AppColors.primary.withOpacity(0.9),
                      AppColors.secondary.withOpacity(0.9),
                    ],
                  )
                : null,
            color: fillColor
                ? (onTap == null
                    ? filledColor?.withOpacity(0.85) // Disabled state
                    : null) // Null allows gradient to take effect
                : Colors.transparent,
            boxShadow: shadow
                ? [
                    BoxShadow(
                      color: AppColors.appSecondary.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 6,
                      offset: Offset(2, 2),
                    ),
                  ]
                : [],
          ),
          child: Center(
            child: CustomText(
              text: title,
              textAlign: TextAlign.center,
              color: fillColor ? AppColors.white : AppColors.appPrimary,
              fontWeight: FontWeight.w600,
              fontSize: 16.sp,
            ),
          ),
        ),
      ),
    );
  }
}
