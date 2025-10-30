import 'package:flutter_svg/flutter_svg.dart';
import 'package:trafficlly/utills/export.dart';

class CustomBarNavBar extends StatefulWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? avatar;
  final String? welcomeText;
  final String? userName;
  final Widget? trailingWidget;
  final Gradient? gradient;
  final double? height;

  const CustomBarNavBar({
    super.key,
    this.title,
    this.avatar,
    this.welcomeText,
    this.userName,
    this.trailingWidget,
    this.gradient,
    this.height = 200,
  });

  @override
  State<CustomBarNavBar> createState() => _CustomBarNavBarState();

  @override
  Size get preferredSize => Size.fromHeight(height ?? 300.h);
}

class _CustomBarNavBarState extends State<CustomBarNavBar> {
  bool _isExpanded = false;

  void _toggleExpansion() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: widget.height ?? 200.h,
              decoration: BoxDecoration(
                gradient: widget.gradient ??
                    LinearGradient(
                      colors: [
                        AppColors.appPrimary,
                        AppColors.appPrimary.withOpacity(0.9),
                        AppColors.appPrimary.withOpacity(0.8),
                        AppColors.lime.withOpacity(0.8),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (widget.title != null)
                      Text(
                        widget.title!,
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 22.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    SizedBox(height: 6.h),
                    SvgPicture.asset('assets/svg/line.svg'),
                    SizedBox(height: 16.h),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: _toggleExpansion,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Icon(
                                _isExpanded
                                    ? Icons.keyboard_arrow_up
                                    : Icons.keyboard_arrow_down,
                                color: AppColors.appPrimary,
                                size: 30,
                              ),
                              Positioned(
                                right: 0,
                                child: CircleAvatar(
                                  radius: 35.r,
                                  backgroundImage:
                                      AssetImage('assets/png/Ellipse.png'),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (widget.welcomeText != null)
                              Text(
                                widget.welcomeText!,
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            if (widget.userName != null)
                              Text(
                                widget.userName!,
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                          ],
                        ),
                        Spacer(),
                        if (widget.trailingWidget != null) widget.trailingWidget!,
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        if (_isExpanded)
          Container(
            height: 100.h,
            width: double.infinity,
            margin: const EdgeInsets.only(top: 8.0),
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0, 4),
                  blurRadius: 10,
                ),
              ],
            ),
            child: Text(
              "News & Events",
              style: TextStyle(
                color: AppColors.appPrimary,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
      ],
    );
  }
}
