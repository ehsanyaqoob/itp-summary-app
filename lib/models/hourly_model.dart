import '../utills/export.dart';

class HourlyDetailsModel {
  final String title;
  final String value;
  final String percentage;
  final Color percentageColor;
  final Widget route;

  HourlyDetailsModel({
    required this.title,
    required this.value,
    required this.percentage,
    required this.percentageColor,
    required this.route,
  });

  factory HourlyDetailsModel.fromJson(Map<String, dynamic> json) {
    return HourlyDetailsModel(
      title: json['title'],
      value: json['value'],
      percentage: json['percentage'],
      percentageColor: json['percentageColor'] == "green"
          ? Colors.green
          : Colors.purple,
      route: json['route'], 
    );
  }
}
