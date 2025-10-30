import 'package:flutter/material.dart';

class DashboardModel {
  final IconData icon;
  final String label;
  final Color color;
  final Widget? view;

  DashboardModel({required this.icon, required this.label, required this.color, this.view});
}
