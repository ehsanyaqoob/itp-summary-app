import 'package:trafficlly/screens/notifications.dart';
import 'package:trafficlly/utills/export.dart';
import 'custom_text_formfield.dart';

class HomeAppBar extends StatelessWidget {
  final String userName;
  final bool showGreeting;

  const HomeAppBar({
    Key? key,
    required this.userName,
    this.showGreeting = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        /// 🔹 Left Side (Greeting & Name)
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: userName,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.primary, 
              ),
              if (showGreeting) ...[
                const SizedBox(height: 4),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Analyze your',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.grey[700],
                        ),
                      ),
                      
                     
                      TextSpan(
                        text: 'Department!',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.secondary, // Accent color
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),

        /// 🔹 Right Side (Notification Button)
        GestureDetector(
          onTap: () => Get.to(NotificationsView()),
          child: Stack(
            children: [
              CircleAvatar(
                radius: 18,
                backgroundColor: AppColors.primary.withOpacity(0.1), // Soft Background
                child: const Icon(
                  Icons.notifications,
                  color: AppColors.primary,
                  size: 26,
                ),
              ),
              Positioned(
                right: 2,
                top: 2,
                child: Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    color: Colors.red, // Notification badge color
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 1.5),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
