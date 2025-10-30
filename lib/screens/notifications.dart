import 'package:trafficlly/utills/export.dart';
import 'package:trafficlly/widgets/App_Bar_Widget.dart';

import '../controllers/notify_controller.dart';
import '../models/notify_model.dart';

class NotificationsView extends StatelessWidget {
  final NotificationsController controller = Get.put(NotificationsController());

  NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      appBar: CustomAppBar(
        title: "Notifications", 
      ),
      body: Obx(() {
        if (controller.notifications.isEmpty) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.notifications_off, size: 80, color: Colors.grey),
                SizedBox(height: 10),
                Text("No Notifications Yet!", style: TextStyle(fontSize: 18, color: Colors.grey)),
              ],
            ),
          );
        }

        return ListView.builder(
          padding: EdgeInsets.all(16),
          itemCount: controller.notifications.length,
          itemBuilder: (context, index) {
            final notification = controller.notifications[index];
            return NotificationCard(notification: notification);
          },
        );
      }),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final NotificationModel notification;

  const NotificationCard({Key? key, required this.notification}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: AppColors.primary.withOpacity(0.1),
          child: Icon(notification.icon, color: AppColors.primary),
        ),
        title: Text(notification.title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(notification.message),
        trailing: Text(notification.time, style: TextStyle(color: Colors.grey, fontSize: 12)),
      ),
    );
  }
}
