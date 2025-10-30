import 'package:flutter/material.dart';

class NotificationModel {
  final String title;
  final String message;
  final String time;
  final IconData icon;

  NotificationModel({required this.title, required this.message, required this.time, required this.icon});
}
