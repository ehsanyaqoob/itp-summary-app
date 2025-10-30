import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trafficlly/models/dash_model.dart';
import 'package:trafficlly/screens/details_views/total_challans.dart';
import 'package:trafficlly/screens/details_views/total_chllan_amount.dart';
import 'package:trafficlly/screens/details_views/total_dl_amount.dart';
import 'package:trafficlly/screens/details_views/total_driving_licences.dart';
import 'package:trafficlly/utills/colors.dart';

class DashboardController extends GetxController {
  // Observable list of dashboard services
  final List<DashboardModel> services = [
    DashboardModel(icon: Icons.assignment, label: "Total Challans", color: AppColors.white, view: TotalChallansView()),
    DashboardModel(icon: Icons.card_membership, label: "Total DL", color: AppColors.white, view: TotalDrivingLicencesView()),
    DashboardModel(icon: Icons.money, label: "Total Challan Amount", color: AppColors.white, view: TotalChallanAmount()),
    DashboardModel(icon: Icons.account_balance_wallet, label: "Total DL Amount", color: AppColors.white, view: TotalDlAmount()),
  ].obs;

  // Navigate to the respective view
  void navigateToDashboardCard(DashboardModel service) {
    if (service.view != null) {
      Get.to(() => service.view!);
    }
  }
}
