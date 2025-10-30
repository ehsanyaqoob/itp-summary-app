import 'package:trafficlly/utills/export.dart';

import '../models/notify_model.dart';

class NotificationsController extends GetxController {
  var notifications = <NotificationModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchNotifications();
  }

  void fetchNotifications() {
    notifications.addAll([
      NotificationModel(
          title: "Speed Limit Exceeded",
          message: "You exceeded the speed limit in Zone 5!",
          time: "5 min ago",
          icon: Icons.speed),
      NotificationModel(
          title: "Fine Issued",
          message: "A new fine has been issued for signal violation.",
          time: "1 hour ago",
          icon: Icons.warning_amber),
      NotificationModel(
          title: "Payment Confirmed",
          message: "Your fine payment has been successfully processed.",
          time: "Yesterday",
          icon: Icons.check_circle),
    ]);
  }
}
