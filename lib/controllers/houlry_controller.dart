import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:trafficlly/screens/details_views/total_challans.dart';
import 'package:trafficlly/screens/details_views/total_driving_licences.dart';

import '../models/hourly_model.dart';

class HourlyDetailsController extends GetxController {
  var hourlyDetailsList = <HourlyDetailsModel>[].obs;

  @override
  void onInit() {
    fetchHourlyDetails();
    super.onInit();
  }

  void fetchHourlyDetails() {
    // Simulating API call (Replace this with actual API call)
    List<HourlyDetailsModel> apiData = [
      HourlyDetailsModel(
        title: "Major Challan Hours",
        value: "50:25:06",
        percentage: "↑ 34%",
        percentageColor: Colors.green,
        route: TotalChallansView(),
      ),
      HourlyDetailsModel(
        title: "Major DL Hours",
        value: "125",
        percentage: "↓ 50%",
        percentageColor: Colors.purple,
        route: TotalDrivingLicencesView(),
      ),
    ];
    hourlyDetailsList.assignAll(apiData);
  }
}
